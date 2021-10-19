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