module "resoure_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todo-praveen"
  resource_group_location = "West US"

}

module "virtual_network" {
  depends_on                    = [module.resoure_group]
  source                        = "../modules/azurerm_virtual_network"
  virtual_network_name          = "vnet-todo"
  resource_group_name           = "rg-todo-praveen"
  virtual_network_location      = "West US"
  virtual_network_address_space = ["10.0.0.0/24"]
}

module "frontendvm_subnet" {
  depends_on          = [module.virtual_network]
  source              = "../modules/azurerm_subnet"
  subnet_name         = "subnet-frontendvm"
  virtual_network     = "vnet-todo"
  resource_group_name = "rg-todo-praveen"
  address_prefixes    = ["10.0.0.0/25"]
}

module "backendvm_subnet" {
  depends_on          = [module.virtual_network]
  source              = "../modules/azurerm_subnet"
  subnet_name         = "subnet-backendvm"
  virtual_network     = "vnet-todo"
  resource_group_name = "rg-todo-praveen"
  address_prefixes    = ["10.0.0.128/25"]

}
module "virtual_machine_frontendvm" {
  depends_on           = [module.network_interface_front]
  source               = "../modules/azurerm_linux_virtual_machine"
  name                 = "frontendvm"
  resource_group       = "rg-todo-praveen"
  location             = "West US"
  size                 = "Standard_B1s"
  admin_username       = "frontendadmin"
  key_vault_name       = "var.key_vault_name"
  username_secret_name = "administrator"
  password_secret_name = "vmpassword"
  storage_account_type = "Standard_LRS"
  offer                = "0001-com-ubuntu-server-jammy"
  sku                  = "22_04-lts"
  publisher            = "canonical"
  nic_name             = "front_nic"

}

module "virtual_machine_backendvm" {
  depends_on           = [module.network_interface_back]
  source               = "../modules/azurerm_linux_virtual_machine"
  name                 = "backendvm"
  resource_group       = "rg-todo-praveen"
  location             = "West US"
  size                 = "Standard_B1s"
  admin_username       = "backendadmin"
  key_vault_name       = "var.key_vault_name"
  username_secret_name = "administrator"
  password_secret_name = "vmpassword"
  storage_account_type = "Standard_LRS"
  publisher            = "canonical"
  offer                = "0001-com-ubuntu-server-focal"
  sku                  = "20_04-lts-gen2"
  nic_name             = "back_nic"
}

module "network_interface_front" {
  depends_on      = [module.public-ip-front]
  source          = "../modules/azurerm_network_interface"
  nic_name        = "front_nic"
  location        = "West US"
  resource_group  = "rg-todo-praveen"
  ip_name         = "internal"
  pip_name        = "front_ip"
  subnet_name     = "subnet-frontendvm"
  virtual_network = "vnet-todo"

}

module "network_interface_back" {
  depends_on      = [module.public-ip-back]
  source          = "../modules/azurerm_network_interface"
  nic_name        = "back_nic"
  location        = "West US"
  resource_group  = "rg-todo-praveen"
  ip_name         = "external"
  pip_name        = "back_ip"
  subnet_name     = "subnet-backendvm"
  virtual_network = "vnet-todo"

}
module "public-ip-front" {
  source              = "../modules/azurerm_public_ip"
  pip_name            = "front_ip"
  resource_group_name = "rg-todo-praveen"
  location            = "West US"
  allocatation_method = "Dynamic"
  sku                 = "Basic"
}

module "public-ip-back" {
  source              = "../modules/azurerm_public_ip"
  pip_name            = "back_ip"
  resource_group_name = "rg-todo-praveen"
  location            = "West US"
  allocatation_method = "Dynamic"
  sku                 = "Basic"
}

module "azurerm_mssql_server" {
  depends_on          = [module.resoure_group]
  source              = "../modules/azurerm_sql_server"
  sql_server_name     = "todo-sql-server-pandey1"
  resource_group_name = "rg-todo-praveen"
  location            = "West US"
  admin_login         = "tododbadmin"
  password            = "dbadmin@321"
}

module "azurerm_mssql_database" {
  depends_on     = [module.azurerm_mssql_server]
  source         = "../modules/azurerm_sql_database"
  db_name        = "todo_db-praveen1"
  resource_group = "rg-todo-praveen"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  size_gb        = 5
  sku_name       = "S0"
  enclave_type   = "VBS"
  db_server_name = "todo-sql-server-pandey1"
}
module "azurerm_key_vault" {
  depends_on     = [module.resoure_group]
  source         = "../modules/azurerm_key_vault"
  keyvaultname = "keyvaultname"
  location       = "West US"
  resource_group = "rg-todo-praveen"
  sku_name       = "standard"
}
