#Event-Based Jobs

# Register an event-based job to execute when a file is created 
Register-ObjectEvent -InputObject (Get-Item "C:\Path\to\File.txt") -EventName Created -Action { Write-Host "File Created!" } -AsJob 

#The xPath query is translated into a query object using .NET:
$eventId = 4625
$logName = 'Security'
$select = "*[System[(EventID=$eventId)]]"
$query = [System.Diagnostics.Eventing.Reader.EventLogQuery]::new($logName, [System.Diagnostics.Eventing.Reader.PathType]::LogName, $select)

$watcher = [System.Diagnostics.Eventing.Reader.EventLogWatcher]::new($query)
$watcher.Enabled = $true

$action = {
    $string = @"
- Attempted logon from: $($eventArgs.EventRecord.properties[19].value)
- Targeting account: $($eventArgs.EventRecord.properties[5].value)
- on domain: $($eventArgs.EventRecord.properties[6].value)
"@
    Write-Host $string
    $string | Out-File C:\tmp\security.log -Append
}




$eventId = 4625
$logName = 'Security'
$select = "*[System[(EventID=$eventId)]]"
$query = [System.Diagnostics.Eventing.Reader.EventLogQuery]::new($logName, [System.Diagnostics.Eventing.Reader.PathType]::LogName, $select)
$watcher = [System.Diagnostics.Eventing.Reader.EventLogWatcher]::new($query)
$watcher.Enabled = $true
$action = {
    $string = @"
$(Get-Date -Format yyyyMMddTHHmmssffff) - Attempted logon from: $($eventArgs.EventRecord.properties[19].value)
  - Targeting account: $($eventArgs.EventRecord.properties[5].value)
  - on domain: $($eventArgs.EventRecord.properties[6].value)
"@
    Write-Host $string
    $string | Out-File C:\temp\badlogins.log -Append
}
$job = Register-ObjectEvent -InputObject $watcher -EventName 'EventRecordWritten' -Action $action
Receive-Job $job




