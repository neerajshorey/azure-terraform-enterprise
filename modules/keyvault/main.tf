/*
  Terraform Key Vault Module

  Creates Azure Key Vault and sets up access policies or role assignments.
  Used for managing secrets, passwords, and sensitive connection strings.
*/

resource "azurerm_key_vault" "this" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
  public_network_access_enabled = false

  tags = var.tags
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.secrets
  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.this.id
}
