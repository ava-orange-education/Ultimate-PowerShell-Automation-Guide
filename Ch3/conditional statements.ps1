#Example code: 
if ($env:OS -eq "Windows_NT") {
    Write-Output "Running on Windows"
} else {
    Write-Output "Not running on Windows"
}

# Determine the operating system
$operatingSystem = $env:OS

# Function to get system information based on the OS
function Get-SystemInformation {
    param (
        [string]$os
    )

    switch ($os) {
        "Windows_NT" {
            $systemInfo = Get-WmiObject Win32_ComputerSystem
            $architecture = $env:PROCESSOR_ARCHITECTURE
            $installedMemory = $systemInfo.TotalPhysicalMemory / 1GB

            Write-Output "Operating System: Windows"
            Write-Output "Architecture: $architecture"
            Write-Output "Installed Memory: $installedMemory GB"
        }
        "Linux" {
            $kernelVersion = (Get-Command uname).ScriptBlock.InvokeReturnAsIs()
            $homeDirectory = $env:HOME

            Write-Output "Operating System: Linux"
            Write-Output "Kernel Version: $kernelVersion"
            Write-Output "Home Directory: $homeDirectory"
        }
        "Darwin" {
            $macVersion = (Get-Command sw_vers).ScriptBlock.InvokeReturnAsIs()

            Write-Output "Operating System: macOS"
            Write-Output "Version: $macVersion"
        }
        default {
            Write-Output "Unsupported Operating System: $os"
        }
    }
}

# Display system information based on the detected OS
Get-SystemInformation -os $operatingSystem

# Set a custom environment variable for the current session
$env:mydatabase = "AdventureWorks2022"

# Display the custom environment variable
Write-Output "Custom Variable: $($env:mydatabase)"

$env:mydatabase = "AdventureWorks2022"
$databaseName = $env:mydatabase
Write-Output "Executing  script on database: $databaseName"


