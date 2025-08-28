# AWS


## Structure

```
.
├── main.tf                    # Main configuration file
├── variables.tf               # Variable definitions
├── outputs.tf                 # Output definitions
├── terraform.tfvars.example   # Example variables file
├── .gitignore                 # Git ignore rules
├── README.md                  # This file
└── modules/
    ├── vpc/                   # VPC module
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── eks/                   # EKS cluster module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── iam.tf
    ├── helm/                  # Helm applications module
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf

```

## Getting Started

### Prerequisites
- **Terraform**
- **AWS CLI**
- **kubectl**
- **helm**
- 
### Run

1. **Configure AWS credentials**: 
   ```bash
   aws configure
   ```

2. **Copy and customize variables**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your values
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
