variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name in Azure"
}

variable "account_tier" {
  type        = string
  description = "Size of storage account tier"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
