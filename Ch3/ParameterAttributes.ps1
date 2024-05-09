#Define a Mandatory Parameter
Param(
[Parameter(Mandatory=$true)] ] [String] $UId
)

#Define the parameter in a function
function Say-Hello {
    param (
        [string]$Name
    )
    Write-Output "Hello, $Name!"
}
# Usage
Say-Hello -Name "John"

#Assign a default value to the parameter.
function Get-Square {
    param (
        [int]$Number = 5
    )
    $Square = $Number * $Number
    Write-Host "The square of $Number is $Square."
}
# Usage
Get-Square -Number 3


#Assign multiple parameters in a function

function Get-Sum {
    param (
        [int]$Number1,
        [int]$Number2
    )
    $Sum = $Number1 + $Number2
    Write-Output "The sum is $Sum."
}
# Usage
Get-Sum -Number1 5 -Number2 7



#Assign a default value to the parameter.
function Example-Function {
    param (
        [string]$Name = "Guest"
    )

    Write-Host "Hello, $Name!"
}

# Calling the function without specifying the $Name parameter
Example-Function

#Accept pipeline input
function Get-Total {
    param (
        [Parameter(ValueFromPipeline=$true)]
        [int]$Value
    )
    process {
        $Total += $Value
    }
    end {
        Write-Output "Total: $Total"
    }
}
# Usage
1, 2, 3 | Get-Total

#Wildcard matching

function Get-Files {
    param (
        [string]$Pattern
    )
    Get-ChildItem -Path "C:\Temp" -Filter $Pattern
}
# Usage
Get-Files -Pattern "*.txt"


#Validate inputs from pre-defined values
function Get-ColorInfo {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("Red", "Green", "Blue")]
        [string]$Color
    )

    switch ($Color) {
        "Red"   { Write-Host "You selected the color Red." }
        "Green" { Write-Host "You selected the color Green." }
        "Blue"  { Write-Host "You selected the color Blue." }
    }
}
# Usage
Get-ColorInfo -Color "Green"


#Using Switch parameter

function Start-ProcessWithLogging {
    param (
        [string]$ProcessName,
        [switch]$EnableLogging
    )

    if ($EnableLogging) {
        Write-Host "Logging is enabled. Starting process: $ProcessName with logging..."
        # Code to start the process with logging
    } else {
        Write-Host "Logging is not enabled. Starting process: $ProcessName..."
        # Code to start the process without logging
    }
}
# Usage with logging enabled
Start-ProcessWithLogging -ProcessName "MyApp" -EnableLogging
# Usage without logging
Start-ProcessWithLogging -ProcessName "MyApp"



