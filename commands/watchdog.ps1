<#
.SYNOPSIS
    ALE Watchdog Service
.DESCRIPTION
    Runs an infinite loop to monitor and restart critical background processes (infinite-plan.ps1).
    Logs status to X-RESEARCH-LAB/brain/WATCHDOG_LOG.txt.
#>

$ScriptPath = "$PSScriptRoot\infinite-plan.ps1"
$LogPath = "$PSScriptRoot\..\X-RESEARCH-LAB\brain\WATCHDOG_LOG.txt"

# Ensure log directory exists
$LogDir = Split-Path $LogPath -Parent
if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
}

while ($true) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Tikriname, ar infinite-plan.ps1 procesas veikia
    $Running = Get-Process powershell -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*infinite-plan.ps1*" }
    
    if (-not $Running) {
        "${Timestamp}: [ALARM] Pagrindinis procesas rastas negyvas. Prikeliu..." | Out-File $LogPath -Append
        # Start in a new window/process
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`"" -WindowStyle Hidden
    } else {
        "${Timestamp}: [OK] Sistema veikia stabiliai." | Out-File $LogPath -Append
    }

    # Laukiame 5 minučių
    Start-Sleep -Seconds 300
}