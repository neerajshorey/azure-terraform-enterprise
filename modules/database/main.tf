/*
  Terraform Database Module

  Deploys Azure PostgreSQL Flexible Server with private networking.
  Used to host application data securely inside the virtual network.
*/

resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.db_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  version                = var.postgresql_version
  sku_name               = "B_Standard_B1ms"  # Burstable, low-cost
  storage_mb             = 32768
  zone                   = "1"

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  # No HA settings required for single-zone low-cost setup
  # high_availability {
  #   mode = "Disabled"
  # }

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_internet" {
  name             = "AllowInternet"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
