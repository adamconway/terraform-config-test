terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}

variable "containers" { 
}

resource "azurerm_storage_container" "name" {
  for_each = { 
    for k, value in var.containers : value.name => value
  }

  name                = "configtest${each.value.name}"
  storage_account_name = each.value.storage_account_name
}