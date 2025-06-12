locals {
  config_path           = "${path.module}/../${var.environment}/${var.environment}-configuration.json"
  infrastructure_config = jsondecode(file(local.config_path))

  secret_values = {
    "azurestorageaccountname"      = module.storage_account["storage_account_01"].storage_account_name
    "azurestorageaccountkey"       = module.storage_account["storage_account_01"].storage_account_key
    "signalr-connection-string"    = module.signalr["signalr_01"].signalr_primary_connection_str
    "servicebus-connection-string" = module.servicebus["service_01"].servicebus_primary_connection_str
    "cosmosdb-connection-string"   = module.cosmos_db["cosmosdb"].cosmos_connection_str
  }
  access_policy = {
    "sp_atlas" = data.azurerm_client_config.current.object_id
  }

  common_tags = {
    project = "Atlas"
  }
}