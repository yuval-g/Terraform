variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
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

# VNet Variables
variable "vnet_cidr" {
  description = "CIDR block for VNet"
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

# AKS Variables
variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "aks_node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
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

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace"
  type        = string
  default     = null
}

