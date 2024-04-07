<#
=============================================================================================
Name:           Import Previously backed up DHCP configuration
Description:    
Version:        0.1
website:        
Script by:      Robert Fleming
Date:           20204-04-06
For detailed Script execution: 
============================================================================================
#>

function Get_Date {
    
    return "{0:yyyyMMdd}" -f (Get-Date)
    
}
$current = Get-Location
$BackupPath = "$Current\$(Get_Date)_DHCPConfig"

if ([String]::IsNullOrEmpty($inputfile)) {# If not file present in parameter
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
        InitialDirectory = [Environment]::GetFolderPath('Desktop') 
        Filter           = "CSV Files (*.csv)|*.csv|All Files (*.*)|*.*";
    }
    $null = $FileBrowser.ShowDialog()
    $inputfile = $FileBrowser.filename
    Write-Debug "File selected: $inputfile"
}


$DHCPServer = Read-Host "Please enter DHCP Server to restore $inputfile on"
$confirm = Test-Connection $DHCPServer

if ($null -like $confirm) {
    Write-Host "$dhcpserver not reachable"
    
}

Else {
   Import-DhcpServer -ComputerName $DHCPServer -file $inputfile -BackupPath $BackupPath
   
    Export-DhcpServer -ComputerName "$DHCPServer" -File $outfile
    #Backup-DhcpServer -ComputerName "$DHCPServer" -File $outfile

    Write-Host "Restored configuration on $dhcpserver with configuration file $inputfile"
    Write-Host "Configuration backed up $BackupPath"
}
