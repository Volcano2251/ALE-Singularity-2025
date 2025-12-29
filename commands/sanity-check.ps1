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

# 3. Patikriname serverio saugumą (Native Tauri)
if (Test-Path "Gemini-voice-assistant/src-tauri/src/commands.rs") {
    $rustCode = Get-Content "Gemini-voice-assistant/src-tauri/src/commands.rs" -Raw
    if ($rustCode -match "destructive_patterns") {
        Write-Host "✅ Saugumas: Rust komandų filtrai aktyvūs" -ForegroundColor Green
    } else {
        Write-Warning "⚠️ Saugumas: Filtrai nerasti Rust komandose!"
    }
} else {
    Write-Error "❌ Saugumas: commands.rs nerastas!"
}

Write-Host "🏁 Patikrinimas baigtas!" -ForegroundColor Cyan
