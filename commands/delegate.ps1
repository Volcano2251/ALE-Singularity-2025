<#
.SYNOPSIS
    Gemini -> Jules Delegation Pipeline
.DESCRIPTION
    Takes a task description, detects the current git repository, and initiates a remote Jules session.
.PARAMETER Task
    The description of the task to delegate.
.EXAMPLE
    ./delegate.ps1 "Refactor the authentication module"
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$Task
)

# 1. Get Repo Name
$RepoURL = git config --get remote.origin.url
if ($RepoURL -match "github\.com[:/](.+?)(?:\.git)?$") {
    $RepoName = $matches[1]
} else {
    Write-Error "❌ Could not detect GitHub repository. Are you in a git repo?"
    exit 1
}

# 2. Generate Session Name
$SessionID = "Task-" + (Get-Date -Format "MMdd-HHmm")
$FullTask = "[Gemini Delegate] $Task"

Write-Host "🚀 Delegating to Jules..." -ForegroundColor Cyan
Write-Host "   Repo: $RepoName" -ForegroundColor Gray
Write-Host "   Task: $Task" -ForegroundColor Gray

# 3. Execute Jules
# Note: Using Start-Process to handle output streams better if needed, 
# but direct call is simpler for now to capture stdout.

try {
    # Check if jules is installed
    $JulesCheck = Get-Command jules -ErrorAction SilentlyContinue
    if (-not $JulesCheck) {
        throw "Jules CLI is not installed. Run 'npm install -g @google/jules'"
    }

    # Execute
    # Corrected Syntax: --session holds the task description
    jules remote new --repo $RepoName --session "$FullTask"
    
    Write-Host "✅ Delegation Complete!" -ForegroundColor Green
    Write-Host "👉 Check status: jules remote list" -ForegroundColor Yellow
} catch {
    Write-Error "❌ Delegation Failed: $_"
}
