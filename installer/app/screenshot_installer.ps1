# Set-ExecutionPolicy Bypass -Scope Process -Force;
# iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

# scoop install git
# scoop bucket add extras
# scoop bucket add main

# # vim
# scoop install vim

Set-ExecutionPolicy Bypass -Scope Process -Force;
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
# scoop install python
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install python
pip install Pillow pywin32 requests numpy image pyautogui

# pip install Pillow
# pip install pywin32
# pip install requests

# Download package
curl -o C:\Windows\System32\screenshot.py https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/app/screenshot.py
curl -o C:\Users\data\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\screenshot-client.py https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/app/screenshot-client.py

# Add host
192.168.1.111   screenshot-server.local

# Export job
Export-ScheduledTask -TaskName "ScreenshotJob" -TaskPath "\Path\To\Task" -ExportTo "C:\ScreenshotJob.xml"

# Import Job
Import-ScheduledTask -TaskName "ScreenshotJob" -TaskPath "\Path\To\Task" -Xml (Get-Content "C:\ScheduledJob.xml" | Out-String) -User "Username" -Password "Password"

#  Create job with nssm
nssm.exe install "Screenshot" "C:\Python311\python.exe" "C:\Windows\System32\screenshot.py"
C:\Users\data\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

# Create Job startup if not exits
Start-Process powershell.exe -Verb runAs -ArgumentList '-noprofile -noexit -command "Set-ExecutionPolicy RemoteSigned"'
$Settings = New-ScheduledJobOption -RunElevated -DoNotAllowDemandStart
$Job = Register-ScheduledJob -Name "Screenshot2" -ScriptBlock { python 'C:\Windows\System32\screenshot.py' } -Trigger (New-JobTrigger -AtLogon -RandomDelay 00:00:15) -ScheduledJobOption $Settings


# Grand permit folder screens
$Acl = Get-Acl -Path C:\Windows\screenshots\
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Users","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl -Path C:\Windows\screenshots\ -AclObject $Acl
