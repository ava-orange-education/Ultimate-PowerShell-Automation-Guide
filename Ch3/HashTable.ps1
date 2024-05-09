# Define parameters using a hash table
$directoryParams = @{
    Path        = 'C:\Temp\MyPD'
    ItemType    = 'Directory'
    Force       = $true
    Confirm     = $false
}

# Use splatting to pass parameters to the New-Item cmdlet
New-Item @directoryParams

