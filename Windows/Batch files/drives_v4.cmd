@echo off

net time \\ad01 /set /yes
goto drivecheck

:drivecheck
if exist h: goto hdelete
if exist k: goto kdelete
if exist m: goto mdelete
if exist s: goto sdelete
if exist t: goto tdelete
else goto mappings

:kdelete
net use k: /d /y

:mdelete
net use m: /d /y

:sdelete
net use s: /d /y

:tdelete
net use t: /d /y

:hdelete
net use h: /d /y

:mappings
#Standard drive mappings
rem net use h: \\nas03\docs\%username%
net use s: \\nas01\openshare\apps
net use k: \\nas03\music
net use m: \\nas03\Movies
net use t: \\nas03\TV_Shows
goto end

:end
#exit
