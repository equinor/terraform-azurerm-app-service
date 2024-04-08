variable "plan_name" {
  description = "The name of this App Service plan."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "os_type" {
  description = "The OS type of this App Service plan."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name for this service plan."
  type        = string
  default     = "B1"
}

variable "action_group_id" {
  description = "The ID of the action group to send alerts to."
  type        = string
  nullable    = false
}

variable "cpu_percentage_metric_alert_threshold" {
  description = "The average CPU usage threshold that should trigger an alert. Value must be between 0 and 100."
  type        = number
  default     = 90
  nullable    = false

  validation {
    condition     = var.cpu_percentage_metric_alert_threshold >= 0 && var.cpu_percentage_metric_alert_threshold <= 100
    error_message = "CPU percentage metric alert threshold must be between 0 and 100."
  }
}

variable "cpu_percentage_metric_alert_frequency" {
  description = "The average CPU usage evaluation frequency. Value must be in ISO 8601 duration format, e.g. \"PT1M\"."
  type        = string
  default     = "PT1M"
  nullable    = false
}

variable "memory_percentage_metric_alert_threshold" {
  description = "The average memory usage that should trigger an alert. Value must be between 0 and 100."
  type        = number
  default     = 90
  nullable    = false

  validation {
    condition     = var.memory_percentage_metric_alert_threshold >= 0 && var.memory_percentage_metric_alert_threshold <= 100
    error_message = "Memory percentage metric alert threshold must be between 0 and 100."
  }
}

variable "memory_percentage_metric_alert_frequency" {
  description = "The average memory usage evaluation frequency. Value must be in ISO 8601 duration format, e.g. \"PT1M\"."
  type        = string
  default     = "PT1M"
  nullable    = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
