provider "azurerm" {
  alias   = "my_azure_provider"
  features {}
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_databricks_workspace" "workspace" {
  name                = var.workspace_name
  resource_group_name = azurerm_resource_group.resourcegroup.name
  location            = var.location
  sku                 = var.sku

  
  tags = var.tags
}

output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.workspace.id
}