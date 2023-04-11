locals {
  config = yamldecode(file("config/${var.team_name}.yml"))
}

##########################
##### Resource Groups ####
##########################
module "resource_group_1_0_0" {
  source = "./modules/resource-group-1.0.0"

  for_each = { for k, value in lookup(local.config, "resource_groups", []) : value.name => value
    if value.version == "1.0.0"
  }

  name = each.value.name
}

module "resource_group_2_0_0" {
  source = "./modules/resource-group-2.0.0"

  for_each = { for k, value in lookup(local.config, "resource_groups", []) : value.name => value
    if value.version == "2.0.0"
  }

  name = each.value.name
}

# Move a module like this? 
moved {
  from = module.resource_group_1_0_0
  to   = module.resource_group_2_0_0
}

###########################
##### Storage Accounts ####
###########################
module "storage_account_1_0_0" {
  source = "./modules/storage-account-1.0.0"

  for_each = { for k, value in lookup(local.config, "storage_accounts", []) : value.name => value
    if value.version == "1.0.0"
  }

  name                = each.value.name
  resource_group_name = module.resource_group_1_0_0[each.value.name].name
}

module "storage_blob_containers_1_0_0" {
  source = "./modules/storage-blob-containers-1.0.0"

  containers = flatten([
    for account in lookup(local.config, "storage_accounts", []) : [
      for container in lookup(account, "containers", []) : {
        name                 = container.name
        storage_account_name = module.storage_account_1_0_0[account.name].name
      }
    ]

    if account.version == "1.0.0"
    ]
  )
}