# Enable Administrator user and set password
Get-LocalUser -Name "Administrator" | Enable-LocalUser
$Password = (ConvertTo-SecureString "D3v!@#0ps$%^" -AsPlainText -Force)
$UserAccount = Get-LocalUser -Name "administrator"
$UserAccount | Set-LocalUser -Password $Password

# Change pass Admin user
$ssvadminAccount = Get-LocalUser -Name "admin"
$ssvadminAccount | Set-LocalUser -Password $Password

# Install openssh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/OpenSSH.ps1'))

# Enable Winrm
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/WinRM.ps1'))

# Install Chocoley
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install tightvnc
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BinhPhuongIT/powershell-pub/main/tightvnc.ps1'))

# Install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

exit