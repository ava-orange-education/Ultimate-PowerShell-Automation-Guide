# Read the SecureString from the file
$encryptedPassword = Get-Content -Path "C:\Path\To\SecureString.txt" | ConvertTo-SecureString

# Use the SecureString to create PSCredential
$User = "SaasCloud\pjayaram"
$Cred = New-Object System.Management.Automation.PSCredential($User, $encryptedPassword)

# Create a background job with the saved credentials
$job = Invoke-Command -ComputerName opssaas -ScriptBlock { Get-Process } -AsJob -Credential $Cred

# Wait for the job to complete and then receive the job output
Wait-Job $job
Receive-Job $job


