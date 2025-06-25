resource "azurerm_monitor_metric_alert" "cpu_precentage" {
  name                = coalesce(var.cpu_precentage_rule_name, "${var.plan_name} (CPU Percentage)")
  resource_group_name = var.resource_group_name
  scopes              = [var.plan_id]
  description         = "The average CPU used across all instances of the plan."

  criteria {
    metric_namespace = "Microsoft.Web/serverFarms"
    metric_name      = "CpuPercentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  frequency   = "PT1M"
  window_size = "PT5M"
  severity    = 3

  action {
    action_group_id = var.action_group_id
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "memory_percentage" {
  name                = coalesce(var.memory_precentage_rule_name, "${var.plan_name} (CPU Memory)")
  resource_group_name = var.resource_group_name
  scopes              = [var.plan_id]
  description         = "The average memory used across all instances of the plan."

  criteria {
    metric_namespace = "Microsoft.Web/serverFarms"
    metric_name      = "MemoryPercentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  frequency   = "PT1M"
  window_size = "PT5M"
  severity    = 3

  action {
    action_group_id = var.action_group_id
  }

  tags = var.tags
}
