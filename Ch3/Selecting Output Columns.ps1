Get-Service -Name wuauserv | Select-Object -Property DisplayName, Status, @{Name='StartType'; Expression={$_.StartType -as [string]}}

# Get process information and add a calculated column
Get-Process | Select-Object -Property ProcessName, CPU, @{Name='Memory (MB)'; Expression={$_.WorkingSet/1MB}}, @{Name='CPU Percentage'; Expression={($_.CPU * 100) / (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty NumberOfLogicalProcessors)}}

#Exclude property
Get-Service -Name wuauserv  | Select-Object -Property DisplayName, Status -ExcludeProperty StartType

#Expanding Nested Properties
# Example with Get-Process to illustrate nested properties
Get-Process | Select-Object -Property Name, CPU, @{Name='Owner'; Expression={$_.GetOwner().User}} -ExpandProperty Modules

#custom object with nested properties

$myObject = [PSCustomObject]@{
    Name = "David"
    Department = "IT"
    Manager = @{
        Name = "Jane Doe"
        Email = "jane.doe@example.com"
    }
}
# Select "Name", "Department", and all properties within "Manager"
$expandedProperties = $myObject | Select-Object Name, Department, Manager* -ExpandProperty Manager

# Access expanded properties directly
Write-Host "Manager Name:", $expandedProperties.Manager.Name
Write-Host "Manager Email:", $expandedProperties.Manager.Email

# Output:
# Manager Name: Jane Doe
# Manager Email: jane.doe@example.com

