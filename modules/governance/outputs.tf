output "policy_id" {
  value = azurerm_subscription_policy_assignment.this.id
}

output "budget_id" {
  value = azurerm_consumption_budget_subscription.this.id
}
