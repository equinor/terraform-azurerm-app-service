provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

module "app_service" {
  # source = "equinor/app-service/azurerm"
  source = "../.."

  plan_name           = "plan-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
}