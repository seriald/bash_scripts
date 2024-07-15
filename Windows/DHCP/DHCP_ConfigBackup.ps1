<#
=============================================================================================
Name:           Export DHCP Server configuration
Description:    
Version:        0.2
website:        
Script by:      Robert Fleming
Date:           2024-04-06
For detailed Script execution: 
============================================================================================
#>

function Get_Date {
    
    return "{0:yyyyMMdd}" -f (Get-Date)
    
}

$DHCPServer = Read-Host "Please enter DHCP Server"
$current = Get-Location
$Outfile = "$current\$(Get_Date)_$DHCPServer"+"_DHCPExport.xml"

if (Test-Path $OutFile -PathType Leaf) {
    Write-Host "Clearing previous output file $Outfile" -ForegroundColor Red
    Write-Host ""
    rm $outfile
}

Write-Host "Confirming $dhcpserver is reachable"
$confirm = Test-Connection $DHCPServer

if ($null -like $confirm) {
    Write-Host "$dhcpserver not reachable"
    
}

Else {
    Write-Host "Exporting $DHCPServer"
    Export-DhcpServer -ComputerName "$DHCPServer" -File $outfile
    #Backup-DhcpServer -ComputerName "$DHCPServer" -File $outfile

    Write-Host "Exported $dhcpserver configuration to $outfile"
}
