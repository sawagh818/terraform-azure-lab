variable "prefix"   { type = string }
variable "location" { type = string }

locals {
  resource_groups = {
    app  = "centralindia"
    data = "southindia"
    logs = "centralindia"
  }
}

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

# One resource group per map entry
resource "azurerm_resource_group" "this" {
  for_each = local.resource_groups
  name     = "${var.prefix}-lab06-${each.key}-rg"
  location = each.value
}

# One storage account per resource group
resource "azurerm_storage_account" "this" {
  for_each                 = azurerm_resource_group.this
  name                     = "${var.prefix}${each.key}${random_string.suffix.result}"
  resource_group_name      = each.value.name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_names" {
  value = { for k, v in azurerm_storage_account.this : k => v.name }
}
