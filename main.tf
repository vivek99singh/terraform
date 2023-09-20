
## The below block of code creates new resource group in Azure subscription
provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "myrg"
  location = "West Europe"
}

# Create a Storage Account within the Resource Group
resource "azurerm_storage_account" "stg" {
  name                     = "dvstg991983"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Configure the Terraform backend to use Azure Blob Storage
terraform {
  backend "azurerm" {
    resource_group_name   = azurerm_resource_group.rg.name
    storage_account_name  = azurerm_storage_account.stg.name
    container_name        = "tfstate"
    key                   = "devterraform.tfstate"
  }
}


