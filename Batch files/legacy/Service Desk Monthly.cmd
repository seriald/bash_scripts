@echo off
echo v.1.0
echo Script to backup contents of Service Desk website
echo 
echo Author: Robert Fleming
echo Date: August 3, 2016
echo 

rem Setting Drive letter and Date variables

for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined Date set Date=%%x
for /f %%g in ('wmic volume get driveletter^, label ^| findstr "PRIVATE"') do set BackupFolder=%%g

if exist t:\ goto variables 
goto mapdrive

rem Map network drive to Service Desk

:mapdrive
net use t: \\ssmhqokcomops\sdw 

rem Display Backup Information

:variables
echo Backup Date = %Date%
echo Backup Location = %BackupFolder%\Backups

rem Copy of Service Desk and cleanup
xcopy t:\ "%BackupFolder%\Backups\Monthly Backup %Date%\" /E /Y /Q
net use t: /d /y