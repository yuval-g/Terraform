variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "location" {
  type        = string
  description = "The location of the AKS cluster."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix for the AKS cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version for the cluster."
  default     = "1.28"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the default node pool."
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machines in the default node pool."
}

variable "vnet_subnet_id" {
  type        = string
  description = "The ID of the subnet to use for the AKS cluster."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = {}
}