provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.105.0"
    }
  }

  required_version = ">= 1.3.0"
}


resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
