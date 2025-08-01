/*
  Dev Environment: Input Variables

  Defines all input variables required by modules for the 'dev' environment.
  Values are loaded from tfvars or passed at runtime.
*/

# 🔐 Azure Authentication & Subscription

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID where resources will be deployed"
}

# 🌍 Location & Resource Group

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region where all resources will be deployed"
}

variable "resource_group_name" {
  type        = string
  default     = "rg-aks-dev"
  description = "Name of the Azure resource group for the dev environment"
}

# 🏷️ Tags

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    owner       = "neeraj.shorey@gmail.com"
  }
  description = "A map of key-value tags to assign to all resources"
}

# ☸️ AKS Cluster Settings

variable "cluster_name" {
  type        = string
  description = "The name of the AKS (Azure Kubernetes Service) cluster"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.29.2"
  description = "The version of Kubernetes to deploy with the AKS cluster"
}

variable "node_count" {
  type        = number
  default     = 2
  description = "Number of VM nodes in the AKS cluster node pool"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B4ms"
  description = "The size of the virtual machines for the AKS node pool"
}

# 🔐 Secrets & Credentials

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Username for the administrator account on VMs"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Administrator password used for VMs or other components"
}

variable "db_name" {
  type        = string
  description = "Name of the backend database (e.g., PostgreSQL or MySQL)"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Password for the backend database (e.g., PostgreSQL or MySQL)"
}

variable "app_secret" {
  type        = string
  sensitive   = true
  description = "Secret value used by the application (e.g., JWT, API key)"
}

variable "secrets" {
  type        = map(string)
  sensitive   = true
  description = "A map of additional secrets to store in Azure Key Vault"
}

# 🧑‍🤝‍🧑 Azure AD Integration

variable "admin_group_object_id" {
  type        = string
  default     = null
  description = "Object ID of the Azure AD group with AKS admin access"
}

variable "enable_aad_rbac" {
  type        = bool
  default     = false
  description = "Enable Azure Active Directory-based RBAC for AKS"
}

# 📊 Monitoring & Analytics

variable "enable_monitoring" {
  type        = bool
  default     = false
  description = "Enable monitoring integration with Log Analytics Workspace"
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = null
  description = "Resource ID of the Log Analytics Workspace (optional)"
}

# 📧 Notifications

variable "contact_emails" {
  type        = list(string)
  description = "List of contact email addresses for alerting or monitoring"
}

# 📦 Infrastructure Naming

variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry (ACR) to be linked"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine (if applicable)"
}

variable "budget_start_date" {
  type        = string
  description = "Start date of the budget"
}

variable "role_name" {
  type        = string
  description = "Role name to assign"
}

variable "acr_sku" {
  type        = string
  default     = "Premium"
  description = "SKU for the Azure Container Registry (e.g., Basic, Standard, Premium)"
}

variable "acr_admin_enabled" {
  type        = bool
  default     = true
  description = "Enable admin user for the Azure Container Registry"
}

variable "acr_public_network_access_enabled" {
  type        = bool
  default     = true
  description = "Enable public network access for the Azure Container Registry"
}

variable "budget_name" {
  description = "Name of the Azure cost management budget"
  type        = string
}

variable "budget_amount" {
  type        = number
  description = "Monthly budget amount in USD"
}

variable "insights_name" {
  type        = string
  description = "Name of the Application Insights instance"
}

variable "workspace_name" {
  type        = string
  description = "Name of the Log Analytics Workspace"
}

variable "policy_definition_id" {
  type        = string
  description = "ID of the policy definition to assign"
}

variable "allowed_locations" {
  type        = list(string)
  description = "List of allowed Azure locations"
}

variable "identity_name" {
  type        = string
  description = "Name of the user-assigned managed identity"
}

variable "assign_role" {
  type        = bool
  description = "Whether to assign RBAC role to identity"
  default     = false
}

variable "kv_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "private_dns_zone_id" {
  type        = string
  description = "ID of the private DNS zone for database connectivity"
  default     = null  
}