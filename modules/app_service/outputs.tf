output "web_app_url" {
  description = "Default hostname of the Linux Web App"
  value       = azurerm_linux_web_app.this.default_hostname
}

output "web_app_id" {
  description = "Resource ID of the Linux Web App"
  value       = azurerm_linux_web_app.this.id
}

output "plan_id" {
  description = "App Service Plan ID"
  value       = azurerm_service_plan.this.id
}
