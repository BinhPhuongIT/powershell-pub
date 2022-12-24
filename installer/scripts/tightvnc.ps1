[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url="https://www.tightvnc.com/download/2.8.63/tightvnc-2.8.63-gpl-setup-64bit.msi"
Invoke-WebRequest -Uri $url -OutFile "c:\tightvnc.msi"
msiexec.exe /i c:\tightvnc.msi /quiet /norestart SET_ALLOWLOOPBACK=1 VALUE_OF_ALLOWLOOPBACK=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=Admin123qwe SET_VIEWONLYPASSWORD=1 VALUE_OF_VIEWONLYPASSWORD=Passw0rd SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=Admin123qwe
del c:\tightvnc.msi