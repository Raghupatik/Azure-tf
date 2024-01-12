variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US" 
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_DS2_v2" 
}

variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Virtual Machine"
  type        = string
}
