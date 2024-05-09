# Using .NET's DateTime class 
$currentDateTime = [System.DateTime]::Now 
Write-Host "Current Date and Time: $currentDateTime" 
# Formatting DateTime 
$formattedDateTime = [System.DateTime]::Now.ToString("yyyy-MM-dd HH:mm:ss") 
Write-Host "Formatted Date and Time: $formattedDateTime" 
