# Terraform module for Azure App Service

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-app-service)](https://github.com/equinor/terraform-azurerm-app-service/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-app-service)](https://github.com/equinor/terraform-azurerm-app-service/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-app-service/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure App Service resources.

Serves as a soft prerequisite for the [Azure Web App](https://registry.terraform.io/modules/equinor/web-app/azurerm/latest) and [Azure Function App](https://registry.terraform.io/modules/equinor/function-app/azurerm/latest) modules.

## Prerequisites

- Azure role `Contributor` at the resource group scope.

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
}


resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "northeurope"
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
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "northeurope"
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
