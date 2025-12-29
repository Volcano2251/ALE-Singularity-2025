# Agent Performance Metrics Evaluation
# Evaluates: AI agent effectiveness, knowledge utilization, task delegation

param(
    [switch]$ReturnObject
)

$ErrorActionPreference = "Continue"
$RootPath = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

$metrics = @{
    Score = 0
    Details = @{}
}

# ─────────────────────────────────────────────────────────
# 1. Knowledge Base Utilization
# ─────────────────────────────────────────────────────────
$kbPath = Join-Path $RootPath "knowledge-base"
if (Test-Path $kbPath) {
    $kbStructure = @{
        "best-practices" = @{ Required = $true; Weight = 35 }
        "documentation" = @{ Required = $true; Weight = 25 }
        "prompts" = @{ Required = $false; Weight = 20 }
        "scientific-articles" = @{ Required = $false; Weight = 20 }
    }
    
    $kbScore = 0
    $kbDetails = @()
    
    foreach ($folder in $kbStructure.Keys) {
        $folderPath = Join-Path $kbPath $folder
        $exists = Test-Path $folderPath
        $fileCount = 0
        
        if ($exists) {
            $files = Get-ChildItem -Path $folderPath -File -Recurse -ErrorAction SilentlyContinue
            $fileCount = $files.Count
            if ($fileCount -gt 0) {
                $kbScore += $kbStructure[$folder].Weight
            } elseif ($kbStructure[$folder].Required) {
                $kbScore += $kbStructure[$folder].Weight * 0.3
            }
        }
        
        $kbDetails += @{
            Folder = $folder
            Exists = $exists
            FileCount = $fileCount
            Required = $kbStructure[$folder].Required
        }
    }
    
    $metrics.Details.KnowledgeBase = $kbDetails
    $metrics.Details.KnowledgeBaseScore = $kbScore
    
    # Check INDEX.md
    $indexPath = Join-Path $kbPath "INDEX.md"
    $metrics.Details.HasKBIndex = Test-Path $indexPath
}

# ─────────────────────────────────────────────────────────
# 2. GEMINI.md Configuration Quality
# ─────────────────────────────────────────────────────────
$geminiPath = Join-Path $RootPath "GEMINI.md"
if (Test-Path $geminiPath) {
    $geminiContent = Get-Content $geminiPath -Raw
    $geminiMetrics = @{
        HasRoleDefinition = $geminiContent -match '(?i)role|persona|assistant'
        HasLanguageStrategy = $geminiContent -match '(?i)language|lithuanian|lietuvių'
        HasAgentStrategy = $geminiContent -match '(?i)agent|jules|proactive'
        HasResearchSection = $geminiContent -match '(?i)research|knowledge'
        ContentLength = $geminiContent.Length
    }
    
    $geminiScore = 0
    if ($geminiMetrics.HasRoleDefinition) { $geminiScore += 25 }
    if ($geminiMetrics.HasLanguageStrategy) { $geminiScore += 25 }
    if ($geminiMetrics.HasAgentStrategy) { $geminiScore += 25 }
    if ($geminiMetrics.HasResearchSection) { $geminiScore += 15 }
    if ($geminiMetrics.ContentLength -gt 500) { $geminiScore += 10 }
    
    $metrics.Details.GeminiConfig = $geminiMetrics
    $metrics.Details.GeminiConfigScore = $geminiScore
} else {
    $metrics.Details.GeminiConfigScore = 0
}

# ─────────────────────────────────────────────────────────
# 3. History & Session Analysis
# ─────────────────────────────────────────────────────────
$historyPath = Join-Path $RootPath "history"
if (Test-Path $historyPath) {
    $historyFiles = Get-ChildItem -Path $historyPath -File -ErrorAction SilentlyContinue
    $metrics.Details.HistoryEntries = $historyFiles.Count
    
    # Analyze recent activity (files modified in last 7 days)
    $recentFiles = $historyFiles | Where-Object { 
        $_.LastWriteTime -gt (Get-Date).AddDays(-7) 
    }
    $metrics.Details.RecentHistoryEntries = $recentFiles.Count
} else {
    $metrics.Details.HistoryEntries = 0
    $metrics.Details.RecentHistoryEntries = 0
}

# ─────────────────────────────────────────────────────────
# 4. Delegation Infrastructure
# ─────────────────────────────────────────────────────────
$delegationFiles = @(
    "commands\delegate.ps1",
    "commands\jules-pipe.ps1",
    "commands\start-tasks.ps1"
)

$foundDelegation = $delegationFiles | Where-Object {
    Test-Path (Join-Path $RootPath $_)
}
$metrics.Details.DelegationInfrastructure = $foundDelegation.Count
$metrics.Details.DelegationTotal = $delegationFiles.Count
$metrics.Details.DelegationScore = [math]::Round(
    ($foundDelegation.Count / $delegationFiles.Count) * 100, 1
)

# ─────────────────────────────────────────────────────────
# 5. Extension Capabilities
# ─────────────────────────────────────────────────────────
$extensionsPath = Join-Path $RootPath "extensions"
if (Test-Path $extensionsPath) {
    $agentExtensions = Get-ChildItem -Path $extensionsPath -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match 'jules|agent|ai|code-review' }
    $metrics.Details.AgentExtensions = $agentExtensions.Count
    $metrics.Details.ExtensionNames = $agentExtensions.Name
} else {
    $metrics.Details.AgentExtensions = 0
}

# ─────────────────────────────────────────────────────────
# Calculate Final Score
# ─────────────────────────────────────────────────────────
$kbScore = $metrics.Details.KnowledgeBaseScore
$geminiScore = $metrics.Details.GeminiConfigScore
$historyScore = [math]::Min(100, ($metrics.Details.HistoryEntries / 20) * 100)
$delegationScore = $metrics.Details.DelegationScore
$extensionScore = [math]::Min(100, $metrics.Details.AgentExtensions * 33)

$metrics.Score = [math]::Round(
    ($kbScore * 0.30) + 
    ($geminiScore * 0.25) + 
    ($delegationScore * 0.25) + 
    ($historyScore * 0.10) + 
    ($extensionScore * 0.10),
    1
)

if (-not $ReturnObject) {
    Write-Host "`n🤖 AGENT PERFORMANCE METRICS" -ForegroundColor Cyan
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Knowledge Base:       $($metrics.Details.KnowledgeBaseScore)%"
    Write-Host "  GEMINI.md Config:     $($metrics.Details.GeminiConfigScore)%"
    Write-Host "  History Entries:      $($metrics.Details.HistoryEntries)"
    Write-Host "  Delegation Scripts:   $($metrics.Details.DelegationInfrastructure)/$($metrics.Details.DelegationTotal)"
    Write-Host "  Agent Extensions:     $($metrics.Details.AgentExtensions)"
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  SCORE: $($metrics.Score)%" -ForegroundColor $(if($metrics.Score -ge 80){'Green'}elseif($metrics.Score -ge 60){'Yellow'}else{'Red'})
}

return $metrics
