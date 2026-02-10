# Deploy Main Portfolio Repo
Write-Host "Deploying Main Portfolio Repo" -ForegroundColor Cyan
Set-Location $rootPath
git add .
git commit -m "Portfolio Update"
git push
Write-Host "Deployment Complete" -ForegroundColor Green

# Deploy Main Repo
Write-Host "Deploying Main Portfolio Repo"
Set-Location $rootPath
git add .
git commit -m "Launch Operations Analyst Portfolio (Root Promotion)"
git push
