/* Configure Azure Provider and declare all the Variables that will be used in Terraform configurations */
provider "azurerm" {
  features {}
}

variable "location" {
  description = "The default Azure region for the resource provisioning"
  default     = "West Europe"
}
