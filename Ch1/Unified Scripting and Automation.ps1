# Example of using a module for Azure automation (Azure PowerShell module)
# Connect to Azure
Connect-AzAccount

# Manage Azure resources
Get-AzResourceGroup
New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -SkuName Standard_LRS -Location "East US"
