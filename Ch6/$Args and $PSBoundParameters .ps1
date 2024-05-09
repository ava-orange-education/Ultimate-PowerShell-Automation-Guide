function Display-Arguments {
    foreach ($arg in $Args) {
        Write-Output "Argument: $arg"
    }
}
Display-Arguments 1 "Hello" -Flag $true


#$PSBoundParameters

function Display-BoundParameters {
[CmdletBinding()]

    param (
        [string]$Name,
        [int]$Age,
        [switch]$IsStudent
    )

    Write-Output "Name: $Name"
    Write-Output "Age: $Age"

    # Check if the -IsStudent switch is present
    if ($PSBoundParameters.ContainsKey('IsStudent')) {
        Write-Output "Is Student: $($IsStudent.ToBool())"
    }
}

# Example usage
$parameters = @{
    Name = "John"
    Age = 25
    IsStudent = $true
}

Display-BoundParameters @parameters
Display-BoundParameters -Name "John" -Age 30 -Flag $true


function Process-Values {
[CmdletBinding()]

    param (
        [string]$Operation,
        [int]$Multiplier,
        [switch]$Verbose
    )

    # Display explicitly named parameters
    Write-Output "Operation: $Operation"
    Write-Output "Multiplier: $Multiplier"

    # Check if the -Verbose switch is present
    if ($PSBoundParameters.ContainsKey('Verbose')) {
        Write-Output "Verbose mode is enabled."
    }

    # Use $Args to perform the operation on provided values
    foreach ($value in $Args) {
        $result = switch ($Operation) {
            "Multiply" { $value * $Multiplier }
            "Add" { $value + $Multiplier }
            default { $value }
        }

        # Output results
        if ($Verbose) {
            Write-Output "Result of $Operation with $value and Multiplier $Multiplier is: $result"
        } else {
            Write-Output "Result: $result"
        }
    }
}

# Example usage with both positional and named parameters
Process-Values -Operation "Multiply" -Multiplier 2 -Verbose 3 5 7


function New-Profile
[CmdletBinding()]

{
  Write-Host "Running New-Profile function"
  $profileName = split-path $profile -leaf

  if (test-path $profile)
    {write-error "Profile $profileName already exists on this computer."}
  else
    {new-item -type file -path $profile -force }
}
