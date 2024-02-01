# Test-HostConnection: Tests the reachability of a target host using Test-Connection cmdlet.
<#
.SYNOPSIS
Tests the reachability of a target host.

.DESCRIPTION
This function uses Test-Connection cmdlet to check if the target host is reachable.

.PARAMETER TargetHost
Specifies the target host to test.

.EXAMPLE
Test-HostConnection -TargetHost "example.com"
#>
function Test-HostConnection {
    param (
        [string]$TargetHost
    )

    if (Test-Connection -ComputerName $TargetHost -Count 1 -Quiet) {
        Write-Output "$TargetHost is reachable."
    } else {
        Write-Output "$TargetHost is unreachable."
    }
}

# Test-Port: Tests the availability of a port on a target host.
<#
.SYNOPSIS
Tests the availability of a port on a target host.

.DESCRIPTION
This function uses a TcpClient to attempt a connection to the specified port on the target host.

.PARAMETER TargetHost
Specifies the target host.

.PARAMETER Port
Specifies the port number to test.

.EXAMPLE
Test-Port -TargetHost "example.com" -Port 80
#>
function Test-Port {
    param (
        [string]$TargetHost,
        [int]$Port
    )

    $tcpClient = New-Object System.Net.Sockets.TcpClient
    try {
        $tcpClient.Connect($TargetHost, $Port)
        Write-Output "Port $Port is open on $TargetHost."
    } catch {
        Write-Output "Port $Port is closed on $TargetHost."
    } finally {
        $tcpClient.Dispose()
    }
}

# Get-RemoteDiskInfo: Retrieves information about logical disks on a remote computer.
<#
.SYNOPSIS
Retrieves information about logical disks on a remote computer.

.DESCRIPTION
This function uses Get-CimInstance to query information about logical disks on the specified remote computer.

.PARAMETER ComputerName
Specifies the name of the remote computer.

.EXAMPLE
Get-RemoteDiskInfo -ComputerName "RemoteServer"
#>
function Get-RemoteDiskInfo {
    param (
        [string]$ComputerName
    )

    $diskInfo = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $ComputerName 

    foreach ($disk in $diskInfo) {
        $diskSizeGB = [math]::Round($disk.Size / 1GB, 2)
        $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)

        [PSCustomObject]@{
            DriveLetter = $disk.DeviceID
            TotalSizeGB = $diskSizeGB
            FreeSpaceGB = $freeSpaceGB
        }
    }
}

# Get-OSInfo: Retrieves information about the operating system on a computer.
<#
.SYNOPSIS
Retrieves information about the operating system on a computer.

.DESCRIPTION
This function uses Get-CimInstance to query information about the operating system on the specified computer.

.PARAMETER ComputerName
Specifies the name of the computer. Defaults to the local computer.

.EXAMPLE
Get-OSInfo -ComputerName "RemoteServer"
#>
function Get-OSInfo {
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

# Invoke-ParallelTask: Invokes a task in parallel on multiple computers.
<#
.SYNOPSIS
Invokes a task in parallel on multiple computers.

.DESCRIPTION
This workflow uses foreach -parallel to run a task on multiple computers simultaneously.

.PARAMETER Computers
Specifies an array of computer names on which to run the parallel task.

.EXAMPLE
$computers = @("vm1", "vm2")
Invoke-ParallelTask -Computers $computers
#>
workflow Invoke-ParallelTask {
    param (
        [string[]]$Computers
    )

    foreach -parallel ($Computer in $Computers) {
        sequence {
            InlineScript {
                $result = Invoke-Command -ComputerName $using:Computer -ScriptBlock {
                    # Perform some task on the remote computer
                    "Task completed on $env:COMPUTERNAME"
                }

                $result
            }
        }
    }
}
