
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


Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock {python.exe 'C:\Program Files\screenshot.py'} -Trigger (New-JobTrigger -AtLogon -RandomDelay 00:00:15) -ScheduledJobOption (New-ScheduledJobOption -RunElevated)


# Final
Start-Process powershell.exe -Verb runAs -ArgumentList '-noprofile -noexit -command "Set-ExecutionPolicy RemoteSigned"'
$Settings = New-ScheduledJobOption -RunElevated -DoNotAllowDemandStart
$Job = Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock { python 'C:\Windows\System32\screenshot.py' } -Trigger (New-JobTrigger -AtLogon -RandomDelay 00:00:15) -ScheduledJobOption $Settings

# $Job | Set-ScheduledJobOption -WindowStyle Hidden
