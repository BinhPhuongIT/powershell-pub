Set-ExecutionPolicy Bypass -Scope Process -Force;
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"

scoop install git
scoop bucket add extras
scoop bucket add main

# vim
scoop install vim

scoop install python

pip install Pillow
pip install pywin32
