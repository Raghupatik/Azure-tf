provider "azurerm" {
  features {}
 
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

data "azurerm_resource_group" "existing" {
  name = "experiment32"  
}

resource "azurerm_api_management" "example" {
  name                = "my-api-management"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = "experiment32"
  publisher_name      = "My Company"
  publisher_email     = "contact@company.com"
  sku_name            = "Developer_1"

  identity {
    type = "SystemAssigned"
  }
}
