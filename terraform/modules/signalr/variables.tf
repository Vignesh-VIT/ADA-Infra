variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

variable "sku" {
  type        = string
  description = "SignalR Sku in Azure"
}

variable "signalr_name" {
  type        = string
  description = "Signalr name in Azure"
}

variable "capacity" {
  type        = number
  description = "Signalr capacity in Azure"
}

variable "service_mode" {
  type        = string
  description = "NIC name in Azure"
}