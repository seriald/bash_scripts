# Fixes stuck DNS server even when DHCP is being used
#

#Functions
function Get_Date {
    
    return "{0:yyyyMMdd}" -f (Get-Date)
    
}

#Variables
$KeyToBackup = "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" 
$KeyToClear = "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interface"
$current = Get-Location
$BackupPath = "$Current\Backups\$(Get_Date)_TCPKeyBackup.xml"

#Confirm Key
Write-Host "Confirming Key Exists to Export"

Test-IsRegistryKey $KeyToBackup

# Export keys and remove any binary data
Write-Host "Backup up $KeyToBackup to $BackupPath"
Export-Registry -KeyPath $KeyToBackup -ExportFormat xml -ExportPath $BackupPath -NoBinaryData

#Removing Interface key

Write-Host "Restart you system when this completes"