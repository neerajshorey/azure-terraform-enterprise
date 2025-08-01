variable "kv_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "secrets" {
  description = "Map of secrets to store"
  type        = map(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
