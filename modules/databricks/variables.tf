variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the Databricks workspace will be created."
  type        = string
  default     = "databricksRG"
}

variable "workspace_name" {
  description = "The name of the Azure Databricks workspace."
  type        = string
  default     = "azureCRDB"
}

variable "location" {
  description = "The Azure region where the Databricks workspace will be created."
  type        = string
  default     = "East US"
}

variable "sku" {
  description = "The SKU (tier) of the Databricks workspace (e.g., standard, premium)."
  type        = string
  default     = "premium"
}



variable "tags" {
  description = "A map of tags to apply to the Databricks workspace."
  type        = map(string)
  default     = {
    environment = "production"
  }
}