variable "resource_group_name" {
  type        = string
  default     = "rg-tfstate"
  description = "Resource group name for storing the Terraform state"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "Storage account tier"
}

variable "replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication type for the storage account"
}

variable "container_name" {
  type        = string
  default     = "tfstate"
  description = "Blob container name for storing Terraform state files"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "terraform"
  }
  description = "Tags to apply to resources"
}
