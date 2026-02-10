$repoMap = @{
    "retention-modeling-ops"        = "https://github.com/michaelcampbell215/bank-churn-predictive-repo.git"
    "logistics-cost-optimization"   = "https://github.com/michaelcampbell215/supply-chain-performance-repo.git"
    "service-quality-analytics"     = "https://github.com/michaelcampbell215/passenger-satisfaction-repo.git"
    "revenue-pipeline-control"      = "https://github.com/michaelcampbell215/crm-dashboard-repo.git"
    "workforce-capacity-planning"   = "https://github.com/michaelcampbell215/hr-survey-analysis-repo.git"
    "production-throughput-model"   = "https://github.com/michaelcampbell215/manufacturing-line-productivity-analysis.git"
    "inventory-margin-optimization" = "https://github.com/michaelcampbell215/Restaurant-Analysis.git"
}

$rootPath = Get-Location

foreach ($folder in $repoMap.Keys) {
    $repoUrl = $repoMap[$folder]
    Write-Host "Syncing $folder to $repoUrl..." -ForegroundColor Cyan

    $tempDir = "temp_sync_$folder"
    if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }

    # Clone the original repo
    git clone $repoUrl $tempDir
    
    if (-not (Test-Path $tempDir)) {
        Write-Host "Failed to clone $repoUrl. Skipping..." -ForegroundColor Red
        continue
    }

    # Copy new files from local portfolio folder to the temp repo (overwrite)
    Copy-Item -Path "$folder\*" -Destination $tempDir -Recurse -Force

    # Push changes
    Push-Location $tempDir
    git add .
    git commit -m "Sync with Portfolio: Updated branding and documentation"
    git push
    Pop-Location

    # Cleanup
    Remove-Item $tempDir -Recurse -Force
    Write-Host "Completed $folder" -ForegroundColor Green
    Write-Host "--------------------------------"
}
