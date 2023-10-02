terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {
  }
    client_id       = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
    client_secret   = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
    tenant_id       = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
    subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
  

}

resource "azurerm_resource_group" "example" {
  name     = "resource32"
  location = "East US" # Update with your desired location
}

resource "azurerm_virtual_network" "example" {
  name                = "experiment"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "Default"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "experiment" {
  name                 = "experiment"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "example" {
  name                = "example-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Define your NSG rules here (e.g., inbound and outbound rules)
# Example inbound rule allowing SSH traffic:
# Note: Make sure to adjust the rule settings as per your requirements.

resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}

# You can add more NSG rules as needed.

# Attach the NSG to your subnets
resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_subnet_network_security_group_association" "experiment" {
  subnet_id                 = azurerm_subnet.experiment.id
  network_security_group_id = azurerm_network_security_group.example.id
}
