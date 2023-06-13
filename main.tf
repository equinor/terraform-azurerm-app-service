resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  name                = var.autoscale_name
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_service_plan.this.id
  enabled             = var.autoscale_enabled

  dynamic "profile" {
    for_each = var.profile

    content {
      name = profile.value["name"]

      dynamic "capacity" {
        for_each = profile.value["capacity"]
        content {
          default = profile.value["default"]
          minimum = profile.value["minimum"]
          maximum = profile.value["maximum"]
        }
      }
    }
  }
}
