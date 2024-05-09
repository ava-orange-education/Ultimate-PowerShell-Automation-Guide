function Get-Square {
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [int]$Number
    )
    process {
        $Square = $Number * $Number
        Write-Output "The square of $Number is $Square."
    }
}
# Usage with pipeline input
1, 2, 3 | Get-Square

#Another example involves multiple pipeline-enabled parameters and some advanced filtering and processing. 
function Get-EvenOddSum {
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [int]$Number,

        [Parameter(Position = 1, ValueFromPipeline = $true)]
        [string]$Category
    )

    begin {
        $evenSum = 0
        $oddSum = 0
    }

    process {
        if ($Number % 2 -eq 0) {
            $evenSum += $Number
        } else {
            $oddSum += $Number
        }
    }

    end {
        Write-Output "Category: $Category, Even Sum: $evenSum, Odd Sum: $oddSum"
    }
}

# Usage with pipeline input
1..5 | ForEach-Object { $_ } | Get-EvenOddSum -Category 'Numbers'
2..6 | ForEach-Object { $_ } | Get-EvenOddSum -Category 'MoreNumbers'
