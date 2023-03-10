$trigger = New-ScheduledJobTrigger -Once -At (Get-Date).AddSeconds(5) -RepetitionInterval (New-TimeSpan -Seconds 5) -RepetitionDuration ([TimeSpan]::MaxValue)
$jobName = "ScreenshotJob"
$scriptPath = "C:\Program Files\screenshot.py"
Register-ScheduledJob -Name $jobName -FilePath $scriptPath -Trigger $trigger
