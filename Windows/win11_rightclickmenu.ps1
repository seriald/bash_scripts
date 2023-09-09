<#
=============================================================================================
Name:           
Description:    
Version:        0.1
website:        
Script by:      Robert Fleming
Date:           2023-09-09
For detailed Script execution: 
============================================================================================
#>
$admincheck = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

If ($admincheck -like "false") {

    Write-Host "Run from Administrator Console" -ForegroundColor Red
}

Else {
    
    If ($admincheck -like "True") {

        Write-Host "Running from Administrator Console" -ForegroundColor Green
        # Add the reg key
        Write-Host "Adding regkey" -ForegroundColor Cyan
        reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
        Write-Host ""
        # Restarting Explorer.exe
        write-host "Stopping Explorer.exe" -ForegroundColor Cyan
        taskkill /f /im explorer.exe     
        write-host "Starting Explorer.exe" -ForegroundColor Cyan
        start explorer.exe   
    }
}
