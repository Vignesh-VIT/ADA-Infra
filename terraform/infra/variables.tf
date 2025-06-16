variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Environment must be one of: dev, qa, prod."
  }
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "be-app-secret" {
  description = "Application secret"
  type        = string
}

variable "atlas-sp-secret" {
  description = "Service Principle for Read access to Keyvault"
  type        = string
}

variable "atlas-github-token" {
  description = "GitHub Token for Atlas application "
  type        = string
}

variable "cliff-secret" {
  description = "Cliff Secret"
  type        = string
}

variable "databricks-clientid" {
  description = "Databricks Client ID"
  type        = string
}

variable "databricks-clientsecret" {
  description = "Databricks Client Secret"
  type        = string
}

variable "dsp-config-git-token" {
  description = "Config Token for dsp-config"
  type        = string
}