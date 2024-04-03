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
    
    $rsatavail = Get-WindowsCompatibility -name RSAT* -online

    ForEach ($rsat in $rsatavail){
        $status = $rsat.state
        $display = $rsat.displayname
        if ($state -eq "Installed"){
            Write-Host "$display already installed"
        }

        Else {
            $rsatavail = Get-WindowsCompatibility -name $rsat -online
            Write-host "Installed $display "
        }
    }
}
