<#
=============================================================================================
Name:           Win11_InstallLinuxSub.ps1
Description:    Installs Windows Subsystem
Version:        0.1
website:        
Script by:      Robert Fleming
Date:           2024-10-26
For detailed Script execution: 
============================================================================================
#>

Write-Host "Installing Windows Subsystem for Linux" -ForegroundColor Green
Write-Host ""

wsl --install

Write-Host ""

wsl -l -o

$OS = Read-Host -Prompt "Enter the Distro to install or Press Enter to use the default"

If ($Null -like $OS) {
    Write-Host "Using the default distro" -ForegroundColor Green
    Write-Host ""
    wsl --install -d
}

Else {
    Write-Host "Using the $OS distro" -ForegroundColor Green
    Write-Host ""

    wsl --install  $OS

}


