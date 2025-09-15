# Hidden auto-commit script for GitHub contributions
# This script automatically commits daily notes to keep GitHub green

param(
    [string]$Message = "Daily coding log update",
    [string]$Author = "Coding Daily Log",
    [string]$Email = "daily-log@example.com"
)
$ErrorActionPreference = 'SilentlyContinue'

# Get today's date
$today = Get-Date -Format "yyyy-MM-dd"
$yesterday = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")

# Check if there are any changes
$gitStatus = git status --porcelain
if (-not $gitStatus) {
    # No changes, create a small commit to keep streak alive
    $tempFile = ".temp-contribution-$today.txt"
    $content = "Daily contribution - $today`nGenerated at: $(Get-Date)"
    Set-Content -Path $tempFile -Value $content -Encoding UTF8
    
    # Configure git user for this commit
    git config user.name $Author
    git config user.email $Email
    
    # Add and commit
    git add $tempFile
    git commit -m "$Message - $today" --quiet
    
    # Clean up temp file
    Remove-Item $tempFile -Force
    
    Write-Host "Auto-commit completed for $today" -ForegroundColor Green
} else {
    # There are actual changes, commit them normally
    git add .
    git commit -m "$Message - $today" --quiet
    Write-Host "Changes committed for $today" -ForegroundColor Green
}

# Push to remote if configured
$remote = git remote get-url origin 2>$null
if ($remote) {
    git push origin main --quiet 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Pushed to remote repository" -ForegroundColor Green
    }
}
