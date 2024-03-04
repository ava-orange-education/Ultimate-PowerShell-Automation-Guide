## Loading Azure PowerShell modules
PS C:\> Install-Module Az
PS C:\> Import-Module Az
PS C:\> Get-Module Azure | Select Version
## List Azure Modules
PS C:\> Get-Module -ListAvailable -Name Az*

## count of cmdlets
PS C:\Users\pjayaram> (Get-Command -Module Az.compute -Type Cmdlet).count
