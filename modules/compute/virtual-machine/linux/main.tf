provider "azurerm" {
  features {}
  subscription_id = "77b45418-7fb5-4763-bc5c-fa8dccc10889"
  client_id       = "c1cd6156-8e0b-4ed1-b2fa-d3e7fae3919a"
  client_secret   = "sek8Q~dDXuChQRvBdqigMjcaiLgP6dRzgFn55bNx"
  tenant_id       = "1e8647b3-1bcf-4d17-9721-28853cbe413f"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_machine" "example" {
  name                  = var.vm_name
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
