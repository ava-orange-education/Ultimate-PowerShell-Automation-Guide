    param(
        [Parameter(Mandatory=$true)]
        [int]$Number1,

        [Parameter(Mandatory=$true)]
        [int]$Number2
    )

    $Sum = $Number1 + $Number2
    Write-Host "Sum of $Number1 and $Number2 is: $Sum"

