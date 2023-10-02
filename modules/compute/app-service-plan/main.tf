provider "azurerm" {
  features {}
  client_secret:"sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
client_id:"c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
tenantid:"1e8647b3-1bcf-4d17-9721-28853cbe413f"
subscriptionid:"77b45418-7fb5-4763-bc5c-fa8dccc10889"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }

  tags = var.app_service_plan_tags
}
