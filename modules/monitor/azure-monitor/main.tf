# Azure Resource Group
resource "azurerm_resource_group" "experiment32" {
  name     = "experiment32"
  location = "East US"
}

# Azure Monitor Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "monitor_workspace" {
  name                = "monitor-logs"
  location            = azurerm_resource_group.experiment32.location
  resource_group_name = azurerm_resource_group.experiment32.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Azure Monitor Action Group
resource "azurerm_monitor_action_group" "AM" {
  name                = "AM-action-group"
  resource_group_name = azurerm_resource_group.experiment32.name

  short_name = "AMAG"
  enabled    = true

  email_receiver {
    name                    = "AGEmail"
    email_address           = "tejasaiandem06@gmail.com"
    use_common_alert_schema = true
  }
}

# Azure Monitor Alert Rule
#resource "azurerm_monitor_metric_alert" "AR" {
# name                = "AR-metric-alert"
#  resource_group_name = azurerm_resource_group.experiment32.name
#  scopes              = [azurerm_log_analytics_workspace.monitor_workspace.id]
#
#  criteria {
#    metric_namespace = "Microsoft.OperationalInsights/workspaces"
#    metric_name      = "SuccessfulRequests"
#    aggregation      = "Average"
#    operator         = "GreaterThan"
#    threshold        = 100
#  }

#  action {
#    action_group_id = azurerm_monitor_action_group.AM.id
#  }
#}

