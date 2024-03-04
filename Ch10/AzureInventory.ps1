# Azure Inventory

<#
.SYNOPSIS
    This script retrieves information about Azure VMs and displays selected properties in a formatted table.

.DESCRIPTION
    The script fetches details of the first 5 Azure VMs, such as VM name, size, resource group, OS type, and more.
    It then creates a formatted table displaying the selected VM properties.

.NOTES
    File Name      : Get-AzureVMInfo.ps1
    Author         : Prashanth Jayaram
    Prerequisite   : Azure PowerShell Module

.EXAMPLE
    .\Get-AzureVMInfo.ps1
    # Runs the script and displays information about the first 5 Azure VMs.

#>

# Clear existing Azure context
Clear-AzContext -Force

# Define service principal credentials
$clientSecret = 'E-R8Q~m4OhXhuPtwsNfsIa9MOWzwflzeuyfBVc3u' | ConvertTo-SecureString -AsPlainText -Force
$connectCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'd27561a7-ecc1-49f9-a97e-ea4c0469c6ba',$clientSecret

# Connect to Azure with service principal
Connect-AzAccount -ServicePrincipal -Credential $connectCreds -Tenant da9d7617-d9fc-461d-80ec-72cc0de2fddb

# Initialize an array to store Azure VM information
$AzureVM = @()

# Get the first 5 VMs
$vms = Get-AzVM | Select-Object -First 5

# Display total VM count
Write-Host "Total $($vms.Count)"

# Initialize variables for counting
$total = $vms.Count
$count = 1

# Iterate through each Azure VM
ForEach ($azVM in $vms) {
    # Retrieve VM details
    $vmSize = (Get-AzVM -Name $azVM.Name).HardwareProfile.VmSize
    $VmOS = Get-AzVM -Name $azVM.Name -ResourceGroupName $azVM.ResourceGroupName -Status
    $tags = (Get-AzResource -Name $azVM.Name).Tags

    # Build a hashtable with VM properties
    $props = @{
        VMName            = $azVM.Name
        Region            = $azVM.Location
        OsType            = $azVM.StorageProfile.OsDisk.OsType
        ResourceGroupName = $azVM.ResourceGroupName
        VMSize            = $vmSize
        OsName            = $VmOS.OsName
        OsVersion         = $VmOS.OsVersion
        CPUCore           = (Get-AzVMSize -Location $azVM.Location | Where-Object { $_.name -eq $VMSize }).NumberOfCores
        OSVer             = $azVM.StorageProfile.ImageReference.Offer + " $($azVM.StorageProfile.ImageReference.Sku)"
        
    }

    # Check for LicenseType and add to properties
    if (!$azVM.LicenseType) {
        $props += @{
            LicenseType = "No_License"
        }
    } else {
        $props += @{
            LicenseType = $azVM.LicenseType
        }
    }

    # Create a PSObject with VM properties
    $ServiceObject = New-Object -TypeName PSObject -Property $props
    $AzureVM += $ServiceObject

    # Display progress
    Write-Host "Processing VM ($count/$total): ""$($azVM.Name)"""
    $count++
}

# Display selected VM properties in a formatted table
$AzureVM | Select VMName, VMSize, ResourceGroupName, OsName, OsVersion, Region, CPUCore, LicenseType, OSType | Format-Table -AutoSize
