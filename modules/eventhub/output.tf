output "namespace_primary_connection_string" {
  value = azurerm_eventhub_namespace.example.primary_connection_string
}

output "namespace_secondary_connection_string" {
  value = azurerm_eventhub_namespace.example.secondary_connection_string
}

output "event_hub_primary_connection_string" {
  value = azurerm_eventhub.example.primary_connection_string
}

output "event_hub_secondary_connection_string" {
  value = azurerm_eventhub.example.secondary_connection_string
}
