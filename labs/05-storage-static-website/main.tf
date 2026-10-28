variable "prefix"   { type = string }
variable "location" { type = string }

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-lab05-rg"
  location = var.location
}

resource "azurerm_storage_account" "this" {
  name                     = "${var.prefix}web${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

resource "azurerm_storage_account_static_website" "this" {
  storage_account_id = azurerm_storage_account.this.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<html><body><h1>Hello from Terraform on Azure!</h1></body></html>"
  depends_on             = [azurerm_storage_account_static_website.this]
}

resource "azurerm_storage_blob" "notfound" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<html><body><h1>404 - Not Found</h1></body></html>"
  depends_on             = [azurerm_storage_account_static_website.this]
}

output "website_url" { value = "https://${azurerm_storage_account.this.primary_web_host}" }
