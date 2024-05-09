# PowerShell script to configure registry settings

# Registry path and key
$registryPath = "HKLM:\Software\MyApp"
$registryKey = "ConfigSetting"
$registryValue = "Enabled"

# Set registry value
New-Item -Path $registryPath -Force
Set-ItemProperty -Path $registryPath -Name $registryKey -Value $registryValue

Get-ItemProperty -Path  "HKLM:\Software\MyApp"
