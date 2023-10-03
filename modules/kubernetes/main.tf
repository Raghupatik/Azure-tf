provider "azurerm" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id

    features {}
}

resource "azurerm_resource_group" "experiment32" {
  name     = "experiment32"
  location = "eastus"     
}

resource "azurerm_kubernetes_cluster" "tfworkshop" {
  for_each            = var.clusters
  
  name                = "tfworkshop"
  location            = "eastus"
  resource_group_name = "experiment32"
  dns_prefix          = "tfworkshop"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

 service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


  tags = {
    Environment = "Production"
  }
}
