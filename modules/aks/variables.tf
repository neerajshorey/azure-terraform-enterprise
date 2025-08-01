variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group to deploy AKS into"
}

variable "node_count" {
  type        = number
  default     = 2
}

variable "vm_size" {
  type        = string
  default     = "Standard_B4ms"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.29.2"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID of the Log Analytics workspace"
}

variable "acr_id" {
  type        = string
  description = "ID of the Azure Container Registry"
}

variable "admin_group_object_id" {
  type        = string
  description = "AAD group object ID for AKS admin access"
}

variable "tags" {
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "neeraj.shorey@gmail.com"
  }
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

variable "tenant_id" {
  type = string
  description = "Azure Active Directory tenant ID"
}
