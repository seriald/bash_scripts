@echo off & for /F "tokens=1-4 delims=/ " %%A in ('date/t') do (
set DateMonth=%%B
set DateDay=%%C
set DateYear=%%D
)

set CurrentDates=%DateYear%%DateMonth%%DateDay%

md "C:\Users\FlemingR\Desktop\Service Desk Backups\%CurrentDate%s"
xcopy x:\ "C:\Users\FlemingR\Desktop\Service Desk Backups\%CurrentDates%" /T /E
xcopy x:\ "C:\Users\FlemingR\Desktop\Service Desk Backups\%CurrentDates%" /E /Y /Q