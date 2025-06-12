variable "storage_account_id" {
  description = "The ID of the storage account to apply network rules to."
  type        = string
}

variable "default_action" {
  description = "The default action of the network rule (Allow or Deny)."
  type        = string
}

variable "bosch_ips" {
  description = "List of public IP or IP ranges in CIDR format."
  type        = list(string)
  default     = []
}

variable "vnet_subnet_id" {
  description = "List of subnet IDs to allow access."
  type        = list(string)
  default     = []
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are 'AzureServices', 'Logging', 'Metrics', and 'None'."
  type        = list(string)
}