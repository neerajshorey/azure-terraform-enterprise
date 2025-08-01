output "resource_group_name" {
  value       = azurerm_resource_group.tfstate.name
  description = "Name of the resource group created"
}

output "storage_account_name" {
  value       = azurerm_storage_account.tfstate.name
  description = "Name of the storage account created"
}

output "container_name" {
  value       = azurerm_storage_container.tfstate.name
  description = "Name of the container created"
}
