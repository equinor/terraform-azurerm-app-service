locals {
  # https://azure.github.io/azure-monitor-baseline-alerts/services/Web/serverFarms/ (2024-04-08)
  metric_alerts = {
    "cpu_percentage" = {
      name        = "CPU Percentage"
      description = "The average CPU used across all instances of the plan."
      metric_name = "CpuPercentage"
      aggregation = "Average"
      operator    = "GreaterThan"
      threshold   = 90
      frequency   = "PT1M"
      window_size = "PT5M"
      severity    = 3
    }

    "memory_percentage" = {
      name        = "Memory Percentage"
      description = "The average memory used across all instances of the plan."
      metric_name = "MemoryPercentage"
      aggregation = "Average"
      operator    = "GreaterThan"
      threshold   = 90
      frequency   = "PT1M"
      window_size = "PT5M"
      severity    = 3
    }
  }
}

resource "azurerm_service_plan" "this" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "this" {
  for_each = local.metric_alerts

  name                = each.value.name
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_service_plan.this.id]
  description         = each.value.description

  criteria {
    metric_namespace = "Microsoft.Web/serverFarms"
    metric_name      = each.value.metric_name
    aggregation      = each.value.aggregation
    operator         = each.value.operator
    threshold        = each.value.threshold
  }

  frequency   = each.value.frequency
  window_size = each.value.window_size
  severity    = each.value.severity

  action {
    action_group_id = var.action_group_id
  }

  tags = var.tags
}
