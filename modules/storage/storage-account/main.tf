provider "azurerm" {
  features {}
  client_id       = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
  client_secret   = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
  tenant_id       = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
  subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
}

resource "azurerm_resource_group" "example" {
  name     = "experiment32"
  location = "East US"
}


resource "azurerm_storage_account" "example" {
  name                     = "myazureteststorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "example" {
  name                 = "sharename"
  storage_account_name = azurerm_storage_account.example.name
  quota                = 50
}

resource "azurerm_storage_share_file" "example" {
  name             = "my-awesome-content.zip"
  storage_share_id = azurerm_storage_share.example.id
  
}