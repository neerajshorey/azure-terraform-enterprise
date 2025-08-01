resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "${var.cluster_name}-node-rg"
  

  default_node_pool {
    name                  = "systemnp"
    node_count            = var.node_count
    vm_size               = var.vm_size
    type                  = "VirtualMachineScaleSets"
    auto_scaling_enabled   = true
    min_count             = 1
    max_count             = 3
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    dns_service_ip    = "10.0.0.10"
    service_cidr      = "10.0.0.0/16"
  }

  role_based_access_control_enabled = var.enable_aad_rbac

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.enable_aad_rbac && var.admin_group_object_id != null ? [1] : []
    content {
      tenant_id               = var.tenant_id
      azure_rbac_enabled      = true
      admin_group_object_ids  = [var.admin_group_object_id]
    }
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "aks_pull_acr" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}
