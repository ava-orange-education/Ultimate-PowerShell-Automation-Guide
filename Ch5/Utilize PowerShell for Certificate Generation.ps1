$certificate = New-SelfSignedCertificate -Subject "Powershell ulitmateGuide Authenticate" -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert 
 
# Add to the root certificate store 
$rootStore = [System.Security.Cryptography.X509Certificates.X509Store]::new("Root","CurrentUser")
$rootStore.Open("ReadWrite") 
$rootStore.Add($certificate) 
$rootStore.Close() 
# Add to the trusted publishers certificate store 
$publisherStore = [System.Security.Cryptography.X509Certificates.X509Store]::new("TrustedPublisher","CurrentUser") 
$publisherStore.Open("ReadWrite") 
$publisherStore.Add($certificate) 
$publisherStore.Close()  

# Check if the certificate is in the personal certificate store 
Get-ChildItem Cert:\CurrentUser\My | Where-Object {$_.Subject -eq "CN=Powershell ulitmateGuide Authenticate"} 
# Verify whether the certificate is present in the root certificate store
Get-ChildItem Cert:\CurrentUser\Root | Where-Object {$_.Subject -eq "CN=Powershell ulitmateGuide Authenticate"} 
# Check if the certificate is in the trusted publishers certificate store 
Get-ChildItem Cert:\CurrentUser\TrustedPublisher | Where-Object {$_.Subject -eq "CN=Powershell ulitmateGuide Authenticate"}  

# Get the code-signing certificate from the local computer's certificate store with the name *Powershell Script Authenticate* and store it to the $codeSigningCertificate variable.
$codeSigningCertificate = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=Powershell ulitmateGuide Authenticate"}

# Sign the PowerShell script
Set-AuthenticodeSignature -FilePath C:\temp\hello.ps1 -Certificate $codeSigningCertificate 
