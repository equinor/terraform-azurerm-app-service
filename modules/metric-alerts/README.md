# Terraform module for Azure App Service Alerts

Terraform module which creates App Service Alerts.

[Server Farm Alerts Baseline](https://azure.github.io/azure-monitor-baseline-alerts/services/Web/serverFarms/)

## Features

- Alerts sent to the given action group:
  - Average CPU percentage past 5 minutes greater than 90%.
  - Average memory percentage past 5 minutes greater than 90%.

## Prerequisites

- Azure role `Monitoring Contributor` at the action group scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "app_service" {
  source  = "equinor/app-service/azurerm"
  version = "~> 2.1"

  plan_name           = "example-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

module "app_service_alerts" {
  source = "equinor/app-service/azurerm//modules/alerts"
  version = "~> 2.1"

  resource_group_name = azurerm_resource_group.example.name
  plan_name           = module.app_service.plan_name
  plan_id             = module.app_service.plan_id
  action_group_id     = azurerm_monitor_action_group.example.id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "northeurope"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "Critical Alerts Action"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "p0action"

  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }

  arm_role_receiver {
    name                    = "Monitoring Reader"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
}
```
