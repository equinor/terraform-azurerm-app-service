output "cpu_precentage_alert_rule_id" {
  description = "The ID of the CPU Percentage alert rule."
  value       = azurerm_monitor_metric_alert.cpu_precentage.id
}

output "memory_percentage_alert_rule_id" {
  description = "The ID of the Memory Percentage alert rule."
  value       = azurerm_monitor_metric_alert.memory_percentage.id
}