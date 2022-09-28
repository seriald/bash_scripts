@echo off

set /p hostname= Hostname: 

sc \\%hostname% stop spooler
pause
sc \\%hostname% start spooler
pause