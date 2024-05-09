# Original password
$plainPassword = "Prashanth@123"

# Convert the password to a secure string
$securePassword = ConvertTo-SecureString -String $plainPassword -AsPlainText -Force

# Convert the secure string to an encrypted string
$encryptedPassword = ConvertFrom-SecureString $securePassword

# Display the encrypted password
Write-Host "Encrypted Password: $encryptedPassword"

