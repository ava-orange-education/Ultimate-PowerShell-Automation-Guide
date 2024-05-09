# Specify the path to your PowerShell scripts
$scriptDirectory = "C:\Path\To\Your\Scripts"

# Generate or obtain a code-signing certificate (replace $certificate with your actual certificate variable)
$certificate = New-SelfSignedCertificate -Subject "PowerShell Script Signing" -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert

# Set the Authenticode signature for all PowerShell scripts in the specified directory and its subdirectories
Get-ChildItem -Path $scriptDirectory -Recurse -Include *.ps1 | ForEach-Object {
    Set-AuthenticodeSignature -FilePath $_.FullName -Certificate $certificate 
}

# To request a credential from the user securely, use the Get-Credential cmdlet 
$credential = Get-Credential 

# Once you have the username and password, you can pass that information securely to other commands 
# that accept a PowerShell credential object 
# For example, if a command supports a SecureString for its sensitive information: # 
$result = Some-Command -Credential $credential 

#Using Get-Credential Prompt
# Define the target computer and credentials
$remoteComputer = "Remotecomputer"
$credentials = Get-Credential -UserName "pjayaram" -Message "Enter your password"

# Define the script block or command to be executed on the remote computer
$scriptBlock = {
    # Your commands go here
    Get-Process
}

# Use Invoke-Command to run the script block on the remote computer with specified credentials
Invoke-Command -ComputerName $remoteComputer -Credential $credentials -ScriptBlock $scriptBlock

#Using ConvertFrom-SecureString:

# Define the target computer and credentials
$remoteComputer = "RemoteComputer"
$credentials = Get-Credential -UserName "pjayaram" -Message "Enter your password"

# Store the password securely in a file
$credentials.Password | ConvertFrom-SecureString | Set-Content c:\temp\password.txt

# Retrieve the password from the file
$password = Get-Content c:\temp\password.txt | ConvertTo-SecureString

# Create a PsCredential object with the stored credentials
$cred = New-Object System.Management.Automation.PsCredential "pjayaram", $password

# Define the script block or command to be executed on the remote computer
$scriptBlock = {
    # Your commands go here
    Get-Process
}

# Use Invoke-Command to run the script block on the remote computer with specified credentials
Invoke-Command -ComputerName $remoteComputer -Credential $cred -ScriptBlock $scriptBlock

