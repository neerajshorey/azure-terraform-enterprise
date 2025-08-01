/*
  Dev Environment: Main Module Loader

  This file wires together all infrastructure modules for the 'dev' environment.
  It passes variables to networking, compute, app service, identity, etc.
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.38.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_log_analytics_workspace" "log" {
  name                = "log-analytics-dev"
  resource_group_name = var.resource_group_name
}

# Optional: use static value if you don't want to fetch
locals {
  admin_group_object_id = var.admin_group_object_id
}

module "container_registry" {
  source              = "../../modules/container_registry"
  acr_name            = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  public_network_access_enabled = var.acr_public_network_access_enabled
  tags                = var.tags
}

# AKS Module Call
module "aks" {
  source = "../../modules/aks"

  tenant_id                  = var.tenant_id
  cluster_name               = var.cluster_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  kubernetes_version         = var.kubernetes_version
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log.id
  acr_id                     = module.container_registry.acr_id
  admin_group_object_id      = local.admin_group_object_id
  tags                       = var.tags
}

module "networking" {
  source              = "../../modules/networking"
  vnet_name           = "vnet-main"
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = ["10.0.0.0/16"]

  subnets = [
    {
      name           = "subnet-app"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet-db"
      address_prefix = "10.0.2.0/24"
    }
  ]

  tags = var.tags
}

module "compute" {
  source              = "../../modules/compute"
  vm_name             = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.networking.subnet_ids["subnet-app"]
  identity_ids        = [module.identity.identity_id]

  vm_size        = "Standard_B1s"
  admin_username = var.admin_username
  admin_password = var.admin_password

  tags = var.tags
}

module "app" {
  source = "../../modules/app_service"

  app_name                 = "webapp-dev"
  location                 = module.networking.location
  resource_group_name      = module.networking.rg_name

  app_insights_key         = module.monitoring.app_insights_key
  user_assigned_identity_id = module.identity.user_mi_id

  tags = var.tags
}

module "database" {
  source              = "../../modules/database"
  db_name             = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  admin_username = "azureuser"
  admin_password = var.admin_password

  # These would come from a networking module or a pre-created resource
  delegated_subnet_id  = module.networking.subnet_ids["subnet-db"]
  private_dns_zone_id  = var.private_dns_zone_id

  tags = var.tags
}

module "keyvault" {
  source              = "../../modules/keyvault"
  kv_name             = "kv-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id

  secrets = {
    db-password = var.db_password
    app-secret  = var.app_secret
  }

  tags = var.tags
}

module "monitoring" {
  source              = "../../modules/monitoring"
  workspace_name      = var.workspace_name
  insights_name       = var.insights_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

module "identity" {
  source              = "../../modules/identity"
  identity_name       = var.identity_name
  location            = var.location
  resource_group_name = var.resource_group_name

  assign_role = true
  role_name   = "Reader"
  scope       = var.subscription_id

  tags = var.tags
}

module "governance" {
  source               = "../../modules/governance"
  scope                = var.subscription_id # Actual Subscription ID: az account show --query id --output tsv
  policy_definition_id = var.policy_definition_id
  allowed_locations    = var.allowed_locations
  budget_name          = var.budget_name
  budget_amount        = var.budget_amount
  budget_start_date    = var.budget_start_date
  subscription_id      = var.subscription_id
  contact_emails       = var.contact_emails
}
