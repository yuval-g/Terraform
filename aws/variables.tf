variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

# EKS Variables
variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "eks_instance_types" {
  description = "EC2 instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_desired_capacity" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 2
}

variable "eks_max_capacity" {
  description = "Maximum number of EKS nodes"
  type        = number
  default     = 4
}

variable "eks_min_capacity" {
  description = "Minimum number of EKS nodes"
  type        = number
  default     = 1
}

# Helm/Application Variables
variable "httpd_namespace" {
  description = "Kubernetes namespace for httpd application"
  type        = string
  default     = "httpd"
}

variable "httpd_app_name" {
  description = "Name of the httpd application"
  type        = string
  default     = "httpd-app"
}

variable "httpd_chart_version" {
  description = "Version of the Apache Helm chart"
  type        = string
  default     = "10.2.4"
}

variable "httpd_replica_count" {
  description = "Number of httpd replicas"
  type        = number
  default     = 2
}

variable "httpd_service_type" {
  description = "Kubernetes service type for httpd"
  type        = string
  default     = "LoadBalancer"
}

variable "httpd_service_port" {
  description = "Service port for httpd"
  type        = number
  default     = 80
}

