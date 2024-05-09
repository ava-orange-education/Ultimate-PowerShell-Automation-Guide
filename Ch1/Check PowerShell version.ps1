# Check PowerShell version
$psVersion = $PSVersionTable.PSVersion
# Display version information
Write-Host "PowerShell Version: $($psVersion.Major).$($psVersion.Minor).$($psVersion.Build).$($psVersion.Revision)"


# Minimum required version
$minRequiredVersion = [Version]'6.0.0'
# Check if the installed version meets the requirement
if ($PSVersionTable.PSVersion -ge $minRequiredVersion) {
    Write-Host "PowerShell version is sufficient to run the script."
} else {
    Write-Host "PowerShell version does not meet the minimum requirement. Please upgrade PS version."
}
