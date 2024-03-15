@echo off
if exist y: goto run
else got map

:map
net use h: \\nas01\docs\robert

:run
robocopy "%userprofile%\Dropbox\Camera Uploads" "h:\docs\Photos\Mobile Photos"
robocopy "%userprofile%\scripts" "h:\docs\scripts" /e