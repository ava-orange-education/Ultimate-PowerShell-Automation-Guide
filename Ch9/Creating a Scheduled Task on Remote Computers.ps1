PS C:\WINDOWS\system32> Invoke-Command -ComputerName "TestMachine.cloud.com" -ScriptBlock {
 $action = New-ScheduledTaskAction -Execute "C:\temp\hello-world.ps1" 
 $trigger = New-ScheduledTaskTrigger -AtLogOn 
 Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "RunOnLogon" }

Checking Disk Space on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, FreeSpace, Size } 

Querying System Information on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Get-CimInstance Win32_ComputerSystem | Select-Object Name, Manufacturer, Model } 

Restarting Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Restart-Computer -Force } 

Creating a New Folder on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { New-Item -ItemType Directory -Path "C:\NewFolder" } 

Checking for Pending Updates on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Get-HotFix -Description "Update" } 

Collecting Network Configuration Information:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Get-NetIPAddress | Select-Object IPAddress, InterfaceAlias } 
Stopping a Specific Process on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Stop-Process -Name "ProcessName" -Force } 

Installing Windows Updates on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Install-WindowsUpdate -Force } 

Querying Installed Software on Remote Computers:
Invoke-Command -ComputerName "RemoteComputer1", "RemoteComputer2" -ScriptBlock { Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName, DisplayVersion } 

