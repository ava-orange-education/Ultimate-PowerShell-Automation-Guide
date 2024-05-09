# Create a pre-sized array with 5 elements
$preSizedArray = New-Object Object[] 5

# Access and modify elements
$preSizedArray[0] = "Element 1"
$preSizedArray[1] = "Element 2"
$preSizedArray[2] = "Element 3"
$preSizedArray[3] = "Element 4"
$preSizedArray[4] = "Element 5"

# Display the pre-sized array
$preSizedArray


#Multiplying Arrays

# Original array
$originalArray = 1, 2, 3

# Duplicate elements using multiplication
$duplicatedArray = $originalArray * 3

# Display the duplicated array
$duplicatedArray

#Nested Arrays
$data = @(

        @(1,2,3),

        @(4,5,6),

        @(7,8,9)

    )

