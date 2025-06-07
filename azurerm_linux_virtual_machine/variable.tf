variable "name" {
    default = "frontendvm"
}
variable "location" {
    default = "East US"
}
variable "resource_group" {
    default = "rg-todo"
}
variable "nic" {
    default = ["/subscriptions/ff2c3052-bd08-443f-80dd-1cabe7cbcd50/resourceGroups/rg_todo/providers/Microsoft.Network/virtualNetworks/FrontVnet/subnets/default"]
}