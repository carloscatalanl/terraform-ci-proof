# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.80.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "my_resource_group" {
  name     = "TerraformProofSub"
  location = var.location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "my_virtual_network" {
  name                = "myVNetwork"
  resource_group_name = azurerm_resource_group.my_resource_group.name
  location            = azurerm_resource_group.my_resource_group.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "my_subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.my_resource_group.name
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}