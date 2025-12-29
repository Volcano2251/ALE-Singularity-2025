# ALE Perpetual Engine v2.0 (High-Autonomy & Resource Guard)

param (
    [string]$LabPath = "X-RESEARCH-LAB",
    [int]$CheckIntervalSeconds = 3600 # 1 valanda
)

Write-Host "♾️ ALE Perpetual Engine Paleistas..." -ForegroundColor Cyan
$Iteration = 1

while ($true) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$Timestamp] Iteracija $Iteration prasideda..." -ForegroundColor Yellow

    # --- 1. SVEIKATOS PATIKRA (Resource Guard) ---
    $Mem = Get-Process | Measure-Object -Property WorkingSet -Sum
    $RAM_GB = [Math]::Round($Mem.Sum / 1GB, 2)
    $Disk = Get-PSDrive C | Select-Object Free, Used
    $DiskFree_GB = [Math]::Round($Disk.Free / 1GB, 2)

    $HealthReport = @{
        timestamp = $Timestamp
        iteration = $Iteration
        ram_usage_gb = $RAM_GB
        disk_free_gb = $DiskFree_GB
        status = "Healthy"
    }

    # Jei RAM viršija 90% (pavyzdžiui, jei turite 16GB, galime riboti ties 14GB)
    if ($RAM_GB -gt 14) {
        Write-Warning "⚠️ RAM UŽSIPILDĖ ($RAM_GB GB). Valomi procesai..."
        $HealthReport.status = "Critical_RAM"
        [System.GC]::Collect()
    }

    $HealthReport | ConvertTo-Json | Out-File "$LabPath/brain/HEALTH_LOG.json" -Append

    # --- 2. UŽDUOTIES DELEGAVIMAS JULES AGENTUI ---
    $RepoURL = git config --get remote.origin.url
    # Extract repo name (e.g., username/repo from https://github.com/username/repo.git)
    if ($RepoURL -match "github\.com[:/](.+?)(?:\.git)?$") {
        $RepoName = $matches[1]
    } else {
        $RepoName = "unknown/repo"
        Write-Warning "Nepavyko nustatyti Git repo pavadinimo. Naudojama: $RepoName"
    }

    $Task = @"
Atlik AI evoliucijos ciklą:
1. Perskaityk CORE_ALGORITHM.md ir PROMPT_OPTIMIZER.md.
2. Ištirk naujausias 'Agent Skills' praktikas (Anthropic/OpenAI).
3. Rask bent vieną klaidą savo praeitame darbe (žr. ERROR_JOURNAL.md).
4. Pataisyk save: Atnaujink PROMPT_OPTIMIZER.md su geresnėmis instrukcijomis.
"@

    Write-Host "🤖 Deleguojama užduotis Jules agentui ($RepoName)..." -ForegroundColor Green
    # Paleidžiame Jules sesiją (koreguota sintaksė)
    # Pastaba: Jules gali reikalauti, kad --session būtų tik pavadinimas, o užduotis būtų perduota kitaip arba interaktyviai.
    # Čia naudojame paprastą formatą, tikėdamiesi, kad Jules priims argumentus.
    jules remote new --repo $RepoName --session "ALE-Iteration-$Iteration: $Task"

    # --- 3. LAUKIMO CIKLAS ---
    Write-Host "💤 Iteracija baigta. Kita patikra po 1 valandos..." -ForegroundColor Gray
    $Iteration++
    Start-Sleep -Seconds $CheckIntervalSeconds
}