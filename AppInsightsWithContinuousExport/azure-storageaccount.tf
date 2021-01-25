resource "azurerm_storage_account" "demo" {
  name                     = "bozydemostg"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    #https://docs.microsoft.com/en-us/azure/azure-monitor/app/export-telemetry#continuous-export-advanced-storage-configuration
    default_action             = "Allow" 
  }

  tags = {
    "AppID" = "00000"
    "Environment" = "demo"
  }
}
