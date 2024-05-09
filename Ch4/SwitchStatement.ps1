#Anatomy of a Switch Statement

switch ($variable) {
    "value1" {
        # Code to execute if $variable equals "value1"
    }
    "value2" {
        # Code to execute if $variable equals "value2"
    }
    "value3" {
        # Code to execute if $variable equals "value3"
    }
    Default {
        # Code to execute if $variable doesn't match any specified values
    }
}

# Function: Classify-Day
function Classify-Day($day) {
    switch ($day) {
        "Monday" {
            Write-Host "It's the start of the workweek."
        }
        "Tuesday" {
            Write-Host "It's the second day of the week."
        }
        "Wednesday" {
            Write-Host "It's hump day!"
        }
        "Thursday" {
            Write-Host "It's almost the weekend."
        }
        "Friday" {
            Write-Host "TGIF! It's the end of the workweek."
        }
        Default {
            Write-Host "It's the weekend or an unrecognized day."
        }
    }
}

#Switch with Conditions

function Classify-Number($number) {
    switch ($number) {
        { $_ -lt 0 } {
            Write-Host "$number is negative."
        }
        { $_ -ge 0 -and $_ -lt 10 } {
            Write-Host "$number is in the range 0 to 9."
        }
        { $_ -ge 10 -and $_ -lt 20 } {
            Write-Host "$number is in the range 10 to 19."
        }
        Default {
            Write-Host "$number is in an unrecognized range."
        }
    }
}
# Test the function with different numbers
Classify-Number -5
Classify-Number 7
Classify-Number 15
Classify-Number 25

#Switch with Wildcard Matches: 
function Check-FileType($filePath) {
    switch -Wildcard ($filePath) {
        "*.txt" {
            Write-Host "Text file detected: $filePath"
        }
        "*.csv" {
            Write-Host "CSV file detected: $filePath"
        }
        "*.pdf" {
            Write-Host "PDF file detected: $filePath"
        }
        Default {
            Write-Host "File type not recognized for: $filePath"
        }
    }
}

# Test the function with different file paths
Check-FileType "C:\Documents\example.txt"
Check-FileType "C:\Data\data.csv"
Check-FileType "C:\Reports\report.pdf"
Check-FileType "C:\Images\photo.jpg"

