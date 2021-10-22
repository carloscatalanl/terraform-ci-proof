terraform {
  backend "azurerm" {
    resource_group_name  = "carlos-catalan"
    storage_account_name = "carloscatalanl"
    container_name       = "terraform-state-ci-proof"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = "~> 2.0"
  }
}
