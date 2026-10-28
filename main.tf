module "lab01" {
  count    = var.enable_lab01 ? 1 : 0
  source   = "./labs/01-getting-started"
  prefix   = var.prefix
  location = var.location
}

module "lab02" {
  count    = var.enable_lab02 ? 1 : 0
  source   = "./labs/02-virtual-network"
  prefix   = var.prefix
  location = var.location
}

module "lab03" {
  count             = var.enable_lab03 ? 1 : 0
  source            = "./labs/03-linux-vm"
  prefix            = var.prefix
  location          = var.location
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  allowed_source_ip = var.allowed_source_ip
}

module "lab04" {
  count             = var.enable_lab04 ? 1 : 0
  source            = "./labs/04-windows-vm"
  prefix            = var.prefix
  location          = var.location
  admin_username    = var.admin_username
  admin_password    = var.admin_password
  allowed_source_ip = var.allowed_source_ip
}

module "lab05" {
  count    = var.enable_lab05 ? 1 : 0
  source   = "./labs/05-storage-static-website"
  prefix   = var.prefix
  location = var.location
}

module "lab06" {
  count    = var.enable_lab06 ? 1 : 0
  source   = "./labs/06-for-each"
  prefix   = var.prefix
  location = var.location
}

module "lab07" {
  count    = var.enable_lab07 ? 1 : 0
  source   = "./labs/07-modules"
  prefix   = var.prefix
  location = var.location
}
