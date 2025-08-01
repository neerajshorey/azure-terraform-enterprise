/*
  Terraform Identity Module

  Creates a User-Assigned Managed Identity (UAMI) to enable secure resource access.
  Used by virtual machines, app services, and other components to authenticate without credentials.
*/

resource "azurerm_user_assigned_identity" "this" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_role_assignment" "this" {
  count                = var.assign_role ? 1 : 0
  principal_id         = azurerm_user_assigned_identity.this.principal_id
  role_definition_name = var.role_name
  scope                = var.scope
}
