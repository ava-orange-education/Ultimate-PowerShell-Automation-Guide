# Using ForEach-Object
Measure-Command {1..5 | ForEach-Object {Start-Sleep 1} } | Select-Object TotalSeconds

# Using Start-Job
Measure-Command {1..5 | ForEach-Object {Start-Job {Start-Sleep 1}} | Wait-Job} | Select-Object TotalSeconds

# Using Start-ThreadJob
Measure-Command {1..5 | ForEach-Object {Start-ThreadJob -ThrottleLimit 5 {Start-Sleep 1}} | Wait-Job} | Select-Object TotalSeconds

# Using ForEach-Object -Parallel
Measure-Command {1..5 | ForEach-Object -Parallel {Start-Sleep 1} -ThrottleLimit 5} | Select-Object TotalSeconds
