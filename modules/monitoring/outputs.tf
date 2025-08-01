output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.this.id
}

output "application_insights_instrumentation_key" {
  value = azurerm_application_insights.this.instrumentation_key
}

output "application_insights_connection_string" {
  value = azurerm_application_insights.this.connection_string
}

output "app_insights_key" {
  value = azurerm_application_insights.this.instrumentation_key
}
