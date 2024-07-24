output "plan_id" {
  description = "The ID of this App Service plan."
  value       = azurerm_service_plan.this.id
}

output "kind" {
  description = "The kind of this App Service plan."
  value       = azurerm_service_plan.this.kind
}

output "os_type" {
  description = "The OS type of this App Service plan."
  value       = azurerm_service_plan.this.os_type
}

output "reserved" {
  description = "Is this a reserved App Service plan type?"
  value       = azurerm_service_plan.this.reserved
}
