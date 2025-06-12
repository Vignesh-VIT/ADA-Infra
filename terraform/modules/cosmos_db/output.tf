output "cosmos_connection_str" {
  description = "Outputs the connection string required to connect to the Cosmos DB instance. This string can be used by applications and services to authenticate and interact with the Cosmos DB resource."
  value       = "AccountEndpoint=${azurerm_cosmosdb_account.cosmos_db.endpoint};AccountKey=${azurerm_cosmosdb_account.cosmos_db.primary_key};"
}