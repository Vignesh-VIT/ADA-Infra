output "signalr_primary_connection_str" {
  description = "The primary connection string for the Azure SignalR Service instance."
  value       = azurerm_signalr_service.signalr_svc.primary_connection_string
}