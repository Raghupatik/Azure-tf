provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenantid 
  subscription_id = var.subscriptionid
}

resource "random_string" "random" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

data "azurerm_resource_group" "rg" {
  name = "experiment32" 
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "experiment32"  # Set your desired name
  location            = "East US"  # Set your desired location
  resource_group_name = data.azurerm_resource_group.rg.name

  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }
}

resource "azurerm_private_endpoint" "pe" {
  name                = "pe-cosmos-${random_string.random.result}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = var.cosmosdb_subnet_id

  private_service_connection {
    name                           = "psc-cosmos-${random_string.random.result}"
    private_connection_resource_id = azurerm_cosmosdb_account.db.id
    is_manual_connection           = false
    subresource_names              = ["Sql"]
  }
}

