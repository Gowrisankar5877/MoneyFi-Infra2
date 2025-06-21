terraform {
  backend "azurerm" {
    resource_group_name  = "gowriRG"
    storage_account_name = "gowrisa"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}
