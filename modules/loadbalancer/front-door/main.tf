provider "azurerm" {
  features {}
  client_id       = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
  client_secret   = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
  tenant_id       = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
  subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
}

resource "azurerm_frontdoor" "b2cfrontdoor" {
      name                                         = var.example-FrontDoor
      resource_group_name                          = var.experiment32
    
      routing_rule {
        name               = "routingrule"
        accepted_protocols = ["Http", "Https"]
        patterns_to_match  = ["/*"]
        frontend_endpoints = ["b2c-frontdoor-endpoint-dev"]
        forwarding_configuration {
          forwarding_protocol = var.MatchRequest
          backend_pool_name   = "b2-backend-pool-dev"
        }
      }
    
      backend_pool_load_balancing {
        name = "loadbalancingsettings"
      }
    
      backend_pool_health_probe {
        name    = "healthprobesettings"
        enabled = false
        probe_method = "HEAD"
      }
    
      backend_pool {
        name = "b2-backend-pool-dev"
        backend {
          host_header = "xyz.b2clogin.com"
          address     = "xyz.b2clogin.com"
          http_port   = 80
          https_port  = 443
        }
        load_balancing_name = "loadbalancingsettings"
        health_probe_name   = "healthprobesettings"
      }
    
      frontend_endpoint {
        name      = "b2c-frontdoor-endpoint-dev"
        host_name = "b2c-frontdoor-endpoint-dev.azurefd.net"
        session_affinity_enabled = false
        session_affinity_ttl_seconds = 0
      }
    }