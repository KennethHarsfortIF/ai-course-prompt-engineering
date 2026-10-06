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