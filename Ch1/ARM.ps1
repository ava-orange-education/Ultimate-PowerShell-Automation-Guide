# Azure PowerShell module
Connect-AzAccount

# Variables
$resourceGroupName = "YourResourceGroup"
$location = "East US"
$templateUri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-storage-account-create/azuredeploy.json"

# Deploy Azure resources
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateUri
