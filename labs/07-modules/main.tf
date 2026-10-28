variable "prefix"   { type = string }
variable "location" { type = string }

locals {
  environments = {
    dev = {
      address_space = ["10.100.0.0/16"]
      subnets       = { app = "10.100.1.0/24", db = "10.100.2.0/24" }
    }
    prod = {
      address_space = ["10.200.0.0/16"]
      subnets       = { app = "10.200.1.0/24", db = "10.200.2.0/24", mgmt = "10.200.3.0/24" }
    }
  }
}

resource "azurerm_resource_group" "this" {
  for_each = local.environments
  name     = "${var.prefix}-lab07-${each.key}-rg"
  location = var.location
}

# Reusing the same local module for every environment
module "network" {
  source   = "../../modules/network"
  for_each = local.environments

  name                = "${var.prefix}-${each.key}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.this[each.key].name
  address_space       = each.value.address_space
  subnets             = each.value.subnets
}

output "vnet_ids" { value = { for k, m in module.network : k => m.vnet_id } }
