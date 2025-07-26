resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.size
  admin_username      = data.azurerm_key_vault_secret.vm-usernam1.value
  admin_password      = data.azurerm_key_vault_secret.vm-password1.value
  network_interface_ids =  [data.azurerm_network_interface.nic.id]
  
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
custom_data = base64encode(<<EOF
#!/bin/bash
apt update
apt install nginx -y
systemctl start nginx
systemctl enable nginx
EOF
)
}

data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group
}

data "azurerm_key_vault" "kv" {
name = var.key_vault_name
resource_group_name = var.resource_group
}

data "azurerm_key_vault_secret" "vm-usernam1" {
name = var.username_secret_name
key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm-password1" {
name = var.password_secret_name
key_vault_id = data.azurerm_key_vault.kv.id
}




