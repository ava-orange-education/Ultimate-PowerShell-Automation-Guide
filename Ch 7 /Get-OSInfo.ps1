$scriptBlock = {
    function Get-DiskSpace {
    <#
.SYNOPSIS
    Get-DiskSpace: Retrieves disk space information for specified computers.
.DESCRIPTION
    This function uses WMI to query disk space information for specified computers.
.PARAMETER ComputerName
    Specifies the target computer(s). Defaults to the local computer.
#>
        param (
            [string[]]$ComputerName= $env:COMPUTERNAME
        )
        Get-WmiObject -Class win32_volume -ComputerName $ComputerName | Select-Object @{
            LABEL='Computer';
            EXPRESSION={$ComputerName}
        }, driveletter, label, @{
            LABEL='GBfreespace';
            EXPRESSION={"{0:N2}" -f ($_.freespace/1GB)}
        }
    }


     function Get-OSInfo {
         <#
.SYNOPSIS
    Get-OSInfo: Retrieves operating system information for specified computers.
.DESCRIPTION
    This function uses CIM to query operating system information for specified computers.
.PARAMETER ComputerName
    Specifies the target computer. Defaults to the local computer.
#>
    param (
        [string]$ComputerName = $env:COMPUTERNAME
    )

    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName

    [PSCustomObject]@{
        ComputerName  = $osInfo.CSName
        OSName        = $osInfo.Caption
        Version       = $osInfo.Version
        Architecture  = $osInfo.OSArchitecture
        ServicePack   = $osInfo.ServicePackMajorVersion
        LastBootTime  = $osInfo.LastBootUpTime
    }
}
}

<#
.SYNOPSIS
    Get-OSInfo: Displays a test message for the dynamic function.
.DESCRIPTION
    This function serves as a placeholder and currently displays a test message.
.NOTES
    The purpose of this function is for testing and demonstration purposes.
#>
function Get-OSInfo {
    <#
    .EXAMPLE
        Get-OSInfo
        Displays the test message for the dynamic function.
    #>

    Write-Host "Test Dynamic function"
}


# Specify the module name
$moduleName = 'dynamic'

# Create a dynamic module with the specified script block
$module = New-Module -ScriptBlock $scriptBlock -Name $moduleName -ModuleType ScriptModule -AsCustomObject

# Call the Get-DiskSpace function on the dynamic module
$module.'Get-DiskSpace'("localhost")

# Call the Get-OSInfo function on the dynamic module
$module.'Get-OSInfo'("localhost")

# Alternatively, if you want to call the functions without specifying the module will call the normal function within the module

Get-OSInfo 
