/*
  Azure Container Registry (ACR) - Production Ready

  This block provisions a secure Azure Container Registry with configurable SKU,
  admin access, and public network settings. In production, use Premium SKU with
  admin_enabled = false and public_network_access_enabled = false.

  Features:
  - Supports RBAC-based image pulls from AKS via managed identity
  - Optional: Private Link, firewall rules (Premium only)
  - Tagged for environment and ownership tracking
*/

resource "azurerm_container_registry" "this" {
  name                          = var.acr_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}
