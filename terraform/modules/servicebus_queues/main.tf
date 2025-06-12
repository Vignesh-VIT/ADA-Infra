resource "azurerm_servicebus_queue" "sb-queue" {
  name                                 = var.sb_queue_name
  namespace_id                         = var.sb_ns_id
  max_size_in_megabytes                = var.sb_queue_size
  partitioning_enabled                 = false
  dead_lettering_on_message_expiration = true
}