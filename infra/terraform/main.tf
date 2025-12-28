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
  location = var.location

  tags = {
    project = "cloudops-lab"
    env     = "dev"
    owner   = "greg"
  }

}


resource "azurerm_container_registry" "main" {
  name                = "cloudopslab1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location


  sku           = "Basic"
  admin_enabled = true


  tags = {
    project = "cloudops-lab"
    env     = "dev"
    owner   = "greg"
  }

}

resource "azure_network_security_group" "main" {
  name = "cloudops-lab-nsg"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule{
    name = "allow-fastapi"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "8000"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

  tags = {
    project ="cloudps-lab"
    env = "dev"
    owner = "greg"
  }


}