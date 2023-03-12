# Final
Start-Process powershell.exe -Verb runAs -ArgumentList '-noprofile -noexit -command "Set-ExecutionPolicy RemoteSigned"'
$Settings = New-ScheduledJobOption -RunElevated -DoNotAllowDemandStart
Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock { python 'C:\Windows\System32\screenshot.py' } -Trigger (New-JobTrigger -AtLogon -RandomDelay 00:00:15) -ScheduledJobOption $Settings
