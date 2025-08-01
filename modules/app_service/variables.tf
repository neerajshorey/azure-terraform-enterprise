variable "app_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "app_insights_key" {
  type        = string
}

variable "user_assigned_identity_id" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
