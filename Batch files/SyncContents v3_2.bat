@echo off
rem Common Service Desk tools
rem v 3.3
rem 2017-03-24
rem v3_3 - Added syncing to http://ncwbina0030
rem v3_2 - Weekly backups to W2230200043367 from any machine.
rem v3_1 - Added Hardware folder exemptions
rem v3 - Added Backup to External drive functions
rem v2 - Added Robocopy functions to mirror/sync local contents and SD page
rem v1 - Configured backup to Desktop folder

echo ......
echo Checking that SDP Drive is mapped
echo ......
if exist z: goto backupsd
else goto zdrive

:backupsd
if exist w: goto menu
net use w: \\w2230200043367\SDbackups
goto menu

:zdrive
net use z: \\ssmhqokcomops\sdw\
goto menu

:menu
echo Press 1 to Sync Service Desk contents
echo Press 2 to backup Service Desk
echo Press 3 to Exit
echo ....
set /p M=Type 1, 2, or 3 then Press Enter: 
IF %M%==1 goto sdpcopy
IF %M%==2 goto sdbackup
IF %M%==3 goto EOF

:sdpcopy
echo ......
echo Press 1 to copy SDP contents to local disk
echo Press 2 to copy local contents to SDP
echo Press 3 to Exit
echo ......
echo ....
Set /p M=Type, 1, 2, or 3, then Press Enter: 
IF %M%==1 goto CopyTo
IF %M%==2 goto CopyFrom
IF %M%==3 goto EOF

:CopyTo
robocopy z:\ c:\data\SDP /MIR  /FFT /Z /W:5 
goto EOF

:CopyFrom
robocopy c:\data\SDP z:\ /MIR /FFT /Z /W:5 /XD "c:\data\SDP\backup\aspnet_client"
robocopy c:\data\SDP y:\ /MIR /FFT /Z /W:5 /XD "c:\data\SDP\backup\aspnet_client"

goto EOF

:sdbackup
echo .....
echo Press 1 to backup site to Desktop
echo Press 2 to backup site to External Drive
echo .....
Set /p M=Type 1, 2, or 3, then Press Enter: 
IF %M%==1 goto DesktopBackup
IF %M%==2 goto ExternalBackup
IF %M%==3 goto EOF

:DesktopBackup
@echo off & for /F "tokens=1-4 delims=/ " %%A in ('date/t') do (
set DateMonth=%%B
set DateDay=%%C
set DateYear=%%D
)

set CurrentDate=%DateYear%%DateMonth%%DateDay%

cd w:
md %CurrentDate%
xcopy z:\ "w:\%CurrentDate%" /T /E
xcopy z:\ "w:\%CurrentDate%" /E /Y /Q
goto EOF

:ExternalBackup
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined Date set Date=%%x
for /f %%g in ('wmic volume get driveletter^, label ^| findstr "PRIVATE"') do set BackupFolder=%%g

if exist t:\ goto variables 
goto mapdrive

rem Map network drive to Service Desk

:mapdrive
net use t: /d /y
net use t: \\ncwbina0030\sdp

rem Display Backup Information

:variables
echo Backup Date = %Date%
echo Backup Location = %BackupFolder%\Backups

rem Copy of Service Desk and cleanup
xcopy t:\ "%BackupFolder%\Backups\Monthly Backup %Date%\" /E /Y /Q
net use t: /d /y
goto EOF

:EOF
exit