# Specify the range for the numbers
$lowerLimit = 1
$upperLimit = 10

# Initialize an empty array to store the generated numbers
$numbers = @()

# Use a for loop to generate numbers and add them to the array
for ($i = $lowerLimit; $i -le $upperLimit; $i++) {
    $numbers += $i
}

# Display the generated numbers
Write-Host "Generated Numbers: $numbers"
Set-PSBreakpoint "SampleNumbers.Ps1" -Line 9

# Define a variable
$myVariable = 42

# Set a variable breakpoint on the variable $myVariable
Set-PSBreakpoint -Variable myVariable -Mode ReadWrite -Action {
    Write-Host "Variable breakpoint triggered for myVariable. Value: $($myVariable)"
}

# Perform some operations that involve the variable
$myVariable = $myVariable * 2
$myVariable++

# Remove the variable breakpoint when done debugging
Remove-PSBreakpoint -Id 1  # Replace 1 with the actual breakpoint ID displayed when the breakpoint was set


#Wait-Debugger
# Some code before the debugger pause
Write-Host "Executing code before Wait-Debugger"

# Script to Pause and wait for a debugger to attach
Wait-Debugger

# Code after the debugger has attached
Write-Host "Executing code after Wait-Debugger"

