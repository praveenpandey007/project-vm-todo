variable "name" {}
variable "resource_group" {}
variable "location" {}
variable "size" {}
variable "admin_username" {}
variable "storage_account_type" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "nic_name" {}
variable "key_vault_name" {
  default = "azurekey"
}
variable "username_secret_name" {}
variable "password_secret_name" {}






