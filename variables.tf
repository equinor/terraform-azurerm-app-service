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

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
