resource "azurerm_servicebus_namespace" "sb-ns" {
  name                         = var.sb_ns_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku                          = var.sb_ns_sku
  capacity                     = var.sb_ns_capacity
  premium_messaging_partitions = var.premium_messaging_partitions
}