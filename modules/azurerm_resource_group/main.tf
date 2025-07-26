resource "azurerm_resource_group" "rg-todo-b" {
  name     = var.resource_group_name
  location = var.resource_group_location
}