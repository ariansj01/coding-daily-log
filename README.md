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
