#Let's create a function that uses several common parameters, including Verbose, Debug, ErrorAction, ErrorVariable, OutVariable, and OutBuffer.
function Get-ModifiedFiles {
    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
        [string]$Path,

        [Parameter(Position=1)]
        [string]$Extension = "*"
    )

    process {
        try {
            # Enable Verbose and Debug modes
            Write-Verbose "Searching for files in $Path with extension $Extension"
            Write-Debug "Debug mode enabled: Performing detailed operations"

            # Get files with the specified extension
            $files = Get-ChildItem -Path $Path -Filter "*.$Extension" -File -ErrorAction Stop

            # Simulate a non-terminating error for demonstration
            if ($files.Count -eq 0) {
                throw "No files found with extension $Extension in $Path"
            }

            # Simulate output buffering
            $files | ForEach-Object {
                $_
                Start-Sleep -Seconds 1
            }

        } catch {
            # Handle errors and store in the error variable
            Write-Error "Error: $_"
            $script:MyErrors += $_
        }
    }
}

# Example Usage:
$script:MyErrors = @()  # Initialize the error variable
$modifiedFiles = Get-ModifiedFiles -Path "C:\Example" -Extension "txt" -Verbose -Debug -ErrorAction Stop -ErrorVariable MyErrors -OutVariable ModifiedFiles -OutBuffer 3

