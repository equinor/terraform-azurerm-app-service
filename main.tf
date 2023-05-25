resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  for_each = var.autoscale_setting

  name                = each.value["name"]
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  target_resource_id  = azurerm_service_plan.this.id
  enabled             = var.autoscale_enabled

  dynamic "profile" {
    for_each = each.value["profile"]

    content {
      profile_name = autoscale_setting.value["profile_name"]

      capacity {
        capacity_default = autoscale_setting.value["capacity_default"]
        capacity_minimum = autoscale_setting.value["capacity_minimum"]
        capacity_maximum = autoscale_setting.value["capacity_maximum"]
      }
    }
  }
}
