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
            
    $rsatavail = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

    $rsatavail
    ForEach ($rsat in $rsatavail) {
        $rsat
        
        $status = $rsat.state
        $display = $rsat.displayname

        if ($state -like "NotPresent") {
            Get-WindowsCompatibility -name $display -online | Add-WindowsCapability -Online
            Write-Host "$display installed"
        }

        If ($status -like "Installed") {
            Write-Host "$display previously installed"
        }
    }
}
