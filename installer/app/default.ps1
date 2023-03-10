# Set-ExecutionPolicy Bypass -Scope Process -Force;
# iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

scoop install git
scoop bucket add extras
scoop bucket add main

# vim
scoop install vim
'
set ff=unix

set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set backupdir=$TEMP
' | out-file ~/.vimrc -enc oem -append

scoop install python

# curl
scoop install curl
# winrar
scoop install winrar
# zip
scoop install zip
# foxit-reader
# scoop install foxit-reader
# Google Chrome
scoop install googlechrome
# Teamviewer
# scoop install teamviewer
# Anydesk
scoop install anydesk

# Unikey
choco install -y -f unikey
# choco install -y -f office365business
choco install -y -f ultraviewer
