resource "azurerm_linux_virtual_machine" "linux-block" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser1"
  admin_password      = "Password@321"
  network_interface_ids = var.nic

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}