output "cosmosdb_id" {
  value = azurerm_cosmosdb_account.db.id
}

output "cosmosdb_endpoint" {
  value = azurerm_cosmosdb_account.db.endpoint
}

output "cosmosdb_connection_strings" {
  value     = azurerm_cosmosdb_account.db.connection_strings
  sensitive = true
}

output "cosmosdb_primary_key" {
  value     = azurerm_cosmosdb_account.db.primary_key
  sensitive = true
}