provider "azurerm" {
  features {}

  client_secret = var.client_secret
  client_id     = var.client_id
  tenant_id     = var.tenant_id
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "rg" {
  name = "experiment32"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-name"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-name"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = ["10.0.1.0/24"]
}

# Create monitor resource
resource "azurerm_monitor_action_group" "actiongroup" {
  name                = "actiongroup"
  resource_group_name = data.azurerm_resource_group.rg.name
  short_name          = "ag"

  email_receiver {
    name          = "sendToAdmin"
    email_address = "admin@company.com"
  }
}