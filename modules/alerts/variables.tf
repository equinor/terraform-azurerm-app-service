variable "resource_group_name" {
  description = "The name of the resource group where the alert rules will be created."
  type        = string
  nullable    = false
}

variable "service_plans" {
  description = "A map of App Service plans to create alert rules for. The key is the plan name and the value is the plan ID."
  type        = map(string)
  nullable    = false
}

variable "plan_name" {
  description = "The name of the App Service plan to associate with the alerts."
  type        = string
  nullable    = false
}

variable "plan_id" {
  description = "The id of the App Service plan to associate with the alerts."
  type        = string
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

variable "cpu_precentage_rule_name" {
  description = "A custom name for the CPU Precentage alert. If value is set to null, the default name \"<Plan Name> (CPU Precentage)\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}

variable "memory_precentage_rule_name" {
  description = "A custom name for the CPU Memory alert. If value is set to null, the default name \"<Plan Name> (Memory Precentage)\" will be used for this alert rule."
  type        = string
  nullable    = true
  default     = null
}
