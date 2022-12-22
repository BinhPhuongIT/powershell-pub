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
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/installer/scripts/tightvnc.ps1'))

# Install Chocoley
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
set-executionpolicy unrestricted -s cu
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser

exit