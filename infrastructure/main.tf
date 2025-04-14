terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "app_rg" {
  name     = "cst8918finalgroup5"
  location = "East US"
}

resource "azurerm_virtual_network" "main_vnet" {
  name                = "cst8918finalvngroup5"
  location            = azurerm_resource_group.app_rg.location # Corrected
  resource_group_name = azurerm_resource_group.app_rg.name     # Corrected
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "main_subnet" {
  name                 = "cst8918finalvmgroup5"
  resource_group_name  = azurerm_resource_group.app_rg.name # Corrected
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}