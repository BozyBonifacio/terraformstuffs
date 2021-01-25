terraform {
  required_version = ">= 0.13.0"
  backend "azurerm" {
    resource_group_name  = "TROP-DEVOPS-TERRAFORM-NONPROD"
    storage_account_name = "tfstgbozycmpiac"
    container_name       = "tfstate"
    key                  = "JvqWzH3U2A7JUslnc1vTI5ovoXFEOVlzHWDmNNBgOwdyoXWGnCv06TZa3zaCF6g7r/XYQrbo4NhlJ6e8l8rAWQ=="
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