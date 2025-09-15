# Setup script for automatic GitHub contributions
# This configures the repository for automatic commits

param(
    [string]$GitHubRepo = "",
    [string]$Author = "Coding Daily Log",
    [string]$Email = "daily-log@example.com"
)

Write-Host "Setting up automatic GitHub contributions..." -ForegroundColor Yellow

# Initialize git repository if not already done
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Git repository initialized" -ForegroundColor Green
}

# Configure git user
git config user.name $Author
git config user.email $Email

# Make post-commit hook executable (for Unix-like systems)
if ($IsLinux -or $IsMacOS) {
    chmod +x .git/hooks/post-commit
}

# Add remote repository if provided
if ($GitHubRepo) {
    git remote add origin $GitHubRepo
    Write-Host "Remote repository added: $GitHubRepo" -ForegroundColor Green
}

# Create initial commit if repository is empty
$commitCount = git rev-list --count HEAD 2>$null
if (-not $commitCount -or $commitCount -eq 0) {
    git add .
    git commit -m "Initial commit - Daily coding log setup"
    Write-Host "Initial commit created" -ForegroundColor Green
}

# Create a scheduled task for daily auto-commits (Windows)
if ($IsWindows) {
    $taskName = "DailyCodingLogAutoCommit"
    $scriptPath = (Resolve-Path ".auto-commit.ps1").Path
    
    # Remove existing task if it exists
    schtasks /Delete /TN $taskName /F 2>$null
    
    # Create new scheduled task
    $action = "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$scriptPath`""
    schtasks /Create /TN $taskName /TR $action /SC DAILY /ST "23:59" /F | Out-Null
    
    Write-Host "Scheduled task created for daily auto-commits" -ForegroundColor Green
    Write-Host "Task will run daily at 23:59" -ForegroundColor Cyan
}

Write-Host "`nSetup completed!" -ForegroundColor Green
Write-Host "Your GitHub contributions will now stay green automatically." -ForegroundColor Cyan
Write-Host "`nTo manually trigger auto-commit: ./.auto-commit.ps1" -ForegroundColor Yellow
