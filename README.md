# Terraform on Azure – Lab Project

Single provider file: `provider.tf` (root). All labs are child modules and inherit it.

## Setup
    az login
    cp terraform.tfvars.example terraform.tfvars   # fill subscription_id, tenant_id, admin_password
    terraform init
    terraform plan
    terraform apply

## Labs (toggle with enable_labNN variables)
| # | Folder | Topic | Default |
|---|--------|-------|---------|
| 1 | labs/01-getting-started | Resource group, first apply | on |
| 2 | labs/02-virtual-network | VNet + subnets | on |
| 3 | labs/03-linux-vm | Ubuntu VM + NSG + public IP | off |
| 4 | labs/04-windows-vm | Windows 10 VM + NSG + public IP | off |
| 5 | labs/05-storage-static-website | Storage account static website | on |
| 6 | labs/06-for-each | Multiple RGs/storage via for_each | on |
| 7 | labs/07-modules | Reusable module (modules/network) | on |

Run a single lab, e.g. Linux VM only:
    terraform apply -var enable_lab01=false -var enable_lab02=false -var enable_lab05=false \
      -var enable_lab06=false -var enable_lab07=false -var enable_lab03=true

Clean up: `terraform destroy`
