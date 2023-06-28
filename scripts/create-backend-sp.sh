#!/bin/bash
#create SP
#az ad sp create-for-rbac --role="Owner" --scopes="/" --name="Enterprise-Scale-GitHub-Actions"

RESOURCE_GROUP_NAME=tfstate-rg
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstates # Create resource group
az group create --name $RESOURCE_GROUP_NAME --location "West Europe" # Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_GRS --encryption-services blob # Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv) # Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY 
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"

