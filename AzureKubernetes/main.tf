terraform {
  required_version = ">= 0.13.0"
  backend "azurerm" {
    resource_group_name  = "resourcegroup-of-your-storage-account"
    storage_account_name = "storageaccountname"
    container_name       = "containername"
    key                  = "yourstorageaccountkey"
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