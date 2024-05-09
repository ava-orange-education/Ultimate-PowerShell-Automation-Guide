# Assign numbers to variables
$firstNumber = 10
$secondNumber = 25
# Perform a mathematical operation
$sum = $firstNumber + $secondNumber
# Display the result
Write-Output "The sum is: $sum"

# Assign a directory path to a variable
$folderPath = "C:\temp\PowerShell"
# List the contents of the directory using the variable
Get-ChildItem -Path $folderPath

#Dynamic Variables

$fruitName = "Apple"
$quantity = 5
# Create a dynamic variable name
$MyDynamicvariable = "${fruitName}Count"
# Assign the quantity value to the dynamic variable
Set-Variable $MyDynamicvariable -Value $quantity
# Retrieve the value of the dynamic variable and access its Value property
$fruitCount = Get-Variable $MyDynamicvariable | Select-Object -ExpandProperty Value
# Display the value of the fruit count
Write-Output "$fruitName count is $fruitCount"


