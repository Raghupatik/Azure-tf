resource_group_name      = "experiment32"
location                = "eastus"
app_service_plan_name    = "example-app-service-plan"
app_service_plan_sku_tier = "Standard"
app_service_plan_sku_size = "S1"

app_service_plan_tags = {
  environment = "production"
  department  = "engineering"
}
