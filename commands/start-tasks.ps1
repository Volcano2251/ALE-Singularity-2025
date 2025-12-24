param (
    [string]$File = "TODO.md"
)

# Patikriname, ar failas egzistuoja
if (-not (Test-Path $File)) {
    Write-Error "Failas '$File' nerastas."
    exit 1
}

Write-Host "Nuskaitomos užduotys iš $File..." -ForegroundColor Cyan

# Nuskaitome ir filtruojame nebaigtas užduotis
$tasks = Get-Content $File | Where-Object { $_ -match "^- \[ \] (.+)" } | ForEach-Object { $matches[1].Trim() }

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
    # Pastaba: Čia naudojama 'jules' komanda. Įsitikinkite, kad ji pasiekiama jūsų PATH.
    # Jei norite tik simuliuoti, užkomentuokite žemiau esančią eilutę.
    Start-Process -FilePath "jules" -ArgumentList "remote", "new", "--repo", ".", "--session", "`"$task`"" -NoNewWindow -Wait
}

Write-Host "Visos sesijos inicijuotos!" -ForegroundColor Cyan
