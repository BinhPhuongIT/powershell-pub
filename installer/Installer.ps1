# Enable Administrator user and set password
Get-LocalUser -Name "Administrator" | Enable-LocalUser
$Password = (ConvertTo-SecureString "D3v!@#0ps$%^" -AsPlainText -Force)
$UserAccount = Get-LocalUser -Name "administrator"
$UserAccount | Set-LocalUser -Password $Password

# Change pass Admin user
$ssvadminAccount = Get-LocalUser -Name "admin"
$ssvadminAccount | Set-LocalUser -Password $Password

# Install openssh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/scripts/OpenSSH.ps1'))

# Enable Winrm
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/scripts/WinRM.ps1'))

# Install tightvnc
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/scripts/tightvnc.ps1'))
# [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# $url="https://www.tightvnc.com/download/2.8.63/tightvnc-2.8.63-gpl-setup-64bit.msi"
# Invoke-WebRequest -Uri $url -OutFile "c:\tightvnc.msi"
# msiexec.exe /i c:\tightvnc.msi /quiet /norestart SET_ALLOWLOOPBACK=1 VALUE_OF_ALLOWLOOPBACK=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=Admin123qwe SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=Passw0rd SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=Admin123qwe
# del c:\tightvnc.msi

# Install Chocoley
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Scoop
# irm get.scoop.sh -outfile 'install.ps1'
# .\install.ps1 -RunAsAdmin
# I don't care about other parameters and want a one-line command
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"


exit
