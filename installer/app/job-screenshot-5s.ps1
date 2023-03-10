$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)

# $trigger = New-ScheduledJobTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)
$scriptPath = "C:\Program Files\screenshot.py"
# Register-ScheduledJob -Name "ScreenshotJob" -FilePath $scriptPath -Trigger $trigger
Register-ScheduledTask -TaskName "ScreenshotJob" -Trigger $trigger -Action {Write-Host "Task is running"} -RunLevel Highest -User "SYSTEM"


Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-ScheduledJobTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue))

$action = New-ScheduledTaskAction -Execute "python.exe" -Argument "-ExecutionPolicy Bypass -File C:\Program Files\screenshot.py"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)
Register-ScheduledTask -TaskName "Screenshot" -Action $action -Trigger $trigger -User "administrator" -Password "D3v!@#0ps$%^"

$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)
$action = New-ScheduledTaskAction -Execute "python.exe" -Argument "-ExecutionPolicy Bypass -File C:\Program Files\screenshot.py"
Register-ScheduledTask -TaskName "ScreenshotJob" -Trigger $trigger -Action $action -RunLevel Highest -User "administrator"


Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtStartup -RandomDelay 00:00:30)
