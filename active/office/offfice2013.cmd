if exist "%ProgramFiles%\Microsoft Office\Office15\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office15"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office15"
cscript //nologo OSPP.VBS /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT
cscript //nologo ospp.vbs /sethst:kms.lotro.cc&cscript //nologo ospp.vbs /act&timeout 5&start winword&exit
@