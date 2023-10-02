# Create an Azure Resource Group
resource "azurerm_resource_group" "example" {
  name     = "experiment32"
  location = "East US"  # Modify the region as needed
}

# Define the Azure Function App
resource "azurerm_function_app" "example" {
  name                      = "myfunctionappkk111223"
  location                  = azurerm_resource_group.example.location
  resource_group_name       = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name      = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}

# Define an Azure App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = "myappserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

# Define an Azure Storage Account
resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccountkk"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}