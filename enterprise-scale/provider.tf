# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate4340"
    container_name       = "tfstates"
    key                  = "Enterprise-Scale-cstato.tfstate"
  }
  required_providers {
    azurerm = {
      version = ">= 3.62.1"
      source  = "hashicorp/azurerm"
    }
  }
}# Configure the Azure provider
provider "azurerm" { 
  features {}  
}

provider "azurerm" {
  alias = "connectivity"
  features {}
  subscription_id = var.subscription_id_connectivity
}

provider "azurerm" {
  alias = "management"
  features {}
  subscription_id = var.subscription_id_management
}

provider "azurerm" {
  alias = "identity"
  features {}
  subscription_id = var.subscription_id_identity
}