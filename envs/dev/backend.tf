/*
  Dev Environment: Remote State Backend

  Configures the backend to store Terraform state for the 'dev' environment
  in an Azure Storage Account blob container.
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate2728541b"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
