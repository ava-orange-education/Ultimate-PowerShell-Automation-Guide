# Using .NET's System.IO for file operations
$fileContent = [System.IO.File]::ReadAllText("C:\Path\To\File.txt")
Write-Host "File Content: $fileContent"

$fileLines = [System.IO.File]::ReadAllLines("C:\Path\To\File.txt")
Write-Host "Number of Lines in File: $($fileLines.Count)"
