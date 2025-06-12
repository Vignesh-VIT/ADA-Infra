variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

variable "sb_ns_name" {
  type        = string
  description = "SB namespace name in Azure"
}

variable "sb_ns_sku" {
  type        = string
  description = "SB namespace sku in Azure"
}

variable "sb_ns_capacity" {
  type        = number
  description = "SB namespace capacity in Azure"
}

variable "premium_messaging_partitions" {
  description = "Number of premium messaging partitions for the Service Bus namespace."
  type        = number
}