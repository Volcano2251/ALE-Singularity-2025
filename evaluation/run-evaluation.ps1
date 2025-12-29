# Evaluation Framework - Main Runner
# Runs all evaluation modules and generates comprehensive report

param(
    [switch]$Detailed,
    [switch]$SaveReport,
    [string]$OutputPath = ".\evaluation\reports"
)

$ErrorActionPreference = "Continue"
$ScriptRoot = $PSScriptRoot

# Helper function for progress bar
function Get-ProgressBar {
    param([int]$Percentage)
    $filled = [math]::Floor($Percentage / 10)
    $empty = 10 - $filled
    return "[$('█' * $filled)$('░' * $empty)]"
}

Write-Host "`n╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║          WORKSPACE EVALUATION FRAMEWORK                      ║" -ForegroundColor Cyan
Write-Host "║          $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')                           ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

$Results = @{
    Timestamp = Get-Date -Format "o"
    CodeQuality = @{}
    Automation = @{}
    AgentPerformance = @{}
    OverallScore = 0
}

# ═══════════════════════════════════════════════════════════════
# 1. CODE QUALITY EVALUATION
# ═══════════════════════════════════════════════════════════════
Write-Host "📊 [1/3] Kodo Kokybės Vertinimas..." -ForegroundColor Yellow

$codeMetrics = & "$ScriptRoot\metrics\code-quality.ps1" -ReturnObject
$Results.CodeQuality = $codeMetrics

# ═══════════════════════════════════════════════════════════════
# 2. AUTOMATION EVALUATION
# ═══════════════════════════════════════════════════════════════
Write-Host "⚙️  [2/3] Automatizacijos Vertinimas..." -ForegroundColor Yellow

$automationMetrics = & "$ScriptRoot\metrics\automation.ps1" -ReturnObject
$Results.Automation = $automationMetrics

# ═══════════════════════════════════════════════════════════════
# 3. AGENT PERFORMANCE EVALUATION
# ═══════════════════════════════════════════════════════════════
Write-Host "🤖 [3/3] AI Agentų Našumo Vertinimas..." -ForegroundColor Yellow

$agentMetrics = & "$ScriptRoot\metrics\agent-performance.ps1" -ReturnObject
$Results.AgentPerformance = $agentMetrics

# ═══════════════════════════════════════════════════════════════
# CALCULATE OVERALL SCORE
# ═══════════════════════════════════════════════════════════════

$weights = @{
    CodeQuality = 0.35
    Automation = 0.35
    AgentPerformance = 0.30
}

$overallScore = [math]::Round(
    ($Results.CodeQuality.Score * $weights.CodeQuality) +
    ($Results.Automation.Score * $weights.Automation) +
    ($Results.AgentPerformance.Score * $weights.AgentPerformance),
    1
)

$Results.OverallScore = $overallScore

# Determine grade
$grade = switch ($overallScore) {
    { $_ -ge 90 } { "A"; break }
    { $_ -ge 75 } { "B"; break }
    { $_ -ge 60 } { "C"; break }
    default { "D" }
}

# ═══════════════════════════════════════════════════════════════
# DISPLAY RESULTS
# ═══════════════════════════════════════════════════════════════

Write-Host "`n╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                    VERTINIMO REZULTATAI                      ║" -ForegroundColor Green
Write-Host "╠══════════════════════════════════════════════════════════════╣" -ForegroundColor Green
Write-Host "║  Kodo Kokybė:        $($Results.CodeQuality.Score.ToString().PadRight(6))  $(Get-ProgressBar $Results.CodeQuality.Score)  ║" -ForegroundColor White
Write-Host "║  Automatizacija:     $($Results.Automation.Score.ToString().PadRight(6))  $(Get-ProgressBar $Results.Automation.Score)  ║" -ForegroundColor White
Write-Host "║  AI Agentai:         $($Results.AgentPerformance.Score.ToString().PadRight(6))  $(Get-ProgressBar $Results.AgentPerformance.Score)  ║" -ForegroundColor White
Write-Host "╠══════════════════════════════════════════════════════════════╣" -ForegroundColor Green
Write-Host "║  BENDRAS ĮVERTINIMAS:  $overallScore% (Grade: $grade)                      ║" -ForegroundColor $(if($grade -eq 'A'){'Green'}elseif($grade -eq 'B'){'Yellow'}else{'Red'})
Write-Host "╚══════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green

# Show recommendations
Write-Host "📋 REKOMENDACIJOS:" -ForegroundColor Cyan
if ($Results.CodeQuality.Score -lt 80) {
    Write-Host "   • Padidinti dokumentacijos apimtį" -ForegroundColor Yellow
}
if ($Results.Automation.Score -lt 80) {
    Write-Host "   • Patikrinti automatizacijos skriptų būseną" -ForegroundColor Yellow
}
if ($Results.AgentPerformance.Score -lt 80) {
    Write-Host "   • Papildyti knowledge-base naujomis žiniomis" -ForegroundColor Yellow
}
if ($overallScore -ge 80) {
    Write-Host "   ✓ Sistema veikia puikiai!" -ForegroundColor Green
}

# Save report if requested
if ($SaveReport) {
    if (-not (Test-Path $OutputPath)) {
        New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
    }
    $reportFile = Join-Path $OutputPath "eval-$(Get-Date -Format 'yyyyMMdd-HHmmss').json"
    $Results | ConvertTo-Json -Depth 10 | Set-Content $reportFile -Encoding UTF8
    Write-Host "`n📁 Raportas išsaugotas: $reportFile" -ForegroundColor Cyan
}

return $Results
