resource "azurerm_storage_account_network_rules" "storage_account" {
  storage_account_id         = var.storage_account_id
  default_action             = var.default_action
  ip_rules                   = var.bosch_ips
  virtual_network_subnet_ids = var.vnet_subnet_id
  bypass                     = var.bypass
}