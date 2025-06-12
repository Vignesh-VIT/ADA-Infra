variable "storage_share_name" {
  description = "The name of the storage share."
  type        = string
}

variable "storage_account_id" {
  description = "The resource ID of the storage account."
  type        = string
}

variable "quota" {
  description = "The quota for the storage share in GB."
  type        = number
}