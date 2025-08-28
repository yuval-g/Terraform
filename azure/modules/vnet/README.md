# Virtual Network Module

This module creates an Azure Virtual Network with public and private subnets.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | The name of the virtual network | `string` | n/a | yes |
| vnet_cidr | The CIDR block for the virtual network | `string` | n/a | yes |
| location | The location of the virtual network | `string` | n/a | yes |
| resource_group_name | The name of the resource group | `string` | n/a | yes |
| public_subnet_cidrs | The CIDR blocks for the public subnet | `list(string)` | n/a | yes |
| private_subnet_cidrs | The CIDR blocks for the private subnet | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the virtual network |
| name | The name of the virtual network |
| public_subnet_id | The ID of the public subnet |
| private_subnet_id | The ID of the private subnet |