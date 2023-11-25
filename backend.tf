terraform {
  backend "azurerm" {
    resource_group_name   = "myrg"
    storage_account_name  = "dvstg991983"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"

  }
}
