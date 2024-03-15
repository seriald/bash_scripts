rem @echo off

if exist s: goto RemoveS
else goto Map

:RemoveS
net use s: /d
goto Map

:Map
net use s: "\\ssmhqokcomops\SDW\procedures\files\myKEY Guide" /persistent:yes
goto Copy

:Copy
copy "s:\myKEY Guide.lnk" "c:\users\%username%\Desktop\myKEY Guide.lnk"
REM exit