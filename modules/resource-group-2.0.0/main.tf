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

resource "azurerm_resource_group" "name" {
  name     = "config-test-${var.name}"
  location = "australiaeast"

  tags = {
    "version" = "2.0.0"
  }
}

output "name" {
  value = azurerm_resource_group.name.name
}