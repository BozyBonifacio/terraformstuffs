resource "azurerm_kubernetes_cluster" "demo" {
    name                = "${var.aks_cluster_name}"
    location            = "${azurerm_resource_group.aks.location}"
    dns_prefix          = "ps-${var.aks_cluster_name}"
    resource_group_name = "${azurerm_resource_group.aks.name}"

    linux_profile {
        admin_username = "nodeadmin"

        ssh_key {
            key_data = "${file(var.public_ssh_key_path)}"
        }
    }

    default_node_pool {
        name            = "nodepool01"
        node_count           = "3"
        vm_size         = "Standard_D2_v2"
    }

    service_principal {
        client_id     = "${azuread_service_principal.sp-aks.application_id}"
        client_secret = "${random_string.sp-aks-password.result}"
    }

    network_profile {
        network_plugin = "azure"
    }

    addon_profile {
        oms_agent {
            enabled = true
            log_analytics_workspace_id = "${azurerm_log_analytics_workspace.aks.id}"
        }
    }
}