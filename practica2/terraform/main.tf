terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

#Creamos nuestro service principal
#IMPORTANTE! NO SUBIR ESTE FICHERO AL GIT!
provider "azurerm" {
  features {}
  subscription_id = "25ec5d1d-f242-40b6-b79e-001c040416d0"
  client_id       = "6c66c545-3a48-40d7-b879-e264bae2bb11"
  client_secret   = "COASpwK.~1lqr-Bl4G2nvHhZ221FULw~.."
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}


#Creamos nuestro resource group
resource "azurerm_resource_group" "rg"{
  name = "kubernetes_rg"
  location = var.location
  tags = {
    environment = "CP2"
  }
}

#Creamos un storage account
resource "azurerm_storage_account" "stAccount"{
  name = "antostaccount2vm"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}

