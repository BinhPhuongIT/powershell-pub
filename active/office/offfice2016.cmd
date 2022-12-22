set ver=16
if exist "%ProgramFiles%\Microsoft Office\Office%ver%\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office%ver%"
if exist "%ProgramFiles(x86)%\Microsoft Office\Office%ver%\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office%ver%"
for /f "tokens=8" %b in ('cscript //nologo OSPP.VBS /dstatus ^| findstr /b /c:"Last 5"') do (cscript //nologo ospp.vbs /unpkey:%b)
for /f %i in ('dir /b ..\root\Licenses%ver%\ProPlusVL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses%ver%\%i"
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
cscript ospp.vbs /sethst:kms.lotro.cc
cscript ospp.vbs /act
Start winword
@