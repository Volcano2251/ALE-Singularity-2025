param (
    [Parameter(Mandatory=$true)]
    [string]$TaskDescription
)

$Repo = "Volcano2251/ALE-Singularity-2025"
Write-Host "🚀 Pumping task to Jules: $TaskDescription" -ForegroundColor Magenta

# Patikriname, ar jules CLI pasiekiamas
if (!(Get-Command jules -ErrorAction SilentlyContinue)) {
    Write-Error "Jules CLI nerastas. Bandoma instaliuoti..."
    npm install -g @google/jules
}

# Paleidžiame naują sesiją
& jules remote new --repo $Repo --session "$TaskDescription"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Task successfully piped to Jules Console." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to pipe task. Check Jules configuration." -ForegroundColor Red
}
