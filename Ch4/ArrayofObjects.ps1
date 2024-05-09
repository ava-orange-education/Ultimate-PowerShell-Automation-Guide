$object1 = [PSCustomObject]@{
    Name = "John"
    Age  = 30
}

$object2 = [PSCustomObject]@{
    Name = "Alice"
    Age  = 25
}

# Creating an array of objects
$arrayOfObjects = @($object1, $object2)

# Displaying the array of objects
$arrayOfObjects


#Using the New-Object cmdlet

# Creating objects using New-Object
$object1 = New-Object PSObject -Property @{
    Name = "John"
    Age  = 30
}

$object2 = New-Object PSObject -Property @{
    Name = "Alice"
    Age  = 25
}

# Creating an array of objects
$arrayOfObjects = @($object1, $object2)

# Displaying the array of objects
$arrayOfObjects

# Creating an array of objects using a loop
$arrayOfObjects = @()

for ($i = 1; $i -le 3; $i++) {
    $newObject = [PSCustomObject]@{
        Property1 = "Value $i"
        Property2 = $i * 2
    }
    $arrayOfObjects += $newObject
}

# Displaying the array of objects
$arrayOfObjects

#Assignment
 $myArray = 1, 2, 3, 4, 5

#Addition (Concatenation)

# Concatenation
$array1 = 1, 2, 3
$array2 = 4, 5, 6
$resultArray = $array1 + $array2
# $resultArray now contains: 1, 2, 3, 4, 5, 6

OR 

Use += operator as shown below 
$resultArray += $array1,$array2


#Multiplication (Duplicate Elements)
# Duplication of elements
$originalArray = 1, 2, 3
$duplicatedArray = $originalArray * 2
# $duplicatedArray now contains: 1, 2, 3, 1, 2, 3

#Equality
$data = @('red','green','blue')

$data -eq 'green'

#Inequality
$data = @('red','green','blue')

$data -ne 'green'

#Containment (Element Present)
$data = @('red','green','blue')

$data -contains 'green'

#joins the element
$data = @('red','green','blue')

$data -join '-'

#Membership (Element Present)
$data = @('red','green','blue')
$data1 = ('red' -in $data)
$data1
