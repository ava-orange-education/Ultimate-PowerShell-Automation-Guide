#Comment-Based Help Structure

<#
.SYNOPSIS
Brief description of the script or function.

.DESCRIPTION
Detailed explanation of the functionality.

.PARAMETER ParameterName
Description of each parameter with details like type, purpose, and constraints.

.EXAMPLE
Examples demonstrating how to use the script or function.

.NOTES
Additional notes, such as author, version, or updates.
#>

#Let’s look at an example of using a command-based help structure in a function or script.

<#
.SYNOPSIS
This function adds two numbers.

.DESCRIPTION
The Add-Numbers function takes two numbers as input and returns their sum.

.PARAMETER Number1
The first number to be added. (Type: int, Mandatory: $true)

.PARAMETER Number2
The second number to be added. (Type: int, Mandatory: $true)

.EXAMPLE
Add-Numbers -Number1 5 -Number2 10
Calculates the sum of 5 and 10.

.NOTES
Author: Your Name
Version: 1.0
#>
function Add-Numbers {
[CmdletBinding()]

    param (
        [Parameter(Position=0, Mandatory=$true)]
        [int]$Number1,

        [Parameter(Position=1, Mandatory=$true)]
        [int]$Number2
    )

    $result = $Number1 + $Number2
    Write-Output "The sum of $Number1 and $Number2 is: $result"
}
Usage:
Get-Help Add-Numbers

#Function comment-based help

<#
.SYNOPSIS
    This function demonstrates the usage of comment-based help in PowerShell functions.

.DESCRIPTION
    The Get-Info function retrieves information based on the provided parameters.

.PARAMETER Name
    Specifies the name for which information is to be retrieved.

.PARAMETER Age
    Specifies the age for filtering information.

.EXAMPLE
    Get-Info -Name "John"
    Retrieves information for the person with the name "John".

.EXAMPLE
    Get-Info -Age 25
    Retrieves information for all persons with the age of 25.

.NOTES
    File Name      : Get-Info.ps1
    Author         : Your Name
    Version History:
        1.0 - Initial release
#>

function Get-Info {
    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string]$Name,

        [Parameter(Position=1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [int]$Age
    )

    process {
        # Actual logic to retrieve information would go here
        $result = "Information for $Name"
        if ($Age) {
            $result += " with age $Age"
        }
        Write-Output $result
    }
}

# Usage example:
# Get-Info -Name "John"
# Get-Info -Age 25







