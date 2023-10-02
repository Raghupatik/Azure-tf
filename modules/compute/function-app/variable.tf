variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "experiment32"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "experiment"
}

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
  default     = ["default", "experiment"]
}