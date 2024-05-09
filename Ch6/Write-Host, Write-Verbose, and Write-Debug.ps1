#
Let's create a simple script with a function that utilizes Write-Host, Write-Verbose, and Write-Debug for different types of messaging:
function Process-Data {
[CmdletBinding()]

    param (
        [string]$InputData
    )

    # Regular message using Write-Host
    Write-Host "Processing data: $InputData"

    # Verbose message using Write-Verbose
    Write-Verbose "Executing detailed processing steps for data: $InputData"

    # Debugging information using Write-Debug
    Write-Debug "Debugging info: Input data length is $($InputData.Length)"

    # Simulating some processing
    $ProcessedData = $InputData.ToUpper()

    # Output the processed data
    $ProcessedData
}

# Set preferences for verbose and debug
$VerbosePreference = 'Continue'
$DebugPreference = 'Continue'

# Call the function with different input data
$result = Process-Data -InputData "example"

# Display the result
Write-Host "Processed result: $result"


