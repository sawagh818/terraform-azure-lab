variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "location" {
  type    = string
  default = "centralindia"
}
variable "prefix" {
  type    = string
  default = "tflab"
}
variable "admin_username" {
  type    = string
  default = "azureadmin"
}
variable "admin_password" {
  type      = string
  sensitive = true
  default   = null
}
variable "allowed_source_ip" {
  description = "Source IP/CIDR allowed for SSH/RDP. Use your public IP."
  type        = string
  default     = "*"
}

# Lab toggles (VMs cost money, so they are off by default)
variable "enable_lab01" { default = true }
variable "enable_lab02" { default = true }
variable "enable_lab03" { default = false }
variable "enable_lab04" { default = false }
variable "enable_lab05" { default = true }
variable "enable_lab06" { default = true }
variable "enable_lab07" { default = true }
