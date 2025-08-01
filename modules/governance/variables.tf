variable "budget_name" {
  type = string
}

variable "budget_amount" {
  type = number
}

variable "budget_start_date" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "contact_emails" {
  type = list(string)
}

variable "scope" {
  description = "The scope at which the policy assignment should be applied (e.g., a management group ID, subscription ID, or resource group ID)."
  type        = string
}

variable "policy_definition_id" {
  description = "The ID of the policy definition to assign (e.g., '/providers/Microsoft.Authorization/policyDefinitions/e765b530-1d89-490b-9562-b1b51d8b0272' for allowed locations)."
  type        = string
}

variable "allowed_locations" {
  description = "A list of allowed Azure regions (e.g., [\"eastus\", \"westus\"])."
  type        = list(string)
}

variable "policy_assignment_name" {
  description = "A unique prefix for the policy assignment name to ensure global uniqueness."
  type        = string
  default     = "mycompany" # Provide a sensible default or require it to be set
}