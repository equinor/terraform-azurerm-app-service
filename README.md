# Terraform module for Azure App Service

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-app-service)](https://github.com/equinor/terraform-azurerm-app-service/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-app-service)](https://github.com/equinor/terraform-azurerm-app-service/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-app-service/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure App Service resources.

Serves as a soft prerequisite for the [Azure Web App](https://registry.terraform.io/modules/equinor/web-app/azurerm/latest) and [Azure Function App](https://registry.terraform.io/modules/equinor/function-app/azurerm/latest) modules.

## Features

- Alerts sent to the given action group:
  - Average CPU percentage past 5 minutes greater than 90%.
  - Average memory percentage past 5 minutes greater than 90%.

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Monitoring Contributor` at the action group scope.

## Usage

### Linux plan

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

### Windows plan

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
  os_type             = "Windows"
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

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
