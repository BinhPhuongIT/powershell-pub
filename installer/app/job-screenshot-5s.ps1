
$Action = New-ScheduledTaskAction -Execute "python.exe" -Argument "C:\Program Files\screenshot.py"
Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtLogOn -RandomDelay 00:00:30)
Register-ScheduledJob -Name "ScreenshotJob2" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtLogOn -User admin -RandomDelay 00:00:30)


Set-ExecutionPolicy RemoteSigned
$scriptPath = "C:\Program Files\screenshot.py"
$ps1Path = "C:\Program Files\screenshot.ps1"
Set-Content -Path $ps1Path -Value "python `"$scriptPath`""
Register-ScheduledJob -Name "ScreenshotJob" -FilePath $ps1Path -Trigger (New-JobTrigger -AtLogOn)

# Get-ScheduledJob
# Unregister-ScheduledJob ScreenshotJob2

