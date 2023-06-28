#!/bin/bash

# Set variables
RESOURCE_GROUP="tfstate-rg"
LOCATION="westeurope"
STORAGE_ACCOUNT_NAME="tfstatestorageaccount42"
CONTAINER_NAME="tfstate-$(openssl rand -hex 4)"

# Check if resource group exists
if ! az group show --name $RESOURCE_GROUP &>/dev/null; then
    # Create resource group if it doesn't exist
    az group create --name $RESOURCE_GROUP --location $LOCATION
fi

# Check if storage account exists
if ! az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP &>/dev/null; then
    # Create storage account if it doesn't exist
    az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --sku Standard_LRS --encryption-services blob
fi

# Create a random integer to append to the container name
RANDOM_INT=$(openssl rand -hex 4)

# Create container with blob level locks enabled
az storage container create --account-name $STORAGE_ACCOUNT_NAME --account-key $(az storage account keys list --account-name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query '[0].value' -o tsv) --name $CONTAINER_NAME --fail-on-exist --metadata tfstate=true --public-access off

# Output storage account and container information
echo "Storage account ID: $(az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query 'id' -o tsv)"
echo "Storage account access key: $(az storage account keys list --account-name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query '[0].value' -o tsv)"
echo "Container name: $CONTAINER_NAME"

