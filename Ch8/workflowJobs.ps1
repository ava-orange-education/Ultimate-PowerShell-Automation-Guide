# This example demonstrates a workflow simulating a long-running operation.

workflow Simulate-LongRunningWorkflow {

    # Simulate a time-consuming operation
    Start-Sleep -Seconds 10

    # Suspend the workflow, allowing for manual intervention or later resumption
    Suspend-Workflow

    # Attempt to retrieve information about logical disks (executed upon workflow resumption)
    Get-WmiObject -Class Win32_LogicalDisk | 
        Where-Object { $_.DriveType -eq 3 } | 
        Select-Object DeviceID, @{Name='Size(GB)'; Expression={ $_.Size / 1GB }},
            @{Name='FreeSpace(GB)'; Expression={ $_.FreeSpace / 1GB }}
}

# Start the workflow as a background job
Simulate-LongRunningWorkflow
# Retrieve the output of the resumed workflow
Receive-Job -Id 20

# Retrieve information about the background job
Get-Job -Id 20

# Resume the suspended workflow
Resume-Job -Id 20
