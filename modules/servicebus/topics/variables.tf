variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "service_topic"
}

variable "resource_group_location" {
  description = "Location for the Azure resource group"
  type        = string
  default     = "East US" 
}

variable "namespace_name" {
  description = "Name of the Azure Service Bus namespace"
  type        = string
  default     = "namespaceRG" 
}

variable "topic_name" {
  description = "Name of the Azure Service Bus queue"
  type        = string
  default     = "harish-topic"
}

variable "topic_max_size" {
  description = "Maximum size of the Service Bus queue in megabytes"
  type        = number
  default     = 1024
}

variable "topic_message_ttl" {
  description = "Default message time-to-live (TTL) in ISO 8601 duration format"
  type        = string
  default     = "PT5M" 
}
