resource "azurerm_storage_account" "demo" {
  name                     = "bozy-demo-storageaccount"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"] # see: https://docs.microsoft.com/en-us/azure/storage/common/storage-network-security#exceptions
  }

  tags = {
    "AppID" = "003865"
    inventory = " {\"Product\":\"cmp\",\"Application\":\"cmp\",\"Environment\":\"dev\",\"Function\":\"storageaccount\"}"
  }
}

resource "azurerm_storage_container" "demo" {
  name                  = "appinsightsexport"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "private"
}