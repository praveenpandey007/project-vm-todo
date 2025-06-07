resource "azurerm_virtual_network" "vnetb" {
  name                = var.vnet
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group
}