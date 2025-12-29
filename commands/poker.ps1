# ALE Self-Poker v2.0
$LogPath = "C:\Users\User\.gemini\X-RESEARCH-LAB\brain\POKER_LOG.txt"
$RepoInfo = Get-Content "C:\Users\User\.gemini\X-RESEARCH-LAB\REPO_INFO.txt"

Write-Host "🔥 Self-Poker v2.0 aktyvuotas. Repo: $RepoInfo" -ForegroundColor Red

while ($true) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Timestamp: [POKE] Siunčiamas impulsas..." | Out-File $LogPath -Append
    
    # Kviečiame Gemini su nurodymu naudoti teisingą repo informaciją
    Start-Process gemini -ArgumentList "`"ALE: Tęsk tyrimą X-RESEARCH-LAB. Tavo repo yra $RepoInfo. Naudok Jules užduotims atlikti.`"" -NoNewWindow -Wait
    
    Start-Sleep -Seconds 300
}