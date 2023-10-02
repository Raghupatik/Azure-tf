provider "azurerm" {
  features {}
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
}

resource "azurerm_cosmosdb_account" "example" {
  name                = var.cosmosdb_account_name
  location            = "East US"
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = "East US"
    failover_priority = 0
  }

  tags = {
    environment = "dev"
  }
}
