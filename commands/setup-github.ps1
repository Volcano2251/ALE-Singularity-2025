# GitHub Setup Script
Write-Host "🚀 Pradedamas GitHub susiejimas..." -ForegroundColor Cyan

$RepoName = "Project-Singularity"

# Tikriname prisijungimą
gh auth status

Write-Host "`n1. Sukuriame repozitoriją (jei nėra)..." -ForegroundColor Yellow
gh repo create $RepoName --public --confirm 2>$null

Write-Host "2. Nustatome remote..." -ForegroundColor Yellow
$user = gh api user --template "{{.login}}"
$remoteUrl = "https://github.com/$user/$RepoName.git"
git remote remove origin 2>$null
git remote add origin $remoteUrl

Write-Host "3. Bandome įkelti failus..." -ForegroundColor Yellow
git push -u origin main --force

Write-Host "`n✅ Jei matote klaidų, vadinasi turite prisijungti per 'gh auth login'!" -ForegroundColor Green
