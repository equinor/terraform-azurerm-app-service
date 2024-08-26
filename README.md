# Azure App Service Terraform module

[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-app-service/badge)](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-app-service/badge)
[![Equinor Terraform Baseline](https://img.shields.io/badge/Equinor%20Terraform%20Baseline-1.0.0-blueviolet)](https://github.com/equinor/terraform-baseline)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

Terraform module which creates Azure App Service resources.

Serves as a soft prerequisite for the [Azure Web App](https://registry.terraform.io/modules/equinor/web-app/azurerm/latest) and [Azure Function App](https://registry.terraform.io/modules/equinor/function-app/azurerm/latest) Terraform modules.

## Features

- Send alerts to the given action group based on the following conditions:
  - Average CPU percentage past 5 minutes greater than 90%.
  - Average memory percentage past 5 minutes greater than 90%.

## Development

1. Clone this repository:

    ```console
    git clone https://github.com/equinor/terraform-azurerm-storage.git
    ```

1. Login to Azure:

    ```console
    az login
    ```

1. Set active subscription:

    ```console
    az account set -s <SUBSCRIPTION_NAME_OR_ID>
    ```

1. Set environment variables:

    ```console
    export TF_VAR_resource_group_name=<RESOURCE_GROUP_NAME>
    export TF_VAR_location=<LOCATION>
    ```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
