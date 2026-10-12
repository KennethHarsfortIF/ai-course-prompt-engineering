# PowerPoint Input: Reset the AdventureWorks DuckDB

Create a practical instructional slide deck for developers explaining how to reset the DuckDB database in this repository with `Reset-DuckDb.ps1`. Include concise presenter notes on every slide. Use the script source and repository instructions below as the source of truth; do not invent behavior or claim the reset was run.

## Audience and Purpose

Assume the audience can run PowerShell commands and has access to this repository, but may not know how the dbt project builds its DuckDB database. Explain the procedure in a calm, operational style. Make the destructive effect prominent before showing the command. Use a small process diagram for the script lifecycle and keep commands legible and copyable.

## Slide Sequence

1. **Title and use case:** “Reset the AdventureWorks DuckDB.” Explain that the script deletes the project's generated DuckDB database and rebuilds it from the dbt seeds and models. This is a reset, not a backup or migration.
2. **Before you begin:** Tell the user to close all DuckDB connections, activate the repository's Python virtual environment, and ensure `dbt` is available on `PATH`. Identify the target as `dbt-dimensional-modelling/adventureworks/target/adventureworks.duckdb`.
3. **Understand the consequence:** Clearly warn that the existing database and its WAL file are deleted, so all database data and custom objects in that database are lost. This script does not preserve them. Tell users to back up anything they need before proceeding.
4. **Preview safely:** From the repository root, show the exact command:

   ```powershell
   .\dbt-dimensional-modelling\adventureworks\Reset-DuckDb.ps1 -WhatIf
   ```

   Explain that `-WhatIf` previews the script's delete-and-rebuild action without performing it. Do not imply the database was inspected or changed.
5. **Run the reset:** From the repository root, show the exact command:

   ```powershell
   .\dbt-dimensional-modelling\adventureworks\Reset-DuckDb.ps1
   ```

   Explain that the script can also be invoked from another working directory if the user supplies the correct path. By default, PowerShell asks for confirmation because the script declares a high-impact `ShouldProcess` operation. The user should approve only after reviewing the target and data-loss warning. Mention `-Confirm:$false` only as an automation option, not the normal interactive workflow.
6. **What the script does:** Draw this ordered flow and explain each stage: resolve its own project directory; request approval; locate `dbt`; run `dbt deps`; only if dependencies succeed, delete `target/adventureworks.duckdb` and `target/adventureworks.duckdb.wal` if present; run `dbt seed --full-refresh` for target `duckdb`; run `dbt run --full-refresh` for target `duckdb`; report completion.
7. **Failures and verification:** Explain that if `dbt deps` fails, the script stops before deleting the existing database. If seeding or running fails, the reset is incomplete; the script does not roll back or restore the deleted database. Ask users to inspect the actual PowerShell/dbt error output and resolve it before relying on the database. A completion message is printed only after both seed and run succeed. Do not claim any command was executed in creating this presentation.
8. **Quick checklist:** Summarize: close connections; activate the environment; preview with `-WhatIf`; understand data loss; run the script and approve; wait for the actual completion message; investigate failures rather than assuming success.

## Accuracy Requirements

- Use the exact script path and command examples below.
- State that the script works relative to its own location (`$PSScriptRoot`) and passes that project directory as both `--project-dir` and `--profiles-dir` to dbt.
- Explain that dependency installation happens before database deletion, while seed and model rebuilding happen afterward.
- Distinguish a `dbt deps` failure (database not deleted by this script) from a seed or run failure (reset incomplete and no automatic rollback).
- Describe `-WhatIf` as a preview only. Do not tell users it verifies the database contents or environment.
- Do not describe the operation as harmless, reversible, or a backup. Do not omit the data-loss warning.
- Do not invent command output, successful execution, or a resulting database state.

## Script Source

Source: `dbt-dimensional-modelling/adventureworks/Reset-DuckDb.ps1`.

```powershell
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param()

$ErrorActionPreference = 'Stop'
$projectDirectory = $PSScriptRoot
$databasePath = Join-Path $projectDirectory 'target\adventureworks.duckdb'

if (-not $PSCmdlet.ShouldProcess($databasePath, 'Delete the database and rebuild all seeds and models')) {
    return
}

$dbtCommand = Get-Command dbt -CommandType Application -ErrorAction Stop

Push-Location $projectDirectory
try {
    & $dbtCommand.Source deps --project-dir $projectDirectory --profiles-dir $projectDirectory
    if ($LASTEXITCODE -ne 0) {
        throw "dbt deps failed (exit code $LASTEXITCODE). The database has not been deleted."
    }

    foreach ($filePath in @($databasePath, "$databasePath.wal")) {
        if (Test-Path -LiteralPath $filePath) {
            Remove-Item -LiteralPath $filePath -Force
        }
    }

    & $dbtCommand.Source --no-partial-parse seed --full-refresh --target duckdb --project-dir $projectDirectory --profiles-dir $projectDirectory
    if ($LASTEXITCODE -ne 0) {
        throw "dbt seed failed (exit code $LASTEXITCODE). The reset is incomplete."
    }

    & $dbtCommand.Source --no-partial-parse run --full-refresh --target duckdb --project-dir $projectDirectory --profiles-dir $projectDirectory
    if ($LASTEXITCODE -ne 0) {
        throw "dbt run failed (exit code $LASTEXITCODE). The reset is incomplete."
    }

    Write-Host "DuckDB reset complete: $databasePath"
}
finally {
    Pop-Location
}
```

## Repository Instructions

Before running the script, close any DuckDB connections and activate the virtual environment. The repository README documents invocation from the repository root, warns that existing database data and custom objects are lost, and describes `-WhatIf` and `-Confirm:$false`.