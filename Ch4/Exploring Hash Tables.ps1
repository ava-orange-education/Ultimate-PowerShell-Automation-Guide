# Create a hash table to store employee information
$employeeInfo = @{
    "E101" = @{
        "Name" = "John Doe"
        "Department" = "IT"
    }
    "E202" = @{
        "Name" = "Alice Smith"
        "Department" = "HR"
    }
    "E303" = @{
        "Name" = "Bob Johnson"
        "Department" = "Finance"
    }
}

$employeeName = $employeeInfo["E101"]["Name"]
$employeeDepartment = $employeeInfo["E101"]["Department"]

# Add a new key-value pair
$hashTable["Key4"] = "Value4"

# Modify an existing value
$hashTable["Key1"] = "NewValue1"

#In the existing hash table example, let's add details of a new employee.
$employeeInfo["E404"] = @{
    "Name" = "Eva Rodriguez"
    "Department" = "Marketing"
}
# Create a hash table to store employee information
$employeeInfo = @{
    "E101" = @{
        "Name" = "John Doe"
        "Department" = "IT"
    }
    "E202" = @{
        "Name" = "Alice Smith"
        "Department" = "HR"
    }
    "E303" = @{
        "Name" = "Bob Johnson"
        "Department" = "Finance"
    }
}
# Remove an employee entry
$removedEmployeeID = "E101"
if ($employeeInfo.ContainsKey($removedEmployeeID)) {
    $removedEmployee = $employeeInfo.Remove($removedEmployeeID)
    Write-Output "Removed employee with ID: $removedEmployeeID"
} else {
    Write-Output "Employee with ID $removedEmployeeID not found."
}
# Modify the department of employee E101 to "Operations"
$employeeInfo["E101"]["Department"] = "Operations"

# Create a hash table to store employee information
# Display the initial employee information for E101
Write-Output "Initial Employee Information for E101:"
$initialDepartmentE101 = $employeeInfo["E101"]["Department"]
Write-Output "E101: $($employeeInfo['E101']['Name']), $($initialDepartmentE101)"

# Modify the department of employee E101 to "Operations"
$employeeInfo["E101"]["Department"] = "Operations"

# Display the updated employee information for E101
Write-Output "Updated Employee Information for E101:"
$updatedDepartmentE101 = $employeeInfo["E101"]["Department"]
Write-Output "E101: $($employeeInfo['E101']['Name']), $($updatedDepartmentE101)"

# Iterate through the hash table
foreach ($key in $hashTable.Keys) {
    $value = $hashTable[$key]
    Write-Output "$key: $value"
} 

# Create a hash table to store employee information
$employeeInfo = @{
    "E101" = @{
        "Name" = "John Doe"
        "Department" = "IT"
    }
    "E202" = @{
        "Name" = "Alice Smith"
        "Department" = "HR"
    }
    "E303" = @{
        "Name" = "Bob Johnson"
        "Department" = "Finance"
    }
}

# Display employee information using a foreach loop
foreach ($employeeId in $employeeInfo.Keys) {
    $employee = $employeeInfo[$employeeId]
    Write-Host "Employee ID: $employeeId"
    Write-Host "Name: $($employee.Name)"
    Write-Host "Department: $($employee.Department)"
    Write-Host "---------------------------"
}


# Create an ordered hashtable using the ordered keyword
$employeeInfo = [ordered]@{
    "E101" = @{
        "Name" = "John Doe"
        "Department" = "IT"
    }
    "E202" = @{
        "Name" = "Alice Smith"
        "Department" = "HR"
    }
    "E303" = @{
        "Name" = "Bob Johnson"
        "Department" = "Finance"
    }
}

# Iterate through the ordered hashtable and display key-value pairs
foreach ($entry in $employeeInfo.GetEnumerator()) {
    Write-Output "$($entry.Key): $($entry.Value.Name), $($entry.Value.Department)"
}

#Splatting Hashtables

# Create a hash table with parameters for Send-MailMessage
$mailParams = @{
    SmtpServer  = "smtp.contoso.com"
    To          = " rajendragupta@contoso.com"
    From        = "info@contoso.com"
    Subject     = ' Test message for splatting hashtables'
    Body        = 'Test email from PowerShell'
    Priority    = 'High'
}

# Use splatting to send the email
Send-MailMessage @mailParams


#Creating Objects from Hashtables

# Create a hashtable with server specifications
$serverSpecs = @{
    Name        = "Server001"
    IP          = "192.168.1.100"
    OS          = "Windows Server 2019"
    MemoryGB    = 16
    CPU         = "Quad-Core"
}

# Convert the hashtable to a custom PowerShell object using [PSCustomObject]
$serverObject = [PSCustomObject]$serverSpecs

# Display the custom object
$serverObject

function servers {
    [pscustomobject]@{
      Name        = "Server001"
      IP          = "192.168.1.100"
      OS          = "Windows Server 2019"
      MemoryGB    = 16
      CPU         = "Quad-Core"
    }
    [pscustomobject]@{
      Name        = "Server002"
      IP          = "192.168.1.102"
      OS          = "Windows Server 2019"
      MemoryGB    = 32
      CPU         = "Quad-Core"
    }
}

#Exporting Hashtable to CSV
# Create a hashtable with data
$employeeData = @{
    Name       = "John Doe"
    Department = "IT"
    EmployeeID = "E101"
}

# Get the enumerator for the hashtable
$enumerator = $employeeData.GetEnumerator()

# Specify the CSV file path
$csvFilePath = "C:\temp\File.csv"

# Export the key-value pairs to CSV
$enumerator | Select-Object Name, Value | Export-Csv -Path $csvFilePath -NoTypeInformation

Write-Output "Hashtable exported to CSV: $csvFilePath"

#The following code Iterate through the hashtable to convert each entry to a custom object and Export the array of custom objects to CSV
# Create a hashtable with employee data
$employeeData = @{
    'E101' = @{
        Name       = "John Doe"
        Department = "IT"
    }
    'E202' = @{
        Name       = "Alice Smith"
        Department = "HR"
    }
    'E303' = @{
        Name       = "Bob Johnson"
        Department = "Finance"
    }
}

# Specify the CSV file path
$csvFilePath = "C:\Path\To\Your\File.csv"

# Create an array to store custom objects
$employeeObjects = @()

# Iterate through the hashtable to convert each entry to a custom object
foreach ($entry in $employeeData.GetEnumerator()) {
    $employeeObject = [PSCustomObject]@{
        EmployeeID = $entry.Key
        Name       = $entry.Value.Name
        Department = $entry.Value.Department
    }
    $employeeObjects += $employeeObject
}

# Export the array of custom objects to CSV
$employeeObjects | Export-Csv -Path $csvFilePath -NoTypeInformation

Write-Output "Employee data exported to CSV: $csvFilePath"
