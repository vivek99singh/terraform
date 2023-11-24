
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

# Configure the Terraform backend after the resources are created
resource "null_resource" "configure_backend" {
  triggers = {
    resource_group_id = azurerm_resource_group.rg.id
    storage_account_id = azurerm_storage_account.stg.id
  }


  provisioner "local-exec" {
    command = <<EOT
    cat <<EOF > backend.tf
    terraform {
      backend "azurerm" {
        resource_group_name   = "${azurerm_resource_group.rg.name}"
        storage_account_name  = "${azurerm_storage_account.stg.name}"
        container_name        = "tfstate"
        key                   = "devterraform.tfstate"
      }
    }
    EOF
    EOT
  }
}

