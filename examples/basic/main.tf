provider "azurerm" {
  features {}
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_monitor_action_group" "this" {
  name                = "ag-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  short_name          = "p0action"
  enabled             = true

  arm_role_receiver {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  }
}

module "app_service" {
  # source = "equinor/app-service/azurerm"
  source = "../.."

  plan_name           = "plan-${random_id.example.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  action_group_id     = azurerm_monitor_action_group.this.id
}
