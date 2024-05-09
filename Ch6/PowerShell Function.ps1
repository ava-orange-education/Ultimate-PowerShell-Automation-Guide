#a basic structure of a PowerShell function:
function MyFunction {
[CmdletBinding()]
    param (
        [parameter type] $Parameter1,
        [parameter type] $Parameter2
    )
    # Function logic here
    return $result


#Basic Parameter Syntax:

[CmdletBinding()]
    param (
        [string]$Text = "Hello",
        [int]$Repeat = 1
    )

    1..$Repeat | ForEach-Object {
        Write-Output $Text
    }
}

#A basic PowerShell function that adds two numbers:
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

# Usage example:
Add-Numbers -Number1 5 -Number2 10

#Function to calculate the area of a rectangle

function Get-RectangleArea {
[CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true)]
        [double]$Length,

        [Parameter(Position=1, Mandatory=$true)]
        [double]$Width
    )

    $area = $Length * $Width
    Write-Output "The area of the rectangle with length $Length and width $Width is: $area square units"
}

# Usage example:
Get-RectangleArea -Length 5.5 -Width 3.2


#Parameter Validation
function Get-Square {
[CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true)]
        [ValidateRange(1, 100)]
        [int]$SideLength
    )

    $area = $SideLength * $SideLength
    Write-Output "The area of the square with side length $SideLength is: $area square units"
}


#The following function, Get-CubeVolume, accepts input from the pipeline and calculates the volume for each side length.
function Get-CubeVolume {
    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [int]$SideLength
    )

    process {
        $volume = $SideLength * $SideLength * $SideLength
        Write-Output "The volume of the cube with side length $SideLength is: $volume cubic units"
    }
}

#Using Script Blocks

function Execute-ScriptBlock {
[CmdletBinding()]

    param (
        [scriptblock]$CodeBlock
    )

    Write-Host "Executing the provided script block..."
    & $CodeBlock
    Write-Host "Script block execution complete."
}

# Using a simple script block
$SimpleBlock = { Write-Host "Hello from the script block!" }
Execute-ScriptBlock -CodeBlock $SimpleBlock


# Using a script block with parameters
$ParamsBlock = {
    param ($Name)
    Write-Host "Hello, $Name!"
}
Execute-ScriptBlock -CodeBlock $ParamsBlock -Name "John"




