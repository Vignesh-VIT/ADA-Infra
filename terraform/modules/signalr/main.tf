resource "azurerm_signalr_service" "signalr_svc" {
  name                = var.signalr_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku
    capacity = var.capacity
  }

  cors {
    allowed_origins = ["*"]
  }

  connectivity_logs_enabled = true
  messaging_logs_enabled    = true
  service_mode              = var.service_mode
}