variable "cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

variable "cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the application"
  type        = string
  default     = "default"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "httpd-app"
}

variable "chart_version" {
  description = "Version of the Apache chart"
  type        = string
  default     = "10.2.4"
}

variable "replica_count" {
  description = "Number of replicas for the application"
  type        = number
  default     = 2
}



variable "service_port" {
  description = "Service port"
  type        = number
  default     = 80
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}