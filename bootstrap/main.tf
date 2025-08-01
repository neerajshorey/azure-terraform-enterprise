/*
  Terraform Bootstrap: Remote State Backend Setup

  This file sets up the required backend infrastructure to store Terraform state remotely in Azure.
  It provisions the storage account, resource group, and blob container.

  This is a one-time setup and should be applied before running any environment like dev or prod.
  The values from this can be used in each environment's backend.tf to enable remote state management.
*/

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_id" "unique" {
  byte_length = 4
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_id.unique.hex}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  min_tls_version          = "TLS1_2"

  tags = {
    environment = var.tags["environment"]
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}
