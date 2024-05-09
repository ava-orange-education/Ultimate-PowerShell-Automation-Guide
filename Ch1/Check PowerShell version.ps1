# Check PowerShell version
$psVersion = $PSVersionTable.PSVersion
# Display version information
Write-Host "PowerShell Version: $($psVersion.Major).$($psVersion.Minor).$($psVersion.Build).$($psVersion.Revision)"
