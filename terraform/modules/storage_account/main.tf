resource "azurerm_storage_account" "storage_account" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
  tags                            = var.tags


  lifecycle {
    ignore_changes = [
      allow_nested_items_to_be_public
    ]
  }
}