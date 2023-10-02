variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the Azure App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Name of the Azure App Service"
  type        = string
}
