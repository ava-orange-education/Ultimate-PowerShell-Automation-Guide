# Define a simple Person class
class Person {
    [string]$Name
    [int]$Age

    Person([string]$name, [int]$age) {
        $this.Name = $name
        $this.Age = $age
    }

    [string] GetInfo() {
        return "Name: $($this.Name), Age: $($this.Age)"
    }
}

# Create an instance of the Person class
$person = [Person]::new("Prashanth", 40)

# Access properties
Write-Host $person.GetInfo()
