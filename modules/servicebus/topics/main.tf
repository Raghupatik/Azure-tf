resource "azurerm_resource_group" "experiment32" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_servicebus_namespace" "namespace" {
  name                = var.namespace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_topic" "harish" {
  name                  = var.topic_name
  namespace_id          = azurerm_servicebus_namespace.namespace.id  
  max_size_in_megabytes = var.topic_max_size
  default_message_ttl   = var.topic_message_ttl  
}