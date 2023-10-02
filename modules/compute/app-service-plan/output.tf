output "app_service_plan_id" {
  description = "The ID of the created App Service Plan."
  value       = azurerm_app_service_plan.example.id
}
