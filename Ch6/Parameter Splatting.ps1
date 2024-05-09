#Hashtable Creation

$params = @{
    Parameter1 = "Value1"
    Parameter2 = "Value2"
}

#Splatting

$Params = @{
    "Path"        = "C:\Temp\TestFile.txt"
    "Destination" = "C:\Temp\SQL\CopiedFile.txt"
 }
  
  Copy-Item @Params

# Function that uses parameters
function Get-User {
[CmdletBinding()]

    param (
        [string]$FirstName,
        [string]$LastName,
        [int]$Age
    )

    Write-Output "User Information:"
    Write-Output "First Name: $FirstName"
    Write-Output "Last Name: $LastName"
    Write-Output "Age: $Age"
}

# Using parameter splatting
$userParams = @{
    FirstName = "John"
    LastName = "Doe"
    Age = 30
}
Get-User @userParams


