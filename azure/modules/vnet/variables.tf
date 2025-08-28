variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "vnet_cidr" {
  type        = string
  description = "The CIDR block for the virtual network."
}

variable "location" {
  type        = string
  description = "The location of the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR blocks for the public subnet."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR blocks for the private subnet."
}