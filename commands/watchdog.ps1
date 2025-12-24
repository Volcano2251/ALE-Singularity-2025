# ALE Watchdog - Užtikrina amžiną veikimą
# Tikrina pagrindinį procesą kas 5 valandas (300 min)

$ScriptPath = "C:\Users\User\.gemini\commands\infinite-plan.ps1"
$LogPath = "C:\Users\User\.gemini\X-RESEARCH-LAB\brain\WATCHDOG_LOG.txt"

while ($true) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Tikriname, ar infinite-plan.ps1 procesas veikia
    $Running = Get-Process powershell -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*infinite-plan.ps1*" }
    
    if (-not $Running) {
        "$Timestamp: [ALARM] Pagrindinis procesas rastas negyvas. Prikeliu..." | Out-File $LogPath -Append
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File $ScriptPath" -WindowStyle Hidden
    } else {
        "$Timestamp: [OK] Sistema veikia stabiliai." | Out-File $LogPath -Append
    }

    # Laukiame 300 minučių
    Start-Sleep -Seconds (300 * 60)
}
