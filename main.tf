
## The below block of code creates new resource group in Azure subscription
resource "azurerm_resource_group" "rg" {
  name     = "testrg"
  location = "West Europe"
}
