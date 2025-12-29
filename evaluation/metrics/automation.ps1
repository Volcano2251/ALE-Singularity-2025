# Automation Metrics Evaluation
# Evaluates: scripts health, integrations, pipeline status

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
# 1. PowerShell Scripts Analysis
# ─────────────────────────────────────────────────────────
$commandsPath = Join-Path $RootPath "commands"
if (Test-Path $commandsPath) {
    $scripts = Get-ChildItem -Path $commandsPath -Filter "*.ps1" -ErrorAction SilentlyContinue
    $metrics.Details.TotalScripts = $scripts.Count
    
    $validScripts = 0
    $scriptDetails = @()
    
    foreach ($script in $scripts) {
        $content = Get-Content $script.FullName -Raw -ErrorAction SilentlyContinue
        $hasParams = $content -match 'param\s*\('
        $hasErrorHandling = $content -match '\$ErrorActionPreference|\$Error|try\s*\{'
        $hasComments = $content -match '^#' -or $content -match '<#'
        
        $scriptHealth = 0
        if ($hasParams) { $scriptHealth += 30 }
        if ($hasErrorHandling) { $scriptHealth += 40 }
        if ($hasComments) { $scriptHealth += 30 }
        
        if ($scriptHealth -ge 60) { $validScripts++ }
        
        $scriptDetails += @{
            Name = $script.Name
            Health = $scriptHealth
            HasParams = $hasParams
            HasErrorHandling = $hasErrorHandling
            HasComments = $hasComments
        }
    }
    
    $metrics.Details.ValidScripts = $validScripts
    $metrics.Details.ScriptDetails = $scriptDetails
    $metrics.Details.ScriptHealthRate = if ($scripts.Count -gt 0) { 
        [math]::Round(($validScripts / $scripts.Count) * 100, 1) 
    } else { 0 }
}

# ─────────────────────────────────────────────────────────
# 2. GitHub Integration
# ─────────────────────────────────────────────────────────
$githubPath = Join-Path $RootPath ".github"
$metrics.Details.HasGitHub = Test-Path $githubPath

$workflowsPath = Join-Path $githubPath "workflows"
if (Test-Path $workflowsPath) {
    $workflows = Get-ChildItem -Path $workflowsPath -Filter "*.yml" -ErrorAction SilentlyContinue
    $metrics.Details.WorkflowCount = $workflows.Count
} else {
    $metrics.Details.WorkflowCount = 0
}

# Check for GitHub CLI availability
$ghAvailable = $null -ne (Get-Command "gh" -ErrorAction SilentlyContinue)
$metrics.Details.GitHubCLIAvailable = $ghAvailable

# ─────────────────────────────────────────────────────────
# 3. Extensions Analysis
# ─────────────────────────────────────────────────────────
$extensionsPath = Join-Path $RootPath "extensions"
if (Test-Path $extensionsPath) {
    $extensions = Get-ChildItem -Path $extensionsPath -Directory -ErrorAction SilentlyContinue
    $metrics.Details.ExtensionCount = $extensions.Count
    $metrics.Details.Extensions = $extensions.Name
} else {
    $metrics.Details.ExtensionCount = 0
}

# ─────────────────────────────────────────────────────────
# 4. Configuration Files
# ─────────────────────────────────────────────────────────
$configFiles = @(
    "package.json",
    ".gitignore",
    "settings.json"
)

$foundConfigs = $configFiles | Where-Object {
    Test-Path (Join-Path $RootPath $_)
}
$metrics.Details.ConfigFilesFound = $foundConfigs.Count
$metrics.Details.ConfigFilesTotal = $configFiles.Count

# Check for TOML configs in commands
$tomlConfigs = Get-ChildItem -Path $commandsPath -Filter "*.toml" -ErrorAction SilentlyContinue
$metrics.Details.TomlConfigsCount = $tomlConfigs.Count

# ─────────────────────────────────────────────────────────
# 5. Git Health
# ─────────────────────────────────────────────────────────
$gitPath = Join-Path $RootPath ".git"
$metrics.Details.HasGit = Test-Path $gitPath

if ($metrics.Details.HasGit) {
    try {
        Push-Location $RootPath
        $branchCount = (git branch -a 2>$null | Measure-Object).Count
        $metrics.Details.GitBranches = $branchCount
        $hasRemote = (git remote -v 2>$null | Measure-Object).Count -gt 0
        $metrics.Details.HasRemote = $hasRemote
        Pop-Location
    } catch {
        $metrics.Details.GitBranches = 0
        $metrics.Details.HasRemote = $false
    }
}

# ─────────────────────────────────────────────────────────
# Calculate Final Score
# ─────────────────────────────────────────────────────────
$scriptScore = $metrics.Details.ScriptHealthRate
$githubScore = if ($metrics.Details.HasGitHub -and $metrics.Details.WorkflowCount -gt 0) { 100 } 
               elseif ($metrics.Details.HasGitHub) { 60 } 
               else { 0 }
$extensionScore = [math]::Min(100, $metrics.Details.ExtensionCount * 25)
$configScore = ($metrics.Details.ConfigFilesFound / $metrics.Details.ConfigFilesTotal) * 100
$gitScore = if ($metrics.Details.HasGit -and $metrics.Details.HasRemote) { 100 } 
            elseif ($metrics.Details.HasGit) { 70 } 
            else { 0 }

$metrics.Score = [math]::Round(
    ($scriptScore * 0.30) + 
    ($githubScore * 0.25) + 
    ($extensionScore * 0.15) + 
    ($configScore * 0.15) + 
    ($gitScore * 0.15),
    1
)

if (-not $ReturnObject) {
    Write-Host "`n⚙️  AUTOMATION METRICS" -ForegroundColor Cyan
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  Total Scripts:        $($metrics.Details.TotalScripts)"
    Write-Host "  Valid Scripts:        $($metrics.Details.ValidScripts)"
    Write-Host "  Script Health:        $($metrics.Details.ScriptHealthRate)%"
    Write-Host "  GitHub Workflows:     $($metrics.Details.WorkflowCount)"
    Write-Host "  Extensions:           $($metrics.Details.ExtensionCount)"
    Write-Host "  Git Remote:           $($metrics.Details.HasRemote)"
    Write-Host "─────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host "  SCORE: $($metrics.Score)%" -ForegroundColor $(if($metrics.Score -ge 80){'Green'}elseif($metrics.Score -ge 60){'Yellow'}else{'Red'})
}

return $metrics
