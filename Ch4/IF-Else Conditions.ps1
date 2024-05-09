#Checking if a Number is Positive, Negative, or Zero

$number = Read-Host "Enter a number"
$number = [int]$number

if ($number -gt 0) {
    Write-Host "The number is positive."
} elseif ($number -lt 0) {
    Write-Host "The number is negative."
} else {
    Write-Host "The number is zero."
}

#Checking if a File Exists
$filePath = "C:\Path\to\Your\File.txt"
if (Test-Path $filePath) {
    Write-Host "The file exists at $filePath."
} else {
    Write-Host "The file does not exist at $filePath."
}

#Using if-else in a PowerShell function to check for palindromes

function Test-Palindrome($inputString) {
    # Remove spaces and convert to lowercase for case-insensitive comparison
    $cleanedString = $inputString -replace '\s', '' -replace '\W', ''
    $cleanedString = $cleanedString.ToLower()

    # Reverse the string
    $reversedString = $cleanedString.ToCharArray() -join ''

    if ($cleanedString -eq $reversedString) {
        Write-Host "$inputString is a palindrome."
    } else {
        Write-Host "$inputString is not a palindrome."
    }
}

