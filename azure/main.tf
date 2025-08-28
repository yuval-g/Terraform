provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Resource Group Module
module "resource_group" {
  source = "./modules/resource_group"

  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location
}

# VNet Module
module "vnet" {
  source = "./modules/vnet"

  name                 = "${var.project_name}-${var.environment}-vnet"
  vnet_cidr            = var.vnet_cidr
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# AKS Module
module "aks" {
  source = "./modules/aks"

  cluster_name        = "${var.project_name}-${var.environment}-aks"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = "${var.project_name}-${var.environment}"
  kubernetes_version  = var.kubernetes_version
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
  vnet_subnet_id      = module.vnet.private_subnet_id

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

provider "kubernetes" {
  host                   = module.aks.kube_config_host
  client_certificate     = base64decode(module.aks.kube_config_client_certificate)
  client_key             = base64decode(module.aks.kube_config_client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config_cluster_ca_certificate)
}

provider "helm" {
  kubernetes = {
    host                   = module.aks.kube_config_host
    client_certificate     = base64decode(module.aks.kube_config_client_certificate)
    client_key             = base64decode(module.aks.kube_config_client_key)
    cluster_ca_certificate = base64decode(module.aks.kube_config_cluster_ca_certificate)
  }
}

# Helm Module - Deploy Apache HTTP server
module "helm_httpd" {
  source = "./modules/helm"

  namespace     = var.httpd_namespace
  app_name      = "httpd"
  chart_version = var.httpd_chart_version
  replica_count = var.httpd_replica_count
  service_type  = var.httpd_service_type
  service_port  = var.httpd_service_port

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }

  kube_config_raw = module.aks.kube_config
  depends_on = [module.aks]
}
