locals {
  config_path           = "${path.module}/../${var.environment}/${var.environment}-configuration.json"
  infrastructure_config = jsondecode(file(local.config_path))

  secret_values = {
    "azurestorageaccountname"      = module.storage_account["storage_account_01"].storage_account_name
    "azurestorageaccountkey"       = module.storage_account["storage_account_01"].storage_account_key
    "signalr-connection-string"    = module.signalr["signalr_01"].signalr_primary_connection_str
    "servicebus-connection-string" = module.servicebus["service_01"].servicebus_primary_connection_str
    "mongodb-connection-string"    = module.cosmos_db["cosmosdb"].cosmos_connection_str
    "be-app-secret"                = var.be-app-secret
    "atlas-sp-secret"              = var.atlas-sp-secret
    "atlas-github-token"           = var.atlas-github-token
    "cliff-secret"                 = var.cliff-secret
    "databricks-clientid"          = var.databricks-clientid
    "databricks-clientsecret"      = var.databricks-clientsecret
    "dsp-config-git-token"         = var.dsp-config-git-token

  }
  access_policy = {
    "sp_atlas" = data.azurerm_client_config.current.object_id
  }

  common_tags = {
    project = "Atlas"
  }
}