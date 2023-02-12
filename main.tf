provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US 2"
}

module "log_workspace_module" {
  source = "./modules"
  name = "logworkspace"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku = "PerGB2018"
}