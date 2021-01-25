resource "azurerm_application_insights" "demo" {
  name                = "bozy-demo-appinsights"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  application_type    = "web"
}