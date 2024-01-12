terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "existing_vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "existing_default_subnet" {
  name                 = var.default_subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_virtual_network.existing_vnet.resource_group_name
}

data "azurerm_subnet" "existing_experiment_subnet" {
  name                 = var.experiment_subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = data.azurerm_virtual_network.existing_vnet.resource_group_name
}

resource "azurerm_route_table" "Az-RT" {
  name                = "experiment-route-table"
  resource_group_name = var.resource_group_name
  location            = data.azurerm_virtual_network.existing_vnet.location
}

# Define routes for the route table
resource "azurerm_route" "IGW" {
  name                   = "IGW"
  route_table_name       = azurerm_route_table.Az-RT.name
  resource_group_name    = azurerm_route_table.Az-RT.resource_group_name
  address_prefix         = "0.0.0.0/0"  # Example route for internet traffic
  next_hop_type          = "Internet"   # Route traffic to the internet
}

# Create an Internet Gateway
resource "azurerm_public_ip" "internet_gateway_ip" {
  name                = "myInternetGatewayIP"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "internet_gateway_nsg" {
  name                = "myInternetGatewayNSG"
  location            = data.azurerm_virtual_network.existing_vnet.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name  
}

# Associate the route table with existing subnets
resource "azurerm_subnet_route_table_association" "default_subnet_association" {
  subnet_id      = data.azurerm_subnet.existing_default_subnet.id
  route_table_id = azurerm_route_table.Az-RT.id
}

resource "azurerm_subnet_route_table_association" "experiment_subnet_association" {
  subnet_id      = data.azurerm_subnet.existing_experiment_subnet.id
  route_table_id = azurerm_route_table.Az-RT.id
}


