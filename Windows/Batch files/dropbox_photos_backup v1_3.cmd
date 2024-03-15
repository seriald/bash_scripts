@echo off
if exist h: goto run
else got map

:map
net use h: \\nas01\docs\robert

:run
robocopy "%userprofile%\Dropbox\Camera Uploads" "h:\docs\Photos\Mobile Photos"
robocopy "%userprofile%\scripts" "h:\docs\scripts" /e
robocopy "%userprofile%\bash_scripts" "h:\docs\bash_scripts" /e