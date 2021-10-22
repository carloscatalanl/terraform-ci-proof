variable "rg" {
  type        = string
  description = "Enter a Resource Group:"
}

variable "location" {
  type        = string
  description = "Enter a location:"
}

variable "vnet-name" {
  type        = string
  description = "Enter a Virtual Network Name:"
}
variable "vnet-as" {
  type        = list(any)
  description = "Enter a Virtual Network Adress Space:"
}

variable "subnet-name" {
  type        = string
  description = "Enter a Subnet Name:"
}
variable "subnet-ap" {
  type        = list(any)
  description = "Enter a Subnet Adress Prefixes:"
}