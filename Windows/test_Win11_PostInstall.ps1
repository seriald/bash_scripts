#Requires -RunAsAdministrator

# Set console encoding to UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Windows Post-Install Script (.ps1)" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date -Format 'MM/dd/yyyy, HH:mm')" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Starting installation process..." -ForegroundColor Green
Write-Host ""

#============================================
# HELPER FUNCTION
#============================================
function Install-PackageIfNeeded {
    param(
        [string]$PackageName,
        [string]$PackageId,
        [string]$DisplayName
    )
    
    Write-Host "Checking if $DisplayName is installed..." -ForegroundColor White
    
    # Check if package is already installed
    $confirm = winget search 
    $installed = winget list --exact --name "$PackageName" 2>$null | Select-String $PackageName
    
    if ($installed) {
        Write-Host "    (Already installed, skipping...)" -ForegroundColor Gray
    }
    else {
        try {
            winget install --id $PackageId -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
            Write-Host "    ✓ Installation completed" -ForegroundColor Green
        }
        catch {
            Write-Host "    ✗ Error installing $DisplayName" -ForegroundColor Red
        }
    }
}

#============================================
# SOFTWARE INSTALLATION
#============================================
Write-Host ""
Write-Host "Installing selected software..." -ForegroundColor Yellow
Write-Host "This may take a while depending on your internet connection." -ForegroundColor Yellow
Write-Host ""

# Web Browsers
Write-Host "Installing Web Browsers..." -ForegroundColor Cyan
Install-PackageIfNeeded -PackageName "Google Chrome" -PackageId "Google.Chrome" -DisplayName "Google Chrome"
Write-Host ""

# Communication
Write-Host "Installing Communication..." -ForegroundColor Cyan
Install-PackageIfNeeded -PackageName "Mailbird" -PackageId "Mailbird.Mailbird" -DisplayName "Mailbird"
Write-Host ""

# Media Players
Write-Host "Installing Media Players..." -ForegroundColor Cyan
Install-PackageIfNeeded -PackageName "Spotify" -PackageId "Spotify.Spotify" -DisplayName "Spotify"
Write-Host ""
Install-PackageIfNeeded -PackageName "VLC Media Player" -PackageId "VideoLAN.VLC" -DisplayName "VLC Media Player"
Write-Host ""

# System Utilities
Write-Host "Installing System Utilities..." -ForegroundColor Cyan
Install-PackageIfNeeded -PackageName "7-Zip" -PackageId "7zip.7zip" -DisplayName "7-Zip"
Write-Host ""
Install-PackageIfNeeded -PackageName "PowerISO" -PackageId "PowerSoftware.PowerISO" -DisplayName "PowerISO"
Write-Host ""
Install-PackageIfNeeded -PackageName "Notepad++" -PackageId "Notepad++.Notepad++" -DisplayName "Notepad++"
Write-Host ""
Install-PackageIfNeeded -PackageName "Tailscale" -PackageId "Tailscale.Tailscale" -DisplayName "Tailscale"
Write-Host ""
Install-PackageIfNeeded -PackageName "OpenVPN Connect" -PackageId "OpenVPNTechnologies.OpenVPNConnect" -DisplayName "OpenVPN Connect"
Write-Host ""

#============================================
# SYSTEM CONFIGURATIONS
#============================================
Write-Host ""
Write-Host "Applying system configurations..." -ForegroundColor Yellow
Write-Host ""

# Classic right-click menu (Win11)
Write-Host "Applying: Classic right-click menu (Win11)" -ForegroundColor Blue
try {
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f
}
catch {
    Write-Host "Error applying classic right-click menu: $_" -ForegroundColor Red
}
Write-Host ""

# Enable Dark Mode
Write-Host "Applying: Enable Dark Mode" -ForegroundColor Blue
try {
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
}
catch {
    Write-Host "Error enabling Dark Mode: $_" -ForegroundColor Red
}
Write-Host ""

# Remove OneDrive
Write-Host "Applying: Remove OneDrive" -ForegroundColor Blue
try {
    taskkill /f /im OneDrive.exe 2>$null
    & "$env:SystemRoot\System32\OneDriveSetup.exe" /uninstall
    & "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" /uninstall
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
    reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f 2>$null
}
catch {
    Write-Host "Error removing OneDrive: $_" -ForegroundColor Red
}
Write-Host ""

# Left align taskbar (Win11)
Write-Host "Applying: Left align taskbar (Win11)" -ForegroundColor Blue
try {
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f
}
catch {
    Write-Host "Error left aligning taskbar: $_" -ForegroundColor Red
}
Write-Host ""

#============================================
# INSTALLATION COMPLETE
#============================================
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Installation Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "If any installations failed, check errors.log" -ForegroundColor Yellow
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Restart your computer if required" -ForegroundColor White
Write-Host "  2. Log into your installed applications" -ForegroundColor White
Write-Host "  3. Customize your settings as needed" -ForegroundColor White
Write-Host ""
Write-Host "Generated by Windows Post-Install Generator" -ForegroundColor Gray
Write-Host "https://github.com/kaic/win-post-install" -ForegroundColor Gray
Write-Host ""

Read-Host -Prompt "Press Enter to exit"