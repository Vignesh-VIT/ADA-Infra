resource "azurerm_storage_share" "app_share" {
  name               = var.storage_share_name
  storage_account_id = var.storage_account_id
  quota              = var.quota
}