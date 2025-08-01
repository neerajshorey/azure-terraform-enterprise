output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  value = { for k, s in azurerm_subnet.this : k => s.id }
}

output "location" {
  value = var.location
}

output "rg_name" {
  value = azurerm_resource_group.this.name
}
