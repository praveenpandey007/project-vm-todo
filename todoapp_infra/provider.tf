terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "def13e29-f65a-496b-b10e-3cffca9a480f"
  features {}
}