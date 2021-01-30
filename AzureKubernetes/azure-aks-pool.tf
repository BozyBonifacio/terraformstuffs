resource "azurerm_kubernetes_cluster_node_pool" "demo" {
  name                  = "demonodepool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.demo.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 3
  os_type         = "Linux"
  os_disk_size_gb = 30
  vnet_subnet_id = "${azurerm_subnet.cluster.id}"

  tags = {
    Environment = "POC"
  }
}