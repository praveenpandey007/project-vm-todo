resource "azurerm_network_interface" "nic" {
  name                = "frontend-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  "/subscriptions/ff2c3052-bd08-443f-80dd-1cabe7cbcd50/resourceGroups/rg_todo/providers/Microsoft.Network/virtualNetworks/FrontVnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}