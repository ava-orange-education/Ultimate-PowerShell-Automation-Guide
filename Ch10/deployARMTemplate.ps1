# Customize and deploy ARM template
# Parameters
$resourceGroupName = "armdemoRG"
$deploymentName = "VMDeploymentv1"
# Download the Ch10/Chapter 10 - ARM - Deploying Azure Virtual Machine with ARM Template.JSON" and save the templateFilePath.
# Make sure to enter the correct path
$templateFilePath = "C:\Ultimate PowerShell Automation\Chapter 10 - ARM - Deploying Azure Virtual Machine with ARM Template.JSON"
$storageAccountName = "vmstg"
$VirtualMachineName ="armdemovm"

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location "CentralIndia" 

$params = @{
    storageAccountName = $storageAccountName
    VirtualMachineName = $VirtualMachineName
}


#Test the deployment

Test-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath `
-TemplateParameterObject $params 
