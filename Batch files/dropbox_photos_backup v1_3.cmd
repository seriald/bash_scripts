@echo off
if exist y: goto run
else got map

:map
net use y: \\nas03\docs\robert

:run
robocopy "%userprofile%\Dropbox\Camera Uploads" "Y:\docs\Photos\Mobile Photos"