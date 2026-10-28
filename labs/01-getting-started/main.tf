variable "prefix"   { type = string }
variable "location" { type = string }

resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-lab01-rg"
  location = var.location
  tags     = { lab = "01-getting-started" }
}

output "resource_group_name" { value = azurerm_resource_group.this.name }
