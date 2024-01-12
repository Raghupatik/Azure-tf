provider "azurerm" {
client_secret: sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx
client_id: c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a
tenantid: 1e8647b3-1bcf-4d17-9721-28853cbe413f
subscriptionid: 77b45418-7fb5-4763-bc5c-fa8dccc10889
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = var.namespace_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = var.sku
}

resource "azurerm_eventhub" "example" {
  name                = var.event_hub_name
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  partition_count     = var.partition_count
}

resource "azurerm_eventhub_authorization_rule" "example" {
  name                = "authorizationrule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
  eventhub_name       = azurerm_eventhub.example.name

  listen {
    primary_connection_string = azurerm_eventhub.example.primary_connection_string
    secondary_connection_string = azurerm_eventhub.example.secondary_connection_string
  }

  send {
    primary_connection_string = azurerm_eventhub.example.primary_connection_string
    secondary_connection_string = azurerm_eventhub.example.secondary_connection_string
  }
}
