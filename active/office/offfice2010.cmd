if exist "%ProgramFiles%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office14"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office14\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office14"
cscript //Nologo OSPP.VBS /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB
cscript //Nologo ospp.vbs /sethst:kms.lotro.cc&cscript //nologo ospp.vbs /act&timeout 5&start winword&exit
@