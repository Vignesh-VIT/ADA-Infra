output "ns_id" {
  description = "The ID of the Azure Service Bus namespace."
  value       = azurerm_servicebus_namespace.sb-ns.id
}

output "servicebus_primary_connection_str" {
  description = "The primary connection string for the Azure Service Bus namespace."
  value       = azurerm_servicebus_namespace.sb-ns.default_primary_connection_string
}