# Import ModuleA
Import-Module -Name 'C:\Ultimate PowerShell Automation\ModuleA.psm1' -Force

# Import ModuleB
Import-Module -Name 'C:\Ultimate PowerShell Automation\ModuleB.psm1' -Force

# Get information about ModuleA
$moduleA = Get-Module -Name ModuleA
Write-Output "Information about ModuleA:"
$moduleA | Format-List

# Get information about ModuleB
$moduleB = Get-Module -Name ModuleB
Write-Output "Information about ModuleB:"
$moduleB | Format-List

# Call Get-Info from ModuleA
Write-Output "Calling Get-Info from ModuleA:"
ModuleA\Get-Info
# Call Get-Info from ModuleB
Write-Output "Calling Get-Info from ModuleB:"
ModuleB\Get-Info
