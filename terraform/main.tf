terraform {
  backend "azurerm" {
    resource_group_name  = "carlos-catalan"
    storage_account_name = "carloscatalanl"
    container_name       = "terraform-state-ci-proof"
    key                  = "terraform.tfstate"
  }
}
 
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
 
data "azurerm_client_config" "current" {}


# Create a virtual network within the resource group
resource "azurerm_virtual_network" "my_virtual_network" {
  name                = var.vnet-name
  resource_group_name = var.rg
  location            = var.location
  address_space       = var.vnet-as
}

resource "azurerm_subnet" "my_subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name
  address_prefixes     = var.subnet-ap
}