variable "client_secret" {}
variable "client_id" {}
variable "tenant_id" {}
variable "subscription_id" {}
variable "resource_group_name" {
  type    = string
  default = "experiment32"
}
variable "virtual_network_name" {
  type    = string
  default = "experiment"
}
variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "location" {
  type    = string
  default = "East US"
}
variable "subnet_default_address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "subnet_experiment_address_prefixes" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}
