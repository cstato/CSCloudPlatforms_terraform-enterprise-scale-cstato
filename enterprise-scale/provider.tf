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