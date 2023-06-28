# Set the subscription
#az login 
az account list --query "[].{Name:name, Id:id}" --output table 
$subscriptionid = Read-Host "input subscription id"
az account set --subscription $subscriptionid
$resourceGroups = az group list --query "[].{Name:name, Id:id}" --output json | ConvertFrom-Json

# Create variables to store resource group names and IDs
$resourceGroupNames = @()
$resourceGroupIds = @()

# Loop through the resource groups and extract names and IDs
foreach ($group in $resourceGroups) {
    $resourceGroupNames += $group.Name 
    $resourceGroupIds += $group.Id
}



foreach ($name in $resourceGroupNames) {
    Write-Host $name
    
    mkdir $name
    cd $name
    & 'C:\Program Files\aztfexport\aztfexport.exe' resource-group --non-interactive --hcl-only $name
    cd ..
}