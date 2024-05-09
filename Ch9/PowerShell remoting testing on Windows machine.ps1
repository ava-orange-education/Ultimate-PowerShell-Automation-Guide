# Get the current computer name
$computerName = $env:COMPUTERNAME

# Create a PSSession (PowerShell remote session) to the local computer
$remoteSession = New-PSSession -hostname $computerName -username administrator

# Enter the remote session
Enter-PSSession -Session $remoteSession

# Now you are in a remote PowerShell session on the same computer
# You can run commands as if you are on a remote computer
Get-Service ssh*

# Exit the remote session
Exit-PSSession

# Remove the PSSession (optional)
Remove-PSSession -Session $remoteSession
