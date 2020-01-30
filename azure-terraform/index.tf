# Azure Provider
# Expects the following environment variables to be set
# - ARM_TENANT_ID
# - ARM_SUBSCRIPTION_ID
# - ARM_CLIENT_ID
# - ARM_CLIENT_SECRET
provider azurerm {}

# Expects ARM_ACCESS_KEY
terraform {
  backend azurerm {}
}

resource "azurerm_resource_group" "rg" {
  name     = "ds-tmp-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "sg" {
  name                     = "storageaccountname"
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_container" "container" {
  name                  = "tmp-container"
  resource_group_name   = azurerm_resource_group.rg.name
  storage_account_name  = azurerm_storage_account.sg.name
  container_access_type = "private"
}
