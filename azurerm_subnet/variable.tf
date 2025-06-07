variable "subnet1" {
    default = "frontend-subnet"
}
# variable "subnet2" {
#     default = "backend-subnet"
# }
variable "resource_group" {
    default = "rg-todo"
}
variable "virtual_network" {
    default = "vnet-todo"
}
variable "address_prefixes" {
    default = ["10.0.0.0/24"]
}
