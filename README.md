Azure Terraform Enterprise Infrastructure
=========================================

This is a full-scale, production-ready Terraform project for deploying secure, modular, and scalable infrastructure on Microsoft Azure.

This architecture follows the Azure Well-Architected Framework, supports multi-environment deployments, and is designed for real-world enterprise use.

Project Structure

├── modules/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Reusable Terraform modules  
│&nbsp;&nbsp;&nbsp;├── network/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# VNet, Subnets, NSGs  
│&nbsp;&nbsp;&nbsp;├── compute/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# VMSS, Availability Sets  
│&nbsp;&nbsp;&nbsp;├── database/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Azure SQL, CosmosDB, PostgreSQL  
│&nbsp;&nbsp;&nbsp;├── keyvault/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Secret storage  
│&nbsp;&nbsp;&nbsp;├── governance/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Policies, Tags, Management Groups  
│&nbsp;&nbsp;&nbsp;├── aks/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Azure Kubernetes Service  
│&nbsp;&nbsp;&nbsp;├── app_services/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Azure App Services (Web Apps)  
│&nbsp;&nbsp;&nbsp;├── container_registry/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Azure Container Registry (ACR)  
│&nbsp;&nbsp;&nbsp;├── bootstrap/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Resource group and initial setup  
├── envs/  
│&nbsp;&nbsp;&nbsp;├── dev/  
│&nbsp;&nbsp;&nbsp;├── staging/  
│&nbsp;&nbsp;&nbsp;└── prod/  
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── main.tf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Environment-specific entrypoints  
├── .terraform.lock.hcl  
├── .gitignore  
└── README.md  

Features

- Modular design with reusable code
- Multi-environment isolation (dev/staging/prod)
- Azure Key Vault integration for secure secrets
- AKS, App Services, ACR integration
- RBAC, Policies, Management Groups support
- Azure Monitor, Logs, and Alerts
- Terraform Cloud and Remote Backend compatibility
- CI/CD ready structure

Prerequisites

- Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
- Terraform v1.3+: https://developer.hashicorp.com/terraform/downloads
- An Azure subscription with Contributor access
- (Optional) Azure AD Service Principal for automation

Environment Variables (for automation)

Use the following environment variables in CI/CD or .env (never hardcoded):

ARM_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx  
ARM_CLIENT_SECRET=your-client-secret  
ARM_SUBSCRIPTION_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx  
ARM_TENANT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx  
TF_VAR_environment=dev  
TF_VAR_location=eastus  

Usage

1. Select environment:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd envs/dev  

2. Initialize Terraform:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform init

3. Preview infrastructure changes:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform plan -var-file="dev.tfvars"

4. Deploy infrastructure:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform apply -var-file="dev.tfvars"

Security Practices

- Secrets are pulled from Azure Key Vault
- Terraform state and variables are ignored via .gitignore
- Remote backend (Azure Storage) is used for state locking
- Validations via terraform validate and formatting via terraform fmt
- No hardcoded secrets or credentials in code
- .terraform/, .tfvars, .exe, and .tmp are all excluded from Git

Best Practices Followed

- Fully modular architecture (modules/)
- Separate state and config for each environment
- Provider version locking via .terraform.lock.hcl
- Uses Azure tagging, naming, and region standards
- Built-in diagnostics, monitoring, and alerting
- Git hygiene with .gitignore pre-configured

Example Modules

Module              | Description
------------------- | ----------------------------------------
network/            | VNet, Subnets, NSGs
compute/            | VM Scale Sets, Load Balancers
database/           | Azure SQL, PostgreSQL, Cosmos DB
keyvault/           | Secret storage and access policies
governance/         | Policies, Tags, Management Groups
aks/                | Azure Kubernetes Service deployment
app_services/       | Azure App Services (Web Apps, APIs)
container_registry/ | Azure Container Registry (ACR)
bootstrap/          | Resource group and foundational resources

License

This repository is open-source under the MIT License: https://opensource.org/licenses/MIT

Author

Neeraj Shorey    
GitHub: https://github.com/neerajshorey

Tags

terraform, azure, iac, aks, app-services, acr, modules, keyvault, networking, governance, rbac, devops, production, azure-architect
