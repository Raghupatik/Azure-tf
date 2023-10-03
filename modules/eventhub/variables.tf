variable "resource_group_name" {
  description = "The name of the Azure resource group where the Event Hub will be created."
}

variable "namespace_name" {
  description = "The name of the Azure Event Hub namespace."
}

variable "event_hub_name" {
  description = "The name of the Azure Event Hub."
}

variable "sku" {
  description = "The SKU for the Event Hub namespace. Default is 'Standard'."
  default     = "Standard"
}

variable "partition_count" {
  description = "The number of partitions for the Event Hub."
  default     = 4
}
