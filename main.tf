resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  name                = "app-service-autoscaling"
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  target_resource_id  = azurerm_service_plan.this.id
  enabled             = var.autoscale_enabled

  profile {
    name = "app-autoscaling-profile"
    capacity {
      default = var.autoscale_profile_capacity_default
      minimum = var.autoscale_profile_capacity_minimum
      maximum = var.autoscale_profile_capacity_maximum
    }
  }
}
