# Path to the CSV file
$csvFilePath = "C:\Ultimate PowerShell Automation\example.csv"
# Import the CSV file into a variable
$data = Import-Csv -Path $csvFilePath
# Display the imported data
$data

# Accessing specific elements
Write-Host "First person: $($data[0].Name), Age $($data[0].Age), City $($data[0].City)"

# Filtering data based on a condition (e.g., age greater than 28)
$filteredData = $data | Where-Object { $_.Age -gt 28 }
# Converting the output data to JSON
$filteredData |ConvertTo-Json


