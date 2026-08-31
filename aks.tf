resource "azurerm_resource_group" "this" {
  name     = "rg-minimal-aks"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-minimal"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  dns_prefix          = "aks-minimal"

  node_provisioning_profile {
    mode = "Manual"
  }

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D2as_v5"
  }

  identity {
    type = "SystemAssigned"
  }
}
