resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          =  var.ip_name
    subnet_id                     =  data.azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}
data "azurerm_public_ip" "pip" {
name = var.pip_name
resource_group_name = var.resource_group
}

data "azurerm_subnet" "frontend_subnet" {
  name = var.subnet_name
  virtual_network_name = var.virtual_network
  resource_group_name = var.resource_group
}

