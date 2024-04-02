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

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "Start_ShowClassicMode"
$value = "1"

$admincheck = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

If ($admincheck -like "false") {

    Write-Host "Run from Administrator Console" -ForegroundColor Red
}

Else {
    
    Get-WindowsCompatibility -name RSAT* -online | Select-Object -Property DisplayName, States
}
