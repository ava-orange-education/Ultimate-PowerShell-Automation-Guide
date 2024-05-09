# Sample data representing tasks
$tasks = @(
    @{ TaskName = "TaskA"; Status = "InProgress" },
    @{ TaskName = "TaskB"; Status = "Completed" },
    @{ TaskName = "TaskC"; Status = "InProgress" },
    @{ TaskName = "TaskD"; Status = "Pending" },
    @{ TaskName = "TaskE"; Status = "Completed" }
)

# Grouping tasks by Status
$groupedTasks = $tasks | Group-Object -Property Status

# Displaying grouped tasks
foreach ($group in $groupedTasks) {
    Write-Host "Tasks with Status $($group.Name):"
    foreach ($task in $group.Group) {
        Write-Host "  - $($task.TaskName)"
    }
}

#Sorting

# Sample data representing books
$books = @(
    @{ Title = "BookA"; Year = 2010 },
    @{ Title = "BookB"; Year = 2005 },
    @{ Title = "BookC"; Year = 2015 },
    @{ Title = "BookD"; Year = 2000 },
    @{ Title = "BookE"; Year = 2020 }
)

# Sorting books by Year in ascending order
$sortedBooks = $books | Sort-Object -Property Year

# Displaying sorted books
Write-Host "Sorted Books by Year (Ascending):"
$sortedBooks | ForEach-Object {
    Write-Host ("Title: {0,-10} Year: {1,-4}" -f $_.Title, $_.Year)
}

#Grouping and Sorting together in a script

# Sample data representing employees
$employees = @(
    @{ EmployeeName = "Alice"; Department = "HR"; Salary = 90000 },
    @{ EmployeeName = "Bob"; Department = "IT"; Salary = 85000 },
    @{ EmployeeName = "Charlie"; Department = "HR"; Salary = 55000 },
    @{ EmployeeName = "David"; Department = "IT"; Salary = 80000 },
    @{ EmployeeName = "Eva"; Department = "Finance"; Salary = 70000 }
)

# Grouping employees by Department
$groupedEmployees = $employees | Group-Object -Property Department

# Sorting employees within each department by Salary in descending order
$sortedEmployees = $groupedEmployees | ForEach-Object {
    $_ | Sort-Object -Property { $_.Salary } -Descending
}

# Displaying grouped and sorted employees
foreach ($group in $sortedEmployees) {
    Write-Host "Department: $($group.Name)"
    foreach ($employee in $group.Group) {
        Write-Host "  - $($employee.EmployeeName), Salary: $($employee.Salary)"
    }
    Write-Host ""
}

#Adding a new property using Add-Member
# Creating a custom object
$customObject = [PSCustomObject]@{
    Name = "Prashanth Jayaram"
    Age = 40
}

# Adding a new property using Add-Member
$customObject | Add-Member -MemberType NoteProperty -Name "Occupation" -Value "Software Engineer"

# Displaying the updated object
$customObject |Get-Member


