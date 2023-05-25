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

variable "autoscale_enabled" {
  description = "Specifies whether automatic scaling is enabled for the target resource."
  type        = bool
  default     = true
}

variable "autoscale_profile_capacity_default" {
  description = "The number of instances that are available for scaling if metrics are not available for evaluation."
  type        = number
  default     = 1
}

variable "autoscale_profile_capacity_minimum" {
  description = "The minimum number of instances for this resource."
  type        = number
  default     = 1
}

variable "autoscale_profile_capacity_maximum" {
  description = "The maximum number of instances for this resource."
  type        = number
  default     = 10
}


variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "profile" {
  description = "A map of profiles to create for the autoscaling settings"

  type = map(object({
    name = string

    profile = object({
      profile_name = string

      capacity = object({
        capacity_default = number
        capacity_minimum = number
        capacity_maximum = number
      })
    })
  }))

  default {}
}
