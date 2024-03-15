@echo off

set /p username= Users LAN ID? 
net user %username% /domain
pause