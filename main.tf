
provider "azurerm" {
  features {}
  client_secret = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
client_id = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
tenant_id = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
  subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
}

resource "azurerm_logic_app_workflow" "example" {
  name                = "${var.prefix}-logicapp"
  location            = "East US"  
  resource_group_name = "experiment32"  
}

resource "azurerm_logic_app_trigger_recurrence" "hourly" {
  name         = "run-every-hour"
  logic_app_id = azurerm_logic_app_workflow.example.id
  frequency    = "Hour"
  interval     = 1
}

resource "azurerm_logic_app_action_http" "main" {
  name         = "clear-stable-objects"
  logic_app_id = azurerm_logic_app_workflow.example.id
  method       = "DELETE"
  uri          = "http://example.com/clear-stable-objects"
}
