Invoke-Command -ComputerName server1 -ScriptBlock { Get-Process }
#The script block is used in the functions below.
function Get-SystemInfo {
  {
    Get-Process | Select-Object Name, CPU, Memory
    Get-Service | Where-Object { $_.Status -eq "Running" }
  }
}

#Script blocks with conditional statements:
if ({ Get-Process notepad -ErrorAction SilentlyContinue }) {
  Write-Output "Notepad is running."
}


#Script blocks with loops
foreach ($file in Get-ChildItem -Path C:\MyData) {
  {
    Write-Output "File name: $file.Name"
    Write-Output "File size: $file.Length"
  }
}

function Perform-Operation {
    param (
        [scriptblock]$operation
    )

    Write-Host "Executing the provided operation:"
    &$operation
}

# Usage
Perform-Operation -operation {
    $result = 5 * 8
    Write-Host "The result of the operation is: $result"
}

