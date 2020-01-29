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
