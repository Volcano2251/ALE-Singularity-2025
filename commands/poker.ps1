# ALE Self-Poker (Automatinis Pabaksnojimas)
# Šis skriptas priverčia Gemini CLI dirbti kas 5 minutes

$LogPath = "C:\Users\User\.gemini\X-RESEARCH-LAB\brain\POKER_LOG.txt"

Write-Host "🔥 Self-Poker aktyvuotas. Sistema save baksnos kas 5 minutes." -ForegroundColor Red

while ($true) {
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Pranešame loguose
    "$Timestamp: [POKE] Siunčiamas impulsas į Gemini CLI..." | Out-File $LogPath -Append
    
    # Svarbiausia dalis: Iškviečiame Gemini CLI su proaktyvia užduotimi
    # Naudojame --non-interactive režimą, jei įmanoma, arba tiesiog komandą
    Start-Process gemini -ArgumentList "`"ALE: Proaktyviai tęsk Project Singularity tyrimą. Peržiūrėk PLAN_MODDE.md, surask naują informaciją apie autonominius agentus ir atnaujink žinių bazę. NEMIŠK VARTOTOJO, tiesiog vykdyk pakeitimus.`"" -NoNewWindow -Wait
    
    "$Timestamp: [OK] Iteracija baigta. Miegu 5 minutes." | Out-File $LogPath -Append
    
    Start-Sleep -Seconds 300
}
