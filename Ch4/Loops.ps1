# Example: For Loop
for ($i = 1; $i -le 5; $i++) {
    Write-Host "Iteration $i"
}

Let's consider another example to simulate a countdown timer using a for loop with a delay:
# Example: Simulate a Countdown Timer

function Start-Countdown {
    $durationInSeconds = 10

    for ($i = $durationInSeconds; $i -gt 0; $i--) {
        Write-Host "Time left: $i seconds"
        Start-Sleep -Seconds 1
    }

    Write-Host "Countdown completed!"
}

# Test the function
Start-Countdown
Write-Host "Task after countdown."


# Example: Foreach Loop
$fruits = @("Apple", "Banana", "Orange")
foreach ($fruit in $fruits) {
    Write-Host "Current fruit: $fruit"
}

#Code Output:
Current fruit: Apple
Current fruit: Banana
Current fruit: Orange

# Example: Perform Action for Each Employee

# List of employee names
$employees = @("Alice", "Bob", "Charlie", "David")

# Use foreach loop to iterate over each employee
foreach ($employee in $employees) {
    Write-Host "Processing employee: $employee"
    # Add your custom action here for each employee
}

Write-Host "Processing completed for all employees."


# Example: While Loop
$counter = 1
while ($counter -le 3) {
    Write-Host "Iteration $counter"
    $counter++
}

# Example: Number Guessing Game with While Loop

# Generate a random number between 1 and 10
$correctNumber = Get-Random -Minimum 1 -Maximum 11

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Try to guess the correct number between 1 and 10."

# Initialize variables
$guessedNumber = 0

# Use a while loop until the correct number is guessed
while ($guessedNumber -ne $correctNumber) {
    # Prompt user for input
    $guessedNumber = Read-Host "Enter your guess"

    # Try to convert the input to an integer
    if ($guessedNumber -as [int]) {
        $guessedNumber = $guessedNumber -as [int]

        # Validate the range
        if ($guessedNumber -ge 1 -and $guessedNumber -le 10) {
            # Compare user's guess with the correct number
            if ($guessedNumber -eq $correctNumber) {
                Write-Host "Congratulations! You guessed the correct number: $correctNumber"
            } else {
                Write-Host "Try again. Incorrect guess."
            }
        } else {
            Write-Host "Invalid input. Please enter a number between 1 and 10."
        }
    } else {
        Write-Host "Invalid input. Please enter a valid number."
    }
}

Write-Host "Game Over."

# Example: Do-While Loop
$counter = 1
do {
    Write-Host "Iteration $counter"
    $counter++
} while ($counter -le 3)


#: Using ForEach-Object to iterate over a collection
1..5 | ForEach-Object {
    Write-Host "Current number: $_"
}
### Output:
Current number: 1
Current number: 2
Current number: 3
Current number: 4
Current number: 5

# Example: Using ForEach-Object to Check File Information

# List of file names
$fileNames = @("C:\Path\To\file1.txt", "C:\Path\To\file2.txt", "C:\Path\To\file3.txt")

# Use ForEach-Object to iterate over each file name
$fileNames | ForEach-Object {
    $fileName = $_
    
    # Check if the file exists
    if (Test-Path $fileName -PathType Leaf) {
        # Display information about the file
        $fileInfo = Get-Item $fileName
        Write-Host "File: $fileInfo.FullName"
        Write-Host "Size: $($fileInfo.Length) bytes"
        Write-Host "Last Modified: $($fileInfo.LastWriteTime)"
        Write-Host "-----"
    } else {
        Write-Host "File not found: $fileName"
    }
}

#Let’s use a PowerShell ForEach Loop to read through a CSV File Rows:

# Import CSV file
$CSVData = Import-Csv -Path "C:\Temp\PowerShell\MyData.csv"
 
# Loop through each row in the CSV
ForEach ($user in $CSVData) {
    Write-Output ("Name: $($user.Name), Age: $($user.Age), Occupation: $($user.Occupation)")
}
#The ForEach-Object PowerShell code to read CSV files uses the pipeline input, as shown below. 
# Import CSV file
$csvData = Import-Csv -Path "C:\Temp\PowerShell\MyData.csv"
 
# Loop through each row in the CSV
$CSVData | ForEach-Object {
    Write-Output ("Name: $($_.Name), Age: $($_.Age), Occupation: $($_.Occupation)")
}

#Break loop
$numbers = 3, 7, 1, 4, 9, 5, 6

foreach ($number in $numbers) {
    Write-Output "Checking number: $number"

    if ($number % 2 -eq 0) {
        Write-Output "Found the first even number: $number"
        break
    }
}


$targetProcessName = "explorer"

Get-Process | ForEach-Object {
    Write-Output "Process Name: $($_.ProcessName), ID: $($_.Id)"

    if ($_.ProcessName -eq $targetProcessName) {
        Write-Output "Found the target process: $targetProcessName"
        break
    }
}

#Skipping an Element with Continue keyword in PowerShell ForEach and ForEach-Object method

$numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9

foreach ($number in $numbers) {
    if ($number % 2 -eq 0) {
        # Skip even numbers
        continue
    }

    Write-Output "Odd Number: $number"
}

$fileNames = "apple.txt", "banana.doc", "cherry.jpg", "orange.txt", "grape.doc"

$fileNames | ForEach-Object {
    # Skip file names that start with the letter "a"
    if ($_ -like "a*") {
        continue
    }

    Write-Output "File Name: $_, Length: $($_.Length)"
}
