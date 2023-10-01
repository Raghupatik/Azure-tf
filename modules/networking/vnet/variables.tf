variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}

variable "client_id" {
  description = "Azure Client ID"
}

variable "client_secret" {
  description = "Azure Client Secret"
}

variable "resource_group_name" {
  description = "Name of the existing resource group"
  default     = "experiment32"
}

variable "virtual_network_name" {
  description = "Name of the existing virtual network"
  default     = "experiment"
}

variable "default_subnet_name" {
  description = "Name of the existing default subnet"
  default     = "default"
}

variable "experiment_subnet_name" {
  description = "Name of the existing experiment subnet"
  default     = "experiment"
}
