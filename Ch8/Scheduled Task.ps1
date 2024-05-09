# Define the scheduled task trigger for a weekly execution on Monday at 5 am
$taskTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 5am

# Define the action to be performed by the scheduled task using PowerShell
$taskAction = New-ScheduledTaskAction -Execute "PowerShell" -Argument "-NoProfile -ExecutionPolicy Bypass -File 'C:\scripts\health.ps1' -Output 'HTML'" -WorkingDirectory 'C:\scripts'

# Register the scheduled task with advanced configurations
Register-ScheduledTask -Action $taskAction -Trigger $taskTrigger -TaskName 'AdminPSTasks' -User 'NT AUTHORITY\SYSTEM' -Force

# Configure additional settings for the scheduled task (optional)
$taskSettings = Get-ScheduledTask -TaskName 'AdminPSTasks' 

