variable "sb_ns_id" {
  type        = string
  description = "SB namespace id in Azure"
}

variable "sb_queue_name" {
  type        = string
  description = "SB queue name in Azure"
}

variable "sb_queue_size" {
  type        = number
  description = "SB queue size in MB in Azure"
}