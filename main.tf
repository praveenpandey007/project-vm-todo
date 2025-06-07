module "module-rg" {
source = "./azurerm_resource_group"
}
module "module-vnet" {
source = "./azurerm_virtual_network"
depends_on = [module.module-rg]
}
module "module-subnet" {
    source = "./azurerm_subnet"
    depends_on = [module.module-vnet]
}
module "module-vm" {
    source = "./azurerm_linux_virtual_machine"
}
module "module-nic" {
    source = "./azurerm_network_interface"
}