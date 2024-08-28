variable "plan_name" {
  description = "The name of this App Service plan."
  type        = string
  nullable    = false
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
  nullable    = false
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
  nullable    = false
}

variable "os_type" {
  description = "The OS type of this App Service plan. Value must be \"Linux\" or \"Windows\"."
  type        = string
  default     = "Linux"
  nullable    = false

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "OS type must be \"Linux\" or \"Windows\"."
  }
}

variable "sku_name" {
  description = "The SKU name for this App Service plan."
  type        = string
  default     = "B1"
  nullable    = false
}

variable "action_group_id" {
  description = "The ID of the action group to send alerts to."
  type        = string
  nullable    = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
  nullable    = false
}
