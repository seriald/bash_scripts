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
$value = "0"

$admincheck = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

If ($admincheck -like "false") {

    Write-Host "Run from Administrator Console" -ForegroundColor Red
}

Else {
    
    If ($admincheck -like "True") {

        if (-not (Test-Path $registryPath)) {
            New-Item -Path $registryPath -Force | Out-Null

            New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null

        }
    }
}
