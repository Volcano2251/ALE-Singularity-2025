# Gemini-Jules Pipeline: Auto-Fix Audit
# Šis skriptas naudoja Gemini CLI kodui analizuoti ir perduoda rezultatus Jules taisymui.

Write-Host "🔍 Pradedama kodo analizė naudojant Gemini..." -ForegroundColor Cyan

# Atliekame auditą (pavyzdžiui, ieškome saugumo spragų arba kodo kvapų)
$auditFile = "tmp/audit_results.txt"
if (-not (Test-Path "tmp")) { New-Item -ItemType Directory -Path "tmp" }

# Gemini CLI analizė
gemini "Peržiūrėk kodo failus šiame kataloge ir surašyk 3 svarbiausias problemas, kurias reikia ištaisyti. Pateik tik problemų sąrašą, po vieną eilutėje." > $auditFile

$issues = Get-Content $auditFile | Where-Object { $_.Trim() -ne "" }

if ($issues.Count -eq 0) {
    Write-Host "✅ Problemų nerasta!" -ForegroundColor Green
    exit
}

Write-Host "⚠️ Rasta problemų: $($issues.Count)" -ForegroundColor Yellow

foreach ($issue in $issues) {
    Write-Host "🛠 Perduodama Jules taisymui: $issue" -ForegroundColor Green
    jules remote new --repo . --session "Fix: $issue"
}

Write-Host "🚀 Visos taisymo sesijos pradėtos!" -ForegroundColor Cyan
