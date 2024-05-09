$XML='C:\Ultimate PowerShell Automation\webconfig.XML'
Get-Content $XML

# Define parameters for the script
PARAM(
    [String]$XML='C:\Ultimate PowerShell Automation\webconfig.XML',
    [String]$DatabaseName='TargetDB',
    [String]$DatabaseServer='DataCenterDB01'
)

# Create strings to be used for replacement
[string]$db = 'Catalog='+ $DatabaseName
[string]$dbs = 'Source='+ $DatabaseServer

# Read the content of the XML file
(Get-Content $XML) | 
Foreach-Object {
    # Replace "Catalog=..." with the specified database name
    # Replace "Source=..." with the specified database server
    $_ -replace "Catalog=([A-Za-z0-9_]+)", $db -replace "Source=([A-Za-z0-9_]+)", $dbs
} | Set-Content $XML
Get-Content $XML
