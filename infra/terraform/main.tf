terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "main" {
  name     = "cloudops-lab-rg"
  location = "eastus"

  tags = {
    project = "cloudops-lab"
    env     = "dev"
    owner   = "greg"
  }

}