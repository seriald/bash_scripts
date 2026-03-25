function Install-PackageIfNeeded {
    param(
        [string]$PackageName,
        [string]$PackageId,
        [string]$DisplayName
    )
    
    Write-Host "Checking if $DisplayName is installed..." -ForegroundColor White
    
    # Check if package is already installed
    $installed = winget list --exact --name "$PackageName" 2>$null | Select-String $PackageName
    
    if ($installed) {
        Write-Host "    (Already installed, skipping...)" -ForegroundColor Gray
    }
    else {
        try {
            winget install --id $PackageId -e --silent --accept-package-agreements --accept-source-agreements 2>>errors.log
            Write-Host " ✓ Installation completed" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Error installing $DisplayName" -ForegroundColor Red
        }
    }
}

Install-PackageIfNeeded -PackageName "Valve Steam" -PackageId "Valve.Steam" -DisplayName "Steam"