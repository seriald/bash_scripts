<#
=============================================================================================
Name:           Flush_DNS.ps1
Description:    Cleared DNS cache
Version:        0.1
website:        
Script by:      Robert Fleming
Date:           2024-10-20
For detailed Script execution: 
============================================================================================
#>

Write-Host ""
Write-Host "Checking if Chrome or Edge are open" -ForegroundColor Cyan

$ChromeCheck = Get-Process -name Chrome -ErrorAction SilentlyContinue
$EdgeCheck = Get-Process -name msEdge -ErrorAction SilentlyContinue

If ($Null -like $ChromeCheck){
}

Else {
Write-Host "Closing Chrome" -foregroundcolor Green
get-process -name Chrome | stop-process
Write-Host ""
}


If ($Null -like $EdgeCheck){
}

Else {
    Write-Host "Closing Edge" -foregroundcolor Green
    get-process -name msEdge | stop-process
    Write-Host ""
}

Write-Host "Flushing DNS cache" -foregroundcolor Green
ipconfig /flushdns