resource "azurerm_resource_group" "demo" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"
}