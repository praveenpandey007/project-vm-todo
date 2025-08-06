terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "praveenstg"
    resource_group_name = "praveen-rg12"
    container_name = "praveencont"
    key = "p.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "bcf304d8-21b8-4358-9c77-54b5dd26f938"
  features {}
}