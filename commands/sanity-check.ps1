# Sanity Check Script
Write-Host "🚀 Pradedamas sistemos patikrinimas..." -ForegroundColor Cyan

# 1. Patikriname struktūrą
if (Test-Path "Gemini-voice-assistant/src/App.tsx") {
    Write-Host "✅ Struktūra: Teisinga (src/App.tsx egzistuoja)" -ForegroundColor Green
} else {
    Write-Error "❌ Struktūra: Klaida (src/App.tsx nerastas)"
}

# 2. Patikriname konfigūracijas
if (Test-Path "Gemini-voice-assistant/.eslintrc.json") {
    Write-Host "✅ Standartai: ESLint konfigūracija paruošta" -ForegroundColor Green
}

# 3. Patikriname serverio saugumą
$serverCode = Get-Content "Gemini-voice-assistant/server.js" -Raw
if ($serverCode -match "destructivePatterns") {
    Write-Host "✅ Saugumas: Serverio filtrai aktyvūs" -ForegroundColor Green
} else {
    Write-Warning "⚠️ Saugumas: Filtrai nerasti server.js faile!"
}

Write-Host "🏁 Patikrinimas baigtas!" -ForegroundColor Cyan
