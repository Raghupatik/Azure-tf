provider "azurerm" {
  features {}
 
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = "your-resource-group-name"
  location = "East US"
}

resource "azurerm_api_management" "example" {
  name                = "your-apim-name"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = "Your Publisher Name"
  publisher_email     = "your.email@example.com"

  sku_name = "Developer_1"

  identity {
    type = "SystemAssigned"
  }
}






