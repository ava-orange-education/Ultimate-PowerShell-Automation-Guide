function SayHi{
    param (
        [string]$name
    )
    Write-Host "Hello, $name!"
}

# Call the function
SayHi -name "Prashanth Jayaram"
