# Customize and deploy ARM template
# Parameters
$resourceGroupName = "armdemoRG"
$deploymentName = "VMDeploymentv1"
$templateFilePath = "C:\Ultimate PowerShell Automation\ExportedTemplate-MyPowerShellRG\armtestdeployment.json"
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
