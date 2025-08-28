# Helm Module

This module deploys applications to a Kubernetes cluster using Helm.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| namespace | Kubernetes namespace for the application | `string` | `"default"` | no |
| app_name | Name of the application | `string` | `"httpd-app"` | no |
| chart_version | Version of the Apache chart | `string` | `"10.2.4"` | no |
| replica_count | Number of replicas for the application | `number` | `2` | no |
| service_type | Service type | `string` | `"LoadBalancer"` | no |
| service_port | Service port | `number` | `80` | no |
| tags | A map of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| release_name | Name of the Helm release |
| release_namespace | Namespace of the Helm release |
| release_version | Version of the Helm release |
| release_status | Status of the Helm release |
| chart_version | Version of the Helm chart used |
| chart_name | Name of the Helm chart used |
| service_name | Name of the Kubernetes service |
| service_type | Type of the Kubernetes service |
| service_ports | Ports exposed by the service |
| load_balancer_ingress | Load balancer ingress points |
| service_external_ip | External IP of the service (if available) |