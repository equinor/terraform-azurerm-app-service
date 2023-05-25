provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${random_id.example.hex}"
  location = var.location
}

module "app_service" {
  # source = "github.com/equinor/terraform-azurerm-app-service?ref=v0.0.0"
  source = "../.."

  plan_name           = "plan-${random_id.example.hex}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  autoscale_setting = {
    "this" = {
      name = "autoscale_setting0"

      profile = {
        profile_name = "profile0"

        capacity = {
          capacity_default = 1
          capacity_minimum = 1
          capacity_maximum = 10
        }
      }
    }
  }
}
