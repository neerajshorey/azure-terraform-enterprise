/*
  Terraform Governance Module

  Applies Azure Policy definitions and cost management budgets.
  Enforces compliance and prevents cost overruns across cloud environments.
*/

resource "azurerm_subscription_policy_assignment" "this" {
  name                 = "enforce-location"
  subscription_id      = var.subscription_id
  policy_definition_id = var.policy_definition_id
  display_name         = "Allowed Locations"
  description          = "Restrict allowed locations"
  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.allowed_locations
    }
  })
}

resource "azurerm_consumption_budget_subscription" "this" {
  name            = var.budget_name
  amount          = var.budget_amount
  time_grain      = "Monthly"
  subscription_id = var.subscription_id

  time_period {
    start_date = var.budget_start_date
  }

  notification {
    enabled        = true
    threshold      = 80
    operator       = "GreaterThan"
    contact_emails = var.contact_emails
  }
}
