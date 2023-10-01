output "logic_app_name" {
  description = "Name of the created Azure Logic App"
  value       = azurerm_logic_app_workflow.example.name
}

output "logic_app_id" {
  description = "ID of the created Azure Logic App"
  value       = azurerm_logic_app_workflow.example.id
}


