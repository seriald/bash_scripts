@Echo Off
CLS
rem v1 -- Copies Lightroom Catalog to or from Finn
rem v2 -- Checks that H: drive is mapped and maps if necessary

Echo .........
Echo Checking that the H: drive is mapped
Echo .........
if exist h: goto :menu
else goto hdrive

:hdrive
Set /p yn=Would you like to map a network drive to H: ?(y/n): 
if %yn%==n goto EOF
if %yn%==y goto Hmap

:Hmap
net use h: \\finn\docs
goto Menu

:Menu
Echo..
Echo..................
Echo Press 1 to copy Catalog to H:\
Echo Press 2 to copy Catalog from H:\
Echo..................
Echo..
Echo 1 - Copy Lightroom Catalog to Finn - H:\lightroom_catalog\Catalog
Echo 2 - Copy Lightroom Catalog from Finn - H:\lightroom_catalog\Catalog
Echo 3 - Exit
Set /p M=Type 1,2,or 3, then press ENTER: 
IF %M%==1 goto CopyTo
IF %M%==2 goto CopyFrom
IF %M%==3 goto EOF
:CopyTo
xcopy "c:\data\docs\robert.fleming\docs\lightroom_catalog\Catalog\Lightroom 3 Catalog.lrcat" h:\lightroom_catalog\Catalog /y
goto Menu
:CopyFrom
xcopy "h:\lightroom_catalog\Catalog\Lightroom 3 Catalog.lrcat" c:\data\docs\robert.fleming\docs\lightroom_catalog\Catalog /y
goto Menu