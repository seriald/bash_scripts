<#
=============================================================================================
Name:           Backup_DNSZone.ps1
Description:    Exports DNS Zone to CSV
Version:        1.0
website:        
Script by:      Robert Fleming
Date:           2026-03-19
For detailed Script execution: 
============================================================================================
#>

#Functions
function Get_Date {
    
  return "{0:yyyyMMdd}" -f (Get-Date)
    
}

function Get_TimeStamp {
    
Get-Date -Format "yyyyMMdd_HHmmss"
}

#Variables

$Server = "picklerick.vitori.org"
$ExportPath = "\\nas01.vitori.org\docs\robert\docs\Configs\DNSBackups\"

#Core

$admincheck = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

If ($admincheck -like "false") {

  Write-Host "Run from Administrator Console" -ForegroundColor Red
}

Else {

  $Zones = Get-DnsServerZone | Where-Object { ($_.ZoneName -notlike "*arpa*") -and ($_.ZoneName -notlike "*msdcs*") -and ($_.ZoneName -notlike "*TrustAnchors*") } | Select-Object -ExpandProperty ZoneName

  ForEach ($Zone in $Zones) {
    $Outfolder = "c:\windows\system32\dns" 
    $Outfile = "$(Get_TimeStamp)_$Zone"

    if (Test-Path "$OutFolder\$Outfile" -PathType Leaf) {
      Write-Host "Clearing previous output file $Outfile" -ForegroundColor Red
      Write-Host ""
      Remove-Item $OutFolder\$Outfile
    }

    Export-DnsServerZone -Name $Zone -FileName "$Outfile"

  }

  copy-item "$OutFolder\$Outfile" "$ExportPath\$Outfile"
  Write-Host "Exporting results to $ExportPath\$Outfile" -ForegroundColor Cyan

}