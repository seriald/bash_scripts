function Install-PackageIfNeeded {

    if ($packageID -eq $null) {
        Write-Host "Package ID is required." -ForegroundColor Red
        $packageID = Read-Host "Enter the Package ID (e.g., Google.Chrome)"
    }

    Else {
        $package = winget show --id $PackageId 2>$null

        if (-not $package) {
            Write-Host "Package with ID '$PackageId' not found in winget repository." -ForegroundColor Red
            return
        }
        Else {
            $PackageName = $Package | Select-String "^Name:" | ForEach-Object { $_.Line -replace "^Name:\s*", "" }
            $DisplayName = $Package | Select-String "^Name:" | ForEach-Object { $_.Line -replace "^Name:\s*", "" }

            Write-Host "Checking if $DisplayName is installed..." -ForegroundColor White
    
            # Check if package is already installed
            $installed = winget list --exact --name $PackageName | Select-String $PackageName
    
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
    }
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting installation process..." -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "Installing Chrome..." -ForegroundColor Cyan
Install-PackageIfNeeded -PackageId "Google.Chrome"