@echo off

set /p hostname= Hostname: 

psexec \\%hostname% ipconfig /flushdns
pause
psexec \\%hostname% ipconfig /registerdns
pause