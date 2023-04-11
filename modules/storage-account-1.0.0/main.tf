terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

resource "azurerm_storage_account" "name" {
  name                = "configtest${var.name}"
  location            = "australiaeast"
  resource_group_name = var.resource_group_name

  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    "version" = "1.0.0"
  }
}

output "name" {
  value = azurerm_storage_account.name.name
}