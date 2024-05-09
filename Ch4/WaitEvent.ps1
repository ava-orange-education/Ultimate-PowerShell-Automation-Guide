# Example: Wait for User Keypress

function Wait-ForKeypress {
    Write-Host "Press any key to continue..."

    # Wait for a key press using [System.Console]::KeyAvailable
    while (-not [System.Console]::KeyAvailable) {
        Start-Sleep -Milliseconds 100  # Introduce a short delay
    }

    # Consume the key event
    [System.Console]::ReadKey() | Out-Null
}

# Test the function
Wait-ForKeypress
Write-Host "You pressed a key. Continuing with the script..."
