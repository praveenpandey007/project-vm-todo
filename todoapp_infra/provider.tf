terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "praveenpandey07stg"
    resource_group_name = "praveenpandey07rg"
    container_name = "praveencont1"
    key = "p.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "ecf1c36f-8eba-469e-841f-a595c299e914"
  features {}
}
