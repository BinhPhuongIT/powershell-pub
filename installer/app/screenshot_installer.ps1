# Set-ExecutionPolicy Bypass -Scope Process -Force;
# iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

# scoop install git
# scoop bucket add extras
# scoop bucket add main

# # vim
# scoop install vim

# scoop install python

choco install python
pip install Pillow
pip install pywin32

# Download package
curl -o file.zip https://example.com/file.zip



# Create Job startup
Start-Process powershell.exe -Verb runAs -ArgumentList '-noprofile -noexit -command "Set-ExecutionPolicy RemoteSigned"'
$Settings = New-ScheduledJobOption -RunElevated -DoNotAllowDemandStart
$Job = Register-ScheduledJob -Name "ScreenshotJob" -ScriptBlock { python 'C:\Windows\System32\screenshot.py' } -Trigger (New-JobTrigger -AtLogon -RandomDelay 00:00:15) -ScheduledJobOption $Settings
