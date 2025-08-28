# Azure

## Structure

```
.
├── main.tf                    # Main configuration file
├── variables.tf               # Variable definitions
├── outputs.tf                # Output definitions
├── terraform.tfvars.example  # Example variables file
├── .gitignore                # Git ignore rules
├── README.md                 # This file
└── modules/
    ├── resource_group/       # Azure Resource Group module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── README.md
    ├── vnet/                 # Azure Virtual Network module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── README.md
    ├── aks/                  # Azure Kubernetes Service cluster module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── README.md
    ├── helm/                 # Helm applications module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── README.md
└── scripts/
    ├── deploy.sh             # Deployment script
    └── cleanup.sh            # Cleanup script

```

## Getting Started

### Prerequisites
- **Terraform**
- **Azure CLI**
- **kubectl**
- **helm**

### Azure Authentication
Before running the deployment, ensure you're logged into Azure CLI:
```bash
az login
```

as well as specifing your Azure Subscription ID in the `terraform.tfvars` file.

### Deployment Steps

1. **Configure Azure credentials**: 
   ```bash
   az login
   ```

2. **Copy and customize variables**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your values, including Azure Subscription ID
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Plan the deployment**:
   ```bash
   terraform plan
   ```

5. **Apply the configuration**:
   ```bash
   terraform apply
   ```
