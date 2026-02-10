$projects = @(
    "retention-modeling-ops",
    "logistics-cost-optimization",
    "service-quality-analytics",
    "revenue-pipeline-control",
    "workforce-capacity-planning",
    "production-throughput-model",
    "inventory-margin-optimization"
)

$rootPath = "c:\Users\Mike\Documents\Python Scripts\github pages\mcam215.github.io"

foreach ($proj in $projects) {
    $fullPath = Join-Path $rootPath $proj
    Write-Host "Deploying: $proj"
    Set-Location $fullPath
    git add .
    git commit -m "Standardize documentation for v2-logistics"
    git push
    Write-Host "--------------------------------"
}

# Deploy Main Repo
Write-Host "Deploying Main Portfolio Repo"
Set-Location $rootPath
git add .
git commit -m "Launch Operations Analyst Portfolio (Root Promotion)"
git push
