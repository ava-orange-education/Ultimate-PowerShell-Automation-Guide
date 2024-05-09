# Global variable
$globalVariable = "I am global"

function Test-Scope {
    # Local variable
    $localVariable = "I am local"

    # Access local and global variables
    Write-Output "Local Variable: $localVariable"
    Write-Output "Global Variable: $globalVariable"
}

# Call the function
Test-Scope

# Attempt to access the local variable outside the function: 
Write-Output "Trying to access local variable outside the function: $localVariable"
