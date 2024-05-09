# Using Get-Process cmdlet to get information about running processes
$processes = Get-Process

# Displaying properties of the first process in the collection
$firstProcess = $processes[0]

# Accessing specific properties (e.g., Name, ID, CPU usage)
Write-Host "Process Name: $($firstProcess.Name)"
Write-Host "Process ID: $($firstProcess.Id)"
Write-Host "CPU Usage: $($firstProcess.CPU)"
