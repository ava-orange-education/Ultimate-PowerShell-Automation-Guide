# PowerShell script to copy files from one location to another

# Source and destination paths
$sourcePath = "C:\Path\To\Source"
$destinationPath = "C:\Path\To\Backup"

# Copy files
Copy-Item -Path $sourcePath\* -Destination $destinationPath -Recurse -Force
