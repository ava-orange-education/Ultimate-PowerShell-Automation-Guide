# Define the path to the sshd_config file
$sshdConfigPath = "$env:ProgramData\ssh\sshd_config"

# Check if the file exists before attempting to edit it
if (Test-Path $sshdConfigPath) {
    # Open the sshd_config file in Notepad for editing
    notepad $sshdConfigPath
} else {
    Write-Host "The sshd_config file does not exist at $sshdConfigPath."
}


# Define the OpenSSH installation path
$opensshPath = "C:\Program Files\OpenSSH"

# Get the current PATH variable
$currentPath = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::Machine)

# Check if the OpenSSH path is already in the PATH variable
if ($currentPath -notlike "*$opensshPath*") {
    # Add the OpenSSH path to the PATH variable
    [System.Environment]::SetEnvironmentVariable('PATH', "$currentPath;$opensshPath", [System.EnvironmentVariableTarget]::Machine)
    
    Write-Host "OpenSSH path added to the PATH variable."
} else {
    Write-Host "OpenSSH path is already in the PATH variable."
}

