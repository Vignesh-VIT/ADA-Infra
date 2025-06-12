variable "cosmosdb_name" {
  description = "The name of the Cosmos DB account"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Enable or disable public network access"
  type        = bool
}

variable "bosch_ips" {
  description = "List of allowed IPs"
  type        = list(string)
}