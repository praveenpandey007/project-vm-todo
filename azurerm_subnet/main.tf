resource "azurerm_subnet" "subnetb1" {
  name                 = var.subnet1
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network
  address_prefixes     = var.address_prefixes
}
# resource "azurerm_subnet" "subnetb2" {
#   name                 = var.subnet2
#   resource_group_name  = var.resource_group
#   virtual_network_name = var.virtual_network
#   address_prefixes     = var.address_prefixes
# }
