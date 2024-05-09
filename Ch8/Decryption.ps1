# Display the encrypted password (for demonstration purposes)
Write-Host "Encrypted Password: $encryptedPassword"

# Convert the encrypted string back to a secure string
$decryptedSecurePassword = ConvertTo-SecureString -String $encryptedPassword

# Use Marshal class for decryption
$marshal = [System.Runtime.InteropServices.Marshal]

# Convert secure string to binary string (BSTR)
$binaryString = $marshal::SecureStringToBSTR($decryptedSecurePassword)

# Convert BSTR to plain text string (password)
$decryptedPassword = $marshal::PtrToStringAuto($binaryString)

# Display the decrypted password
Write-Host "Decrypted Password: $decryptedPassword"

# Clear unmanaged memory
$marshal::ZeroFreeBSTR($binaryString)
