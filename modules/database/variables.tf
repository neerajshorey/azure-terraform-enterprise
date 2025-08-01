output "postgresql_fqdn" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}

output "postgresql_id" {
  value = azurerm_postgresql_flexible_server.this.id
}

output "postgresql_version" {
  value = azurerm_postgresql_flexible_server.this.version
}
