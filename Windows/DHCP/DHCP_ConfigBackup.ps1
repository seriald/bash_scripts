<#
=============================================================================================
Name:           
Description:    
Version:        0.1
website:        
Script by:      Robert Fleming
Date:           
For detailed Script execution: 
============================================================================================
#>

function Get_Date {
    
    return "{0:yyyyMMdd}" -f (Get-Date)
    
}

$DHCPServer = Read-Host "Please enter DHCP Server"
$current = Get-Location
$Outfile = "$current\$(Get_Date)_DHCPExport.xml"

if (Test-Path $OutFile -PathType Leaf) {
    Write-Host "Clearing previous output file $Outfile" -ForegroundColor Red
    Write-Host ""
    del $outfile
}

$confirm = Test-Connection $DHCPServer

if ($null -like $confirm) {
    Write-Host "$dhcpserver not reachable"
    
}

Else {
    Export-DhcpServer -ComputerName "$DHCPServer" -File $outfile
    #Backup-DhcpServer -ComputerName "$DHCPServer" -File $outfile

    Write-Host "Exported $dhcpserver configuration to $outfile"
}
