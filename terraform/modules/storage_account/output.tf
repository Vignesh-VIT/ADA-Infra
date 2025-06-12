output "storage_account_name" {
  description = "The name of the Azure Storage Account created by this module."
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_id" {
  description = "The unique resource ID of the Azure Storage Account."
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_key" {
  description = "The primary access key for the Azure Storage Account, used for authentication."
  value       = azurerm_storage_account.storage_account.primary_access_key
}