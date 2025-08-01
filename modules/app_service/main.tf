/*
  Terraform App Service Module

  Provisions Azure App Service (Web App) for hosting PaaS-based APIs or web apps.
  Supports integration with Application Insights and Key Vault.
*/

resource "azurerm_service_plan" "this" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"       = var.app_insights_key
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"  = "false"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  tags = var.tags
}
