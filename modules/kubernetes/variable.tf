variable "client_secret" {
    description = "Client secret of the service principal"
    type        = string
}

variable "subscription_id" {
    description = "subscription_id of the service principal"
    type        = string
} 

variable "tenant_id" {
    description = "tenant_id of the service principal"
    type        = string
}

variable "client_id" {
    description = "client_id of the service principal"
    type        = string
}

variable "clusters" {
    description = "A map of Kubernetes clusters to create"
    type        = map(object({
        name          = string
        location      = string
        resource_group_name = string
        dns_prefix    = string
        node_count    = number
        vm_size       = string
    }))
    default = {
        cluster1 = {
            name                = "tfworkshop-cluster1"
            location            = "eastus"
            resource_group_name = "experiment32"
            dns_prefix          = "tfworkshop-cluster1"
            node_count          = 1
            vm_size             = "Standard_D2_v2"
        },
        cluster2 = {
            name                = "tfworkshop-cluster2"
            location            = "westus"
            resource_group_name = "experiment33"
            dns_prefix          = "tfworkshop-cluster2"
            node_count          = 2
            vm_size             = "Standard_D4_v2"
        }
    }
}
