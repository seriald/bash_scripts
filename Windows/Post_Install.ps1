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
# SOFTWARE INSTALLATION
#============================================
Write-Host ""
Write-Host "Installing selected software..." -ForegroundColor Yellow
Write-Host "This may take a while depending on your internet connection." -ForegroundColor Yellow
Write-Host ""

# Web Browsers
Write-Host "Installing Web Browsers..." -ForegroundColor Cyan
Write-Host "  - Google Chrome" -ForegroundColor White
try {
    winget install --id Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Google Chrome: $_" -ForegroundColor Red
}
Write-Host ""

# Communication
Write-Host "Installing Communication..." -ForegroundColor Cyan
Write-Host "  - Mailbird" -ForegroundColor White
try {
    winget install --id Mailbird.Mailbird -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Mailbird: $_" -ForegroundColor Red
}
Write-Host ""

# Media Players
Write-Host "Installing Media Players..." -ForegroundColor Cyan
Write-Host "  - Spotify" -ForegroundColor White
try {
    winget install --id Spotify.Spotify -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Spotify: $_" -ForegroundColor Red
}
Write-Host "  - VLC Media Player" -ForegroundColor White
try {
    winget install --id VideoLAN.VLC -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing VLC Media Player: $_" -ForegroundColor Red
}
Write-Host ""

# System Utilities
Write-Host "Installing System Utilities..." -ForegroundColor Cyan
Write-Host "  - 7-Zip" -ForegroundColor White
try {
    winget install --id 7zip.7zip -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing 7-Zip: $_" -ForegroundColor Red
}
Write-Host "  - PowerISO" -ForegroundColor White
try {
    winget install --id PowerSoftware.PowerISO -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing PowerISO: $_" -ForegroundColor Red
}

Write-Host "Installing Notepad++..." -ForegroundColor Cyan
try {
    winget install --id Notepad++.Notepad++ -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Notepad++: $_" -ForegroundColor Red
}
Write-Host ""
Write-Host "Installing Spotify..." -ForegroundColor Cyan
try {
    winget install --id Spotify.Spotify -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Spotify: $_" -ForegroundColor Red
}
Write-Host ""

Write-Host "Installing Tailscale..." -ForegroundColor Cyan
try {
    winget install --id Tailscale.Tailscale -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing Tailscale: $_" -ForegroundColor Red
}
Write-Host ""

Write-Host "Installing OpenVPN Connect..." -ForegroundColor Cyan
try {
    winget install --id OpenVPNTechnologies.OpenVPNConnect -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
} catch {
    Write-Host "Error installing OpenVPN Connect: $_" -ForegroundColor Red
}
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
} catch {
    Write-Host "Error applying classic right-click menu: $_" -ForegroundColor Red
}
Write-Host ""

# Enable Dark Mode
Write-Host "Applying: Enable Dark Mode" -ForegroundColor Blue
try {
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
} catch {
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
} catch {
    Write-Host "Error removing OneDrive: $_" -ForegroundColor Red
}
Write-Host ""

# Left align taskbar (Win11)
Write-Host "Applying: Left align taskbar (Win11)" -ForegroundColor Blue
try {
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f
} catch {
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

Read-Host "Press Enter to exit"
