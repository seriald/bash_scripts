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

#Functions

function Package_Install {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PackageId,
        
        [string]$DisplayName
    )

    Write-Host "Package ID: $PackageId" -ForegroundColor Cyan
    # If no display name provided, use the package ID
    if (-not $DisplayName) {

        $packages = winget search --id $PackageID --source winget --accept-source-agreements |
        ForEach-Object {
            # Skip header/separator lines
            if ($_ -match '^\s*Name\s+Id\s+Version') { return }
            if ($_ -match '^-+$') { return }

            # Split columns by 2+ spaces
            $cols = ($_ -split '\s{2,}') -ne ''
            if ($cols.Count -ge 2) {
                [PSCustomObject]@{
                    Name    = $cols[0]
                    Id      = $cols[1]
                    Version = if ($cols.Count -ge 3) { $cols[2] } else { $null }
                }
            }
        }

        Write-Host "Found packages matching '$PackageID':" -ForegroundColor Cyan
        $Packages | Format-Table -AutoSize
    
        ForEach ($Pack in $Packages) {
            if ($Pack.ID -eq $PackageID) {
                $DisplayName = $Pack.Name
                $PackageId = $Pack.ID
            } 
        }
    }
    
    Write-Host "Checking if $DisplayName is installed..." -ForegroundColor Cyan
    
    # Check if package is already installed using winget list
    $installed = winget list --id $PackageId 2>$null | Select-String $PackageId
    
    if ($installed) {
        Write-Host "    (Already installed, skipping...)" -ForegroundColor Gray
    }

    else {
        Write-Host "    Installing $DisplayName..." -ForegroundColor Yellow
        try {
            winget install --id $PackageId -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
            Write-Host "    ✓ Installation completed" -ForegroundColor Green
        }
        catch {
            Write-Host "    ✗ Error installing $DisplayName : $_" -ForegroundColor Red
        }
    }

    Write-Host ""
}

#Variables

#Core

Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting installation process..." -ForegroundColor Cyan
Write-Host "Verify that packages installed correctly..." -ForegroundColor Cyan
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan



Write-Host "Installing Chrome..." -ForegroundColor Cyan
Package_Install Google.Chrome
Write-Host ""

Write-Host "Installing Mailbird..." -ForegroundColor Cyan
Package_Install Mailbird.Mailbird
Write-Host ""

Write-Host "Installing Firefox..." -ForegroundColor Cyan
Package_Install Mozilla.Firefox
Write-Host ""

Write-Host "Installing Spotify..." -ForegroundColor Cyan
Package_Install Spotify.Spotify
Write-Host ""

Write-Host "Installing VLC Media Player..." -ForegroundColor Cyan
Package_Install VideoLAN.VLC
Write-Host ""

Write-Host "Installing 7-Zip..." -ForegroundColor Cyan
Package_Install 7zip.7zip
Write-Host ""

Write-Host "Installing Notepad++..." -ForegroundColor Cyan
Package_Install Notepad++.Notepad++
Write-Host ""

Write-Host "Installing VS Code..." -ForegroundColor Cyan
Package_Install Microsoft.VisualStudioCode
Write-Host ""

Write-Host "Installing Git..." -ForegroundColor Cyan
Package_Install Git.Git
Write-Host ""

Write-Host "Installing Tailscale..." -ForegroundColor Cyan
Package_Install Tailscale.Tailscale
Write-Host ""

Write-Host "Installing OpenVPN Connect..." -ForegroundColor Cyan
Package_Install OpenVPNTechnologies.OpenVPNConnect
Write-Host ""


