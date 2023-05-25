resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  for_each = var.autoscale_profile

  name                = each.value["name"]
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  target_resource_id  = azurerm_service_plan.this.id
  enabled             = var.autoscale_enabled

  dynamic "autoscale_profile" {
    for_each = each.value["profile"]

    content {
      profile_name = profile.value["profile_name"]

      capacity {
        capacity_default = profile.value["capacity_default"]
        capacity_minimum = profile.value["capacity_minimum"]
        capacity_maximum = profile.value["capacity_maximum"]
      }
    }
  }
}
