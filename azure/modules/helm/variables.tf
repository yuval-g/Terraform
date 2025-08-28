variable "namespace" {
  description = "Namespace for the Helm release"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "chart_version" {
  description = "Version of the Helm chart"
  type        = string
}

variable "replica_count" {
  description = "Number of replicas for the application"
  type        = number
}

variable "service_type" {
  description = "Service type for the application"
  type        = string
}

variable "service_port" {
  description = "Service port for the application"
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "kube_config_raw" {
  description = "Raw Kubernetes config from AKS cluster"
  type        = string
  sensitive   = true
}