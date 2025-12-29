# Code Quality Metrics Evaluation
# Evaluates: file structure, documentation, code organization

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
# 1. File Structure Analysis
# ─────────────────────────────────────────────────────────
$allFiles = Get-ChildItem -Path $RootPath -Recurse -File -ErrorAction SilentlyContinue | 
    Where-Object { $_.FullName -notmatch '\\\.git\\|\\node_modules\\' }

$metrics.Details.TotalFiles = $allFiles.Count
$metrics.Details.FileTypes = @{}

$allFiles | Group-Object Extension | ForEach-Object {
    $ext = if ($_.Name) { $_.Name } else { "(no ext)" }
    $metrics.Details.FileTypes[$ext] = $_.Count
}

# ─────────────────────────────────────────────────────────
# 2. Documentation Coverage
# ─────────────────────────────────────────────────────────
$docFiles = $allFiles | Where-Object { $_.Extension -match '\.md$' }
$metrics.Details.DocumentationFiles = $docFiles.Count

$requiredDocs = @(
    "README.md",
    "ARCHITECTURE.md", 
    "DEVELOPMENT_GUIDE.md",
    "TODO.md",
    "GEMINI.md"
)

$foundDocs = $requiredDocs | Where-Object { 
    Test-Path (Join-Path $RootPath $_) 
}
$metrics.Details.RequiredDocsFound = $foundDocs.Count
$metrics.Details.RequiredDocsTotal = $requiredDocs.Count

# ─────────────────────────────────────────────────────────
# 3. TODO Completion Rate
# ─────────────────────────────────────────────────────────
$todoFile = Join-Path $RootPath "TODO.md"
if (Test-Path $todoFile) {
    $todoContent = Get-Content $todoFile -Raw
    $completedTasks = ([regex]::Matches($todoContent, '\[x\]')).Count
    $incompleteTasks = ([regex]::Matches($todoContent, '\[ \]')).Count
    $totalTasks = $completedTasks + $incompleteTasks
    
    $metrics.Details.TodoCompleted = $completedTasks
    $metrics.Details.TodoIncomplete = $incompleteTasks
    $metrics.Details.TodoCompletionRate = if ($totalTasks -gt 0) { 
        [math]::Round(($completedTasks / $totalTasks) * 100, 1) 
    } else { 100 }
}

# ─────────────────────────────────────────────────────────
# 4. Knowledge Base Health
# ─────────────────────────────────────────────────────────
$kbPath = Join-Path $RootPath "knowledge-base"
if (Test-Path $kbPath) {
    $kbFiles = Get-ChildItem -Path $kbPath -Recurse -File -ErrorAction SilentlyContinue
    $metrics.Details.KnowledgeBaseFiles = $kbFiles.Count
    $metrics.Details.KnowledgeBaseSize = [math]::Round(($kbFiles | Measure-Object -Property Length -Sum).Sum / 1KB, 1)
}

# ─────────────────────────────────────────────────────────
# 5. Code Organization
# ─────────────────────────────────────────────────────────
$expectedDirs = @(
    "commands",
    "extensions", 
    "knowledge-base",
    ".github"
)

$foundDirs = $expectedDirs | Where-Object { 
    Test-Path (Join-Path $RootPath $_) 
}
$metrics.Details.OrganizationScore = [math]::Round(($foundDirs.Count / $expectedDirs.Count) * 100, 1)

# ─────────────────────────────────────────────────────────
# Calculate Final Score
# ─────────────────────────────────────────────────────────
$docScore = ($metrics.Details.RequiredDocsFound / $metrics.Details.RequiredDocsTotal) * 100
$todoScore = $metrics.Details.TodoCompletionRate
$orgScore = $metrics.Details.OrganizationScore
$kbScore = [math]::Min(100, ($metrics.Details.KnowledgeBaseFiles / 10) * 100)

$metrics.Score = [math]::Round(
    ($docScore * 0.30) + 
    ($todoScore * 0.25) + 
    ($orgScore * 0.25) + 
    ($kbScore * 0.20),
    1
)

if (-not $ReturnObject) {
    Write-Host "`n📊 CODE QUALITY METRICS" -ForegroundColor Cyan
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Total Files:          $($metrics.Details.TotalFiles)"
    Write-Host "  Documentation Files:  $($metrics.Details.DocumentationFiles)"
    Write-Host "  Required Docs:        $($metrics.Details.RequiredDocsFound)/$($metrics.Details.RequiredDocsTotal)"
    Write-Host "  TODO Completion:      $($metrics.Details.TodoCompletionRate)%"
    Write-Host "  KB Files:             $($metrics.Details.KnowledgeBaseFiles) ($($metrics.Details.KnowledgeBaseSize) KB)"
    Write-Host "  Organization:         $($metrics.Details.OrganizationScore)%"
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  SCORE: $($metrics.Score)%" -ForegroundColor $(if($metrics.Score -ge 80){'Green'}elseif($metrics.Score -ge 60){'Yellow'}else{'Red'})
}

return $metrics
