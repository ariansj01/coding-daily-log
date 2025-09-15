# Coding Daily Log

Archive of daily coding notes and technical experiments.

- Each note file is saved in `projects/<project-name>/YYYY-MM-DD.md` path.
- Purpose: Record experiences, code samples, and learning progress for review and presentation to teams or employers.

## Structure
```
coding-daily-log/
  projects/
    <project-name>/
      YYYY-MM-DD.md
  templates/
    daily-template.md
  New-DailyNote.ps1
```

## Quick Start
- Requirements: PowerShell 5+ (available on Windows)

1) Create a new daily note for a project:
```powershell
./New-DailyNote.ps1 -Project "project-x" -Title "Login Bug Fix" -Tags "auth,bugfix" -TimeSpent "2h" -Mood "🙂"
```

This command creates and opens the file `projects/project-x/YYYY-MM-DD.md` with template content.

Optional parameters:
- `-Title`, `-Tags`, `-TimeSpent`, `-Mood`
- For initial code sample: `-Lang` and `-Code`
- To add a link: `-Link`
- For goals: `-Goals`
- For completed tasks: `-Completed`
- For learned items: `-Learned`
- For problems: `-Problems`
- For tomorrow's plan: `-Tomorrow`
- For quick notes: `-Notes`

To open files with your preferred editor, set the `EDITOR` environment variable.

## Template
The `templates/daily-template.md` file includes the following fields that are replaced during creation:

- `{{date}}`, `{{project}}`, `{{title}}`, `{{tags}}`, `{{time_spent}}`, `{{mood}}`
- `{{lang}}`, `{{code}}`, `{{link}}`
- `{{goals}}`, `{{completed}}`, `{{learned}}`, `{{problems}}`, `{{tomorrow}}`, `{{notes}}`

You can edit the template according to your preferences.

## Auto-commit to GitHub (Optional)

To automatically keep your GitHub contribution graph green, you can set up auto-commits:

1) **Setup auto-commit system:**
```powershell
./Setup-AutoCommit.ps1 -GitHubRepo "https://github.com/yourusername/your-repo.git"
```

2) **Manual auto-commit:**
```powershell
./.auto-commit.ps1
```

**Features:**
- Automatically commits daily to keep GitHub green
- Runs in background without user interaction
- Creates scheduled task for daily commits at 23:59
- Only commits when there are actual changes
- Falls back to small commits to maintain streak

**Files created:**
- `.auto-commit.ps1` - Hidden auto-commit script
- `Setup-AutoCommit.ps1` - Setup script
- `.git/hooks/post-commit` - Git hook for automatic commits

**Note:** This is completely optional and hidden from normal usage.
