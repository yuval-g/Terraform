# Terraform Project Structure

This repository contains Terraform configurations for deploying infrastructure on both AWS and Azure.

## Directory Structure

- `aws/`: Contains Terraform configurations for AWS resources.
  - `main.tf`, `variables.tf`, `outputs.tf`: Main configuration, variable definitions, and output values for the AWS deployment.
  - `modules/`: Reusable Terraform modules for AWS services.
    - `alb/`: Application Load Balancer module.
    - `eks/`: Elastic Kubernetes Service module.
    - `helm/`: Helm chart deployment module.
    - `vpc/`: Virtual Private Cloud module.
- `azure/`: Contains Terraform configurations for Azure resources.
  - `main.tf`, `variables.tf`, `outputs.tf`: Main configuration, variable definitions, and output values for the Azure deployment.
  - `modules/`: Reusable Terraform modules for Azure services.
    - `aks/`: Azure Kubernetes Service module.
    - `helm/`: Helm chart deployment module.
    - `resource_group/`: Azure Resource Group module.
    - `vnet/`: Virtual Network module.

## Variables

- `terraform.tfvars.example`: An example file showing the structure of `terraform.tfvars`.
