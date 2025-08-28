# AKS Module

This module creates an Azure Kubernetes Service (AKS) cluster.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| cluster_name | The name of the AKS cluster | `string` | n/a | yes |
| location | The location of the AKS cluster | `string` | n/a | yes |
| resource_group_name | The name of the resource group | `string` | n/a | yes |
| dns_prefix | The DNS prefix for the AKS cluster | `string` | n/a | yes |
| kubernetes_version | The Kubernetes version for the cluster | `string` | `"1.28"` | no |
| node_count | The number of nodes in the default node pool | `number` | n/a | yes |
| node_min_count | The minimum number of nodes in the default node pool | `number` | `1` | no |
| node_max_count | The maximum number of nodes in the default node pool | `number` | `3` | no |
| vm_size | The size of the virtual machines in the default node pool | `string` | n/a | yes |
| vnet_subnet_id | The ID of the subnet to use for the AKS cluster | `string` | n/a | yes |
| log_analytics_workspace_id | The ID of the Log Analytics workspace | `string` | `null` | no |
| tags | A map of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the AKS cluster |
| name | The name of the AKS cluster |
| kube_config | The Kubernetes configuration for the cluster |
| kube_config_host | The Kubernetes API server host |
| kube_config_client_certificate | The client certificate for the Kubernetes cluster |
| kube_config_client_key | The client key for the Kubernetes cluster |
| kube_config_cluster_ca_certificate | The cluster CA certificate for the Kubernetes cluster |
| node_resource_group | The resource group where the AKS nodes are deployed |
| private_fqdn | The private FQDN of the AKS cluster |