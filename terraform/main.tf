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
  subscription_id = "XXXXXXXXXX"
  client_id       = "XXXXXXXXXX"
  client_secret   = "XXXXXXXXXX"
  tenant_id       = "XXXXXXXXXX"
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

