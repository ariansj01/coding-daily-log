Param(
    [Parameter(Mandatory=$true)]
    [string]$Project,
    
    [string]$Title = "Daily Note",
    [string]$Tags = "daily,code",
    [string]$TimeSpent = "",
    [string]$Mood = "",
    [string]$Lang = "",
    [string]$Code = "",
    [string]$Link = "",
    [string]$Goals = "",
    [string]$Completed = "",
    [string]$Learned = "",
    [string]$Problems = "",
    [string]$Tomorrow = "",
    [string]$Notes = ""
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$templatePath = Join-Path $root 'templates/daily-template.md'

if (-not (Test-Path $templatePath)) {
    Write-Error "Template not found: $templatePath"
}

$date = (Get-Date).ToString('yyyy-MM-dd')
$projectDir = Join-Path $root (Join-Path 'projects' $Project)
New-Item -ItemType Directory -Path $projectDir -Force | Out-Null

$destPath = Join-Path $projectDir ("$date.md")

if (Test-Path $destPath) {
    Write-Host "Today's file already exists: $destPath"
} else {
    $content = Get-Content $templatePath -Raw
    $map = @{
        '{{date}}'       = $date
        '{{project}}'    = $Project
        '{{title}}'      = $Title
        '{{tags}}'       = $Tags
        '{{time_spent}}' = $TimeSpent
        '{{mood}}'       = $Mood
        '{{lang}}'       = $Lang
        '{{code}}'       = $Code
        '{{link}}'       = $Link
        '{{goals}}'      = $Goals
        '{{completed}}'  = $Completed
        '{{learned}}'    = $Learned
        '{{problems}}'   = $Problems
        '{{tomorrow}}'   = $Tomorrow
        '{{notes}}'      = $Notes
    }

    foreach ($k in $map.Keys) {
        $content = $content.Replace($k, $map[$k])
    }

    Set-Content -LiteralPath $destPath -Value $content -Encoding UTF8
    Write-Host "Note created: $destPath"
}

if ($env:EDITOR) {
    & $env:EDITOR $destPath
} else {
    if ($IsWindows) { Start-Process -FilePath $destPath }
}


