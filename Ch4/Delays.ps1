# Example: Repeatedly execute a command with a delay
for ($i = 1; $i -le 3; $i++) {
    Write-Host "Executing command $i..."
    Start-Sleep -Seconds 3
}

# Example: Checking a Folder for New Files Every 10 Seconds

function Check-ForNewFiles {
    $folderPath = "C:\Path\To\Your\Folder"

    while ($true) {
        $newFiles = Get-ChildItem -Path $folderPath -File | Where-Object { $_.CreationTime -gt (Get-Date).AddMinutes(-1) }

        if ($newFiles.Count -gt 0) {
            Write-Host "New files detected:"
            $newFiles | ForEach-Object { Write-Host "- $_" }
        } else {
            Write-Host "No new files detected."
        }

        Write-Host "Waiting for 10 seconds before checking again..."
        Start-Sleep -Seconds 10
    }
}

# Test the function
Check-ForNewFiles
