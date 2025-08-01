variable "acr_name" {
  description = "Globally unique name of the Azure Container Registry"
  type        = string
}

variable "location" {
  description = "Azure region where ACR will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to create the ACR"
  type        = string
}

variable "sku" {
  description = "SKU of the ACR: Basic, Standard, or Premium"
  type        = string
  default     = "Premium"
}

variable "admin_enabled" {
  description = "Enable admin user on the ACR (not recommended in prod)"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Allow public access to ACR (should be false in prod)"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the ACR"
  type        = map(string)
}

variable "acr_sku" {
  description = "SKU tier of the ACR (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}
