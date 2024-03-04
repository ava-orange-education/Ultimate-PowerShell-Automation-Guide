workflow StartOrStopVM
{
   <#
   .SYNOPSIS
   This runbook starts or stops virtual machines in parallel within a specified Azure resource group.
   
   .DESCRIPTION
   The runbook requires the following parameters:
   - ResourceGroup: Enter the name of the resource group of the VMs.
   - VMs: Enter the names of the virtual machines using the following syntax: ["VM1","VM2","VM3"]
   - Action: Enter "stop" or "start".
   #>

   # Parameters for the runbook
   Param(
       [string]$ResourceGroup,  # Azure resource group name
       [string[]]$VMs,           # Array of VM names
       [string]$Action           # Desired action ("Start" or "Stop")
   )

   # Ensure you do not inherit an AzContext in your runbook
   Disable-AzContextAutosave -Scope Process

   # Connect to Azure with system-assigned managed identity
   Connect-AzAccount -Identity

   # Set and store context (substitute your actual SubscriptionId)
   $AzureContext = Set-AzContext –SubscriptionId "002762c5-25ad-47ea-815d-71bba2cee58d"

   # Start or stop VMs in parallel
   if ($Action -eq "Start") {
       # Loop through each VM and start in parallel
       ForEach -Parallel ($VM in $VMs) {
           Start-AzVM -Name $VM -ResourceGroupName $ResourceGroup -DefaultProfile $AzureContext
       }
   }
   elseif ($Action -eq "Stop") {
       # Loop through each VM and stop in parallel
       ForEach -Parallel ($VM in $VMs) {
           Stop-AzVM -Name $VM -ResourceGroupName $ResourceGroup -DefaultProfile $AzureContext -Force
       }
   }
   else {
       # Output a message if an invalid action is provided
       Write-Output "`r`n Action not allowed. Please enter 'stop' or 'start'."
   }
}

