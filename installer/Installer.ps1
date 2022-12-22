# Config WinRM
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-NetConnectionProfile -NetworkCategory Private
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
# Install chocolatey
choco -v
if( $? ) {
  echo "Inited"
}
if( !$? ) {
	#Get-ExecutionPolicy
  #Set-ExecutionPolicy Bypass -Scope Process
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  #choco upgrade chocolatey
  #PowerShell -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('Init Success, Please reboot!')"
  #shutdown -r -t 0
}

# Install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex