# Configure the AWS Provider
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data sources for EKS cluster authentication
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "tls_certificate" "eks" {
  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}


# Kubernetes provider configuration
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Helm provider configuration
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

# Data source for availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  name               = "${var.project_name}-${var.environment}"
  cluster_name       = "${var.project_name}-${var.environment}-cluster"
  vpc_cidr           = var.vpc_cidr
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 2)
  
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  cluster_name         = "${var.project_name}-${var.environment}-cluster"
  kubernetes_version   = var.kubernetes_version
  subnet_ids           = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  private_subnet_ids   = module.vpc.private_subnet_ids
  
  instance_types     = var.eks_instance_types
  desired_capacity   = var.eks_desired_capacity
  max_capacity       = var.eks_max_capacity
  min_capacity       = var.eks_min_capacity

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Helm Module - Deploy Apache HTTP server
module "helm_httpd" {
  source = "./modules/helm"

  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  cluster_name                      = module.eks.cluster_id
  aws_region                        = var.aws_region
  
  namespace     = var.httpd_namespace
  app_name      = "httpd"
  chart_version = var.httpd_chart_version
  replica_count = var.httpd_replica_count
  
  service_port  = var.httpd_service_port

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  depends_on = [module.eks]
}

# IAM OIDC Provider
resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = module.eks.cluster_oidc_issuer_url

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

# ALB Module
module "alb" {
  source = "./modules/alb"

  cluster_name      = module.eks.cluster_id
  aws_region        = var.aws_region
  oidc_provider_arn = aws_iam_openid_connect_provider.oidc_provider.arn
  vpc_id            = module.vpc.vpc_id

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  depends_on = [module.eks]
}







