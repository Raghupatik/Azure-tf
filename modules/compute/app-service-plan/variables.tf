variable "resource_group_name" {
  description = "Name of the resource group where the App Service Plan will be created."
}

variable "location" {
  description = "Azure region where the resources will be deployed."
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan."
}

variable "app_service_plan_sku_tier" {
  description = "Tier of the App Service Plan (e.g., Free, Basic, Standard, Premium, etc)."
}

variable "app_service_plan_sku_size" {
  description = "Size of the App Service Plan (e.g., F1, B1, S1, P1, etc)."
}

variable "app_service_plan_tags" {
  description = "Tags to associate with the App Service Plan."
}
