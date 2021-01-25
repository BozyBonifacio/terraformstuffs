terraform {
  required_version = ">= 0.13.0"
  backend "azurerm" {
    resource_group_name  = "bozy-demo-appinsights-rg"
    storage_account_name = "tfstgbozycmpiac"
    container_name       = "tfstate"
    key                  = "storagekeygoeshere"
  }
  required_providers {
    azurerm = {
      version = "=2.39.0"
    }
    azuread = {
      version = "=1.1.1"
    }
  }
}

provider "azurerm" {
  features {}
}
