try {
    # Code that might cause an error
    $result = Get-Item -Path "NonExistentPath"
    Write-Host "Success! Item found: $result"
}
catch {
    # Code to handle the error
    Write-Host "An error occurred: $($_.Exception.Message)"
}
finally {
    # Code that always runs, whether there was an error or not
    Write-Host "Finally block executed."
}

try {
    # Code that might cause an error
    $filePath = "C:\NonExistentFile.txt"
    $fileContent = Get-Content -Path $filePath
    Write-Host "File content: $fileContent"
}
catch [System.IO.FileNotFoundException] {
    # Code to handle the specific error of file not found
    Write-Host "File not found: $($_.Exception.Message)"
}
catch {
    # Code to handle any other type of error
    Write-Host "An error occurred: $($_.Exception.Message)"
}
finally {
    # Code that always runs, whether there was an error or not
    Write-Host "Finally block executed."
}

try {
    # Code that may throw an exception
    $result = 10 / 0
}
catch {
    # Handle the exception
    Write-Host "An error occurred: $($_.Exception.Message)"
}
finally {
    # Code to run regardless of whether an exception occurred or not
    Write-Host "Finally block executed."
}
trap {
    # Handle the exception
    Write-Host "An error occurred: $($_.Exception.Message)"
}
try {
    # Code that may throw an exception
    $result = 10 / 0
}
finally {
    # Code to run regardless of whether an exception occurred or not
    Write-Host "Finally block executed."
}

