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

resource "azurerm_virtual_network" "vnet1" {
  name                = "test-vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "ase" {
  name                 = "asesubnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.3.0/24"]

  delegation {
    name = "ASE-Delegation"

    service_delegation {
      name    = "Microsoft.Web/hostingEnvironments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  service_endpoints = ["Microsoft.Sql", "Microsoft.Web"]
}

resource "azurerm_app_service_environment_v3" "ase34" {
  name                = "myasev31234"
  resource_group_name = azurerm_resource_group.rg1.name
  subnet_id           = azurerm_subnet.ase.id

  cluster_setting {
    name  = "InternalEncryption"
    value = "true"
  }

  cluster_setting {
    name  = "FrontEndSSLCipherSuiteOrder"
    value = "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P256,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256"
  }
}
