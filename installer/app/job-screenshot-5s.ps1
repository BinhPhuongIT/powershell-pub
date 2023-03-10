
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)
$action = New-ScheduledTaskAction -Execute "python.exe" -Argument "-ExecutionPolicy Bypass -File C:\Program Files\screenshot.py"
Register-ScheduledTask -TaskName "ScreenshotJob" -Trigger $trigger -Action $action -RunLevel Highest -User "administrator"



$Action = New-ScheduledTaskAction -Execute "python.exe" -Argument "C:\Program Files\screenshot.py"
Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtLogOn -RandomDelay 00:00:30)
Register-ScheduledJob -Name "ScreenshotJob2" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtLogOn -User admin -RandomDelay 00:00:30)
