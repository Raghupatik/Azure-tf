# Configure Azure provider
provider "azurerm" {
  features {}

  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
}

# Data block to get existing resource group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name 
}

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name = var.virtual_network_name
  address_space = var.virtual_network_address_space
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Subnets 
resource "azurerm_subnet" "default" {
  name = "default"
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_default_address_prefixes
}

resource "azurerm_subnet" "experiment" {
  name = "experiment"
  resource_group_name = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_experiment_address_prefixes
}