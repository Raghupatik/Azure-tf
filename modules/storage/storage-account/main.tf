provider "azurerm" {
  features {}
  client_secret   = var.client_secret
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

#import resource into local statefile
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "East US"
}

# Create an Azure Storage Account
resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccountsai"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "testing"
  }
}
