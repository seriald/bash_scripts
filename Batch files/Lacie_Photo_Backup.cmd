@echo off
if exist y: goto run
else got map

:map
net use y: \\nas01\docs\robert

:run
robocopy "e:\Photos\" "Y:\docs\Photos" /E
 
#robocopy "e:\Photos\GoPro" "Y:\docs\Photos\GoPro" /E
#robocopy "e:\Photos\D7000" "Y:\docs\Photos\D7000" /E
#robocopy "e:\Photos\Mobile Photos" "Y:\docs\Photos\Mobile Photos" /E