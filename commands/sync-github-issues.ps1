# Sync GitHub Issues to Jules Sessions
# Pagal Jules Documentation Example 2 (PowerShell versija)

Write-Host "Fetching open issues from GitHub..." -ForegroundColor Cyan

try {
    $issues = gh issue list --state open --limit 10 --json number,title,labels | ConvertFrom-Json
} catch {
    Write-Error "Nepavyko gauti GitHub issues. Įsitikinkite, kad esate prisijungę (gh auth login)."
    exit 1
}

if ($issues.Count -eq 0) {
    Write-Host "Atvirų užduočių nerasta." -ForegroundColor Green
    exit
}

foreach ($issue in $issues) {
    $labelNames = ($issue.labels | ForEach-Object { $_.name }) -join ", "
    $sessionName = "Issue #$($issue.number): $($issue.title) [$labelNames]"
    
    Write-Host "Creating Jules session for: $sessionName" -ForegroundColor Yellow
    
    # Inicijuojame Jules sesiją
    jules remote new --repo . --session "$sessionName"
}

Write-Host "Sinchronizacija baigta!" -ForegroundColor Green
