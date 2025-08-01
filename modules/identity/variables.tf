variable "identity_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "assign_role" {
  type    = bool
  default = false
}

variable "role_name" {
  type    = string
  default = "Reader"
}

variable "scope" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
