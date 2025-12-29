param (
    [string]$File = "TODO.md"
)

# Patikriname, ar failas egzistuoja
if (-not (Test-Path $File)) {
    Write-Error "Failas '$File' nerastas."
    exit 1
}

Write-Host "Nuskaitomos užduotys iš $File..." -ForegroundColor Cyan

# Nuskaitome ir filtruojame nebaigtas užduotis (palaikome - [ ] ir 1. [ ] formatus)
$tasks = Get-Content $File | Where-Object { $_ -match "^(?:-|\d+\.) \[ \] (.+)" } | ForEach-Object { $matches[1].Trim() }

if ($tasks.Count -eq 0) {
    Write-Warning "Nebaigtų užduočių nerasta."
    exit
}

Write-Host "Rastos $($tasks.Count) užduotys:" -ForegroundColor Yellow
$tasks | ForEach-Object { Write-Host " - $_" }

# AUTONOMOUS MODE: No confirmation required per user preference.
Write-Host "Vykdomas automatinis paleidimas (Autonomous Mode)..." -ForegroundColor Magenta

# Paleidžiame sesijas
foreach ($task in $tasks) {
    Write-Host "Paleidžiama sesija: '$task'..." -ForegroundColor Green
    # Naudojame konkretų repo pavadinimą
    & jules remote new --repo "Volcano2251/ALE-Singularity-2025" --session "$task"
}

Write-Host "Visos sesijos inicijuotos!" -ForegroundColor Cyan
