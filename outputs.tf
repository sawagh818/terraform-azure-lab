output "lab01_resource_group" { value = try(module.lab01[0].resource_group_name, null) }
output "lab02_vnet_id"        { value = try(module.lab02[0].vnet_id, null) }
output "lab03_linux_public_ip"   { value = try(module.lab03[0].public_ip, null) }
output "lab04_windows_public_ip" { value = try(module.lab04[0].public_ip, null) }
output "lab05_website_url"    { value = try(module.lab05[0].website_url, null) }
output "lab06_storage_accounts" { value = try(module.lab06[0].storage_account_names, null) }
output "lab07_vnets"          { value = try(module.lab07[0].vnet_ids, null) }
