terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
  client_secret   = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
  tenant_id       = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
  subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
}

resource "azurerm_resource_group" "rg1" {
  name     = "experiment32"
  location = "East US"
}

resource "azurerm_app_service_plan" "example" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}