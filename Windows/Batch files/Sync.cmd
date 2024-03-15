@echo off

:menu
echo Press 1 to Sync Templates to W2230200039093
echo Press 2 to Sync Templates from W2230200039093
echo Press 3 to Open Templates folder
echo Press 4 to Map Network sharesNovell Share
echo Press 5 to Clear Outlook OST cache
echo Press 6 to Sync Templates \ Scripts to USB key
echo Press 7 to Exit
echo ....
set /p M=Type 1, 2, or 3 then Press Enter: 
IF %M%==1 goto To
IF %M%==2 goto From
IF %M%==3 goto Open
IF %M%==4 goto Map
IF %M%==5 goto OutlookCache
IF %M%==6 goto ExternalSync
IF %M%==7 goto EOF

:To
robocopy %appdata%\Microsoft\Templates\ \\w2230200039093\c$\users\flemingr\appdata\roaming\microsoft\templates
goto EOF

:From
robocopy \\w2230200039093\c$\users\flemingr\appdata\roaming\microsoft\templates %appdata%\Microsoft\Templates\
goto EOF

:Open
start %appdata%\Microsoft\Templates\
goto EOF

:Map
echo Press a to map SMXHQOKEDR2\wgadmin to Z:        Press o to map SHQ07DSMB2\archive
echo Press b to map SMXHQOKGRPWARC1\archive1        Press p to map SHQ07DSSK2\archive
echo Press c to map SMXHQOKGRPWARC1\archive2        Press q to map SHQ07DSAB2\archive
echo Press d to map SMXHQOKGRPWARC1\archive3        Press r to map SHQ07DSCG2\archive
echo Press e to map SMXHQOKGRPWARC1\archive4        Press s to map SHQ07DSBC2\archive
echo Press f to map SMXHQOKGRPWARC1\archive5        Press t to map SHQ07DSYT2\archive
echo Press g to map SMXHQOKGRPWARC1\archive6        Press u to map SHQ07DSNT2\archive
echo Press h to map SMXHQOKGRPWARC1\archive7        Press v to map SHQ07DSNU2\archive
echo Press i to map SMXHQOKGRPARC2\archive1         Press w to map SHQ07SO1\archive
echo Press j to map SHQ07DSBR2\archive              Press x to map SHQ07SU1\archive
echo Press k to map SSMSKRAFASCL2\rs_archive        Press y to map SHQ07DSTB2\archive
echo Press l to map SMXSKPARGRPW1\archive           Press z to map SHQ07DSON2\archive
echo Press m to map SHQ07DSAT2\archive              Press 1 to map SSMBCVMFASCL1\rs_archive$
echo Press n to map SHQ07DSPQ2\archive        

echo ** Drives will map to T: unless otherwise noted

set /p M=Enter selection to map drive: 
IF %M%==a goto a
IF %M%==b goto b
IF %M%==c goto c
IF %M%==d goto d
IF %M%==e goto e
IF %M%==f goto f
IF %M%==g goto g
IF %M%==h goto h
IF %M%==i goto i
IF %M%==j goto j
IF %M%==k goto k
IF %M%==l goto l
IF %M%==m goto m
IF %M%==n goto n
IF %M%==o goto o
IF %M%==p goto p
IF %M%==q goto q
IF %M%==r goto r
IF %M%==s goto s
IF %M%==t goto t
IF %M%==u goto u
IF %M%==v goto v
IF %M%==w goto w
IF %M%==x goto x
IF %M%==y goto y
IF %M%==z goto z
IF %M%==1 goto 1

:a
if exist net use z: /d /y 
net use z: \\smxhqokedr2\gwadmin
goto EOF

:b
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive1
start t:
goto EOF

:c
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive2
start t:
goto EOF

:d
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive3
start t:
goto EOF

:e
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive4
start t:
goto EOF

:f
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive5
start t:
goto EOF

:g
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive6
start t:
goto EOF

:h
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPWARC1\archive7
start t:
goto EOF

:i
if exist t: net use t: /d /y 
net use t: \\SMXHQOKGRPARC2\archive1
start t:
goto EOF

:j
if exist t: net use t: /d /y 
net use t: \\SHQ07DSBR2\archive
start t:
goto EOF

:k
if exist t: net use t: /d /y 
net use t: \\SSMSKRAFASCL2\rs_archive
start t:
goto EOF

:l
if exist t: net use t: /d /y 
net use t: \\SMXSKPARGRPW1\archive
start t:
goto EOF

:m
if exist t: net use t: /d /y 
net use t: \\SHQ07DSAT2\archive
start t:
goto EOF

:n
if exist t: net use t: /d /y 
net use t: \\SHQ07DSPQ2\archive
start t:
goto EOF

:o
if exist t: net use t: /d /y 
net use t: \\SHQ07DSMB2\archive
start t:
goto EOF

:p
if exist t: net use t: /d /y 
net use t: \\SHQ07DSSK2\archive
start t:
goto EOF

:q
if exist t: net use t: /d /y 
net use t: \\SHQ07DSAB2\archive
start t:
goto EOF

:r
if exist t: net use t: /d /y 
net use t: \\SHQ07DSCG2\archive
start t:
goto EOF

:s
if exist t: net use t: /d /y 
net use t: \\SHQ07DSBC2\archive
start t:
goto EOF

:t
if exist t: net use t: /d /y 
net use t: \\SHQ07DSYT2\archive
start t:
goto EOF

:u
if exist t: net use t: /d /y 
net use t: \\SHQ07DSNT2\archive
start t:
goto EOF

:v
if exist t: net use t: /d /y 
net use t: \\SHQ07DSNU2\archive
start t:
goto EOF

:w
if exist t: net use t: /d /y 
net use t: \\SHQ07SO1\archive
start t:
goto EOF

:x
if exist t: net use t: /d /y 
net use t: \\SHQ07SU1\archive
start t:
goto EOF

:y
if exist t: net use t: /d /y 
net use t: \\SHQ07DSTB2\archive
start t:
goto EOF

:z
if exist t: net use t: /d /y 
net use t: \\SHQ07DSON2\archive
start t:
goto EOF

:1
if exist t: net use t: /d /y 
net use t: \\SSMBCVMFASCL1\rs_archive$
start t:
goto EOF

:OutlookCache
set /p host=Enter Hostname:
set /p user=Enter Username:
if exist t: net use t: /d /y
echo Hostname: %host%
echo Username: %user%
t:
ren *.ost *.old

:eof
exit

:ExternalSync
Echo Press 1 to sync to USB
Echo Press 2 to Sync to Local Profile
echo ....
set /p M=Type 1, 2 then Press Enter: 
IF %M%==1 goto ExternalBackup
IF %M%==2 goto LocalBackup

:ExternalBackup
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined Date set Date=%%x
for /f %%g in ('wmic volume get driveletter^, label ^| findstr "SanDisk Key"') do set BackupFolder=%%g
goto variables

:variables
echo Backup Date = %Date%
echo Backup Location = %BackupFolder%
echo ...
echo Syncing Templates folder
xcopy %appdata%\Microsoft\Templates "%BackupFolder%\Templates\" /E /Y /exclude:%userprofile%\ExcludedFiles.txt/Q

echo ...
echo Syncing Script folder
xcopy %userprofile%\scripts "%BackupFolder%\scripts" /E /Y /Q
goto EOF

:LocalBackup
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined Date set Date=%%x
for /f %%g in ('wmic volume get driveletter^, label ^| findstr "SanDisk Key"') do set BackupFolder=%%g
goto variables2

:variables2
echo Backup Date = %Date%
echo Backup Location = %BackupFolder%

echo Syncing Scripts folder from %BackupFolder%
xcopy "%BackupFolder%\scripts" "%userprofile%\scripts" /E /Y /Q

echo Syncing Templates folder from %BackupFolder%
xcopy "%BackupFolder%\Templates" "%appdata%\Microsoft\Templates" /E /Y /exclude:%userprofile%\ExcludedFiles.txt /Q

