resource "azurerm_virtual_network" "vnet-todo-b" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.virtual_network_location
  address_space       = var.virtual_network_address_space
}