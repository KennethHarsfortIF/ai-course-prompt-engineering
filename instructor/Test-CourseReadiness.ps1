#requires -Version 5.1

<#
.SYNOPSIS
Instructor-only readiness checks for the prompt-engineering course.
.DESCRIPTION
Reports PASS/FAIL for the repository's Windows .venv, terminal Python selection,
required tools and packages, dependency compatibility, local DuckDB profile,
dbt_utils, and the existing sales.store seed. Exercise checks also require the
intended run branch and no dim_store SQL/YAML files before generation.

This tool diagnoses only. It never installs dependencies, seeds or builds models,
resets a database, switches branches, or repairs files. Python runs without writing
bytecode; DuckDB is opened read-only and only if its database file already exists.
It does not invoke dbt debug, parse, or build, which can create logs or artifacts.
Profile checks inspect this project's concrete YAML settings, not dbt compilation.
Jinja-rendered profile paths are not supported. Package consistency uses pip check
or, for uv environments without pip, uv pip check with an explicit Python path.

Close other database sessions if DuckDB reports a conflicting lock. Existing mart
tables do not fail the exercise check; only pre-existing model files do.
Invoke this script normally, not by dot-sourcing it: it exits 0 when all checks
pass and 1 when any check fails. No network access is required.
.PARAMETER RepositoryRoot
Checkout to inspect. Defaults to the parent of this script's instructor directory.
The checkout must have its own .venv and seeded AdventureWorks DuckDB database.
.PARAMETER Step
Expected exercise number, 00 through 03. Without Step, any matching course run
branch is accepted. Available only when exercise checks are enabled.
.PARAMETER SetupOnly
Check environment readiness without checking the exercise branch or model files.
Use this before participants begin exercises, including from the main branch.
.EXAMPLE
.\instructor\Test-CourseReadiness.ps1 -SetupOnly
Run from the repository root after activating its .venv to check setup only.
.EXAMPLE
.\instructor\Test-CourseReadiness.ps1 -Step 02
Check setup and the clean Step 02 run workspace before model generation.
.EXAMPLE
.\instructor\Test-CourseReadiness.ps1 -RepositoryRoot C:\Course\checkout -Step 03
Inspect another checkout; first activate that checkout's .venv in the terminal.
#>
[CmdletBinding(DefaultParameterSetName = 'Exercise')]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),

    [Parameter(ParameterSetName = 'Exercise')]
    [ValidateSet('00', '01', '02', '03')]
    [string]$Step,

    [Parameter(ParameterSetName = 'Setup')]
    [switch]$SetupOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:failedChecks = 0
$script:totalChecks = 0

function Write-ReadinessResult {
    param(
        [bool]$Passed,
        [string]$Name,
        [string]$Detail
    )

    $script:totalChecks++
    $status = 'PASS'
    $color = 'Green'
    if (-not $Passed) {
        $script:failedChecks++
        $status = 'FAIL'
        $color = 'Red'
    }
    $message = $Detail -replace '\r?\n', '; '
    Write-Host ('{0} {1}: {2}' -f $status, $Name, $message) -ForegroundColor $color
}

try {
    $root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($RepositoryRoot)
    if (-not (Test-Path -LiteralPath $root -PathType Container)) {
        throw "Checkout directory does not exist: $root"
    }
}
catch {
    Write-ReadinessResult -Passed $false -Name 'Repository root' -Detail $_.Exception.Message
    exit 1
}

Write-Host "Instructor course readiness: $root"
$venvScripts = Join-Path $root '.venv\Scripts'
$python = Join-Path $venvScripts 'python.exe'
$pythonExists = Test-Path -LiteralPath $python -PathType Leaf
foreach ($tool in @('python.exe', 'dbt.exe', 'duckdb.exe')) {
    $toolPath = Join-Path $venvScripts $tool
    Write-ReadinessResult -Passed (Test-Path -LiteralPath $toolPath -PathType Leaf) -Name $tool -Detail $toolPath
}

$terminalPython = Get-Command python -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
if ($null -eq $terminalPython) {
    Write-ReadinessResult -Passed $false -Name 'Terminal Python' -Detail 'Python is not on PATH; activate this checkout''s .venv.'
}
else {
    $selectedPath = [System.IO.Path]::GetFullPath($terminalPython.Source)
    $usesVenv = [System.StringComparer]::OrdinalIgnoreCase.Equals($selectedPath, $python)
    Write-ReadinessResult -Passed $usesVenv -Name 'Terminal Python' -Detail "$selectedPath; expected $python"
}

if ($pythonExists) {
    $probe = @'
import importlib.metadata
import importlib.util
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys

root = Path(sys.argv[1]).resolve()
project = root / 'dbt-dimensional-modelling' / 'adventureworks'
checks = []

def check(name, action):
    try:
        detail = action()
        passed = True
    except Exception as error:
        detail = str(error)
        passed = False
    checks.append(dict(name=name, passed=passed, detail=detail))

def environment():
    if Path(sys.prefix).resolve() != (root / '.venv').resolve() or sys.prefix == sys.base_prefix:
        raise ValueError('Python is not using this checkout\'s .venv.')
    return 'Python {0}, {1}-bit, {2}'.format(sys.version.split()[0], struct.calcsize('P') * 8, sys.executable)

def packages():
    names = ('dbt-core', 'dbt-duckdb', 'duckdb', 'duckdb-cli')
    return ', '.join(name + '==' + importlib.metadata.version(name) for name in names)

def dependencies():
    if importlib.util.find_spec('pip') is not None:
        command = [sys.executable, '-B', '-m', 'pip', 'check']
    else:
        uv = shutil.which('uv')
        if uv is None:
            raise ValueError('Neither pip in .venv nor uv on PATH is available for dependency checks.')
        command = [uv, '--no-cache', 'pip', 'check', '--python', sys.executable]
    environment = os.environ.copy()
    environment['PYTHONDONTWRITEBYTECODE'] = '1'
    result = subprocess.run(command, capture_output=True, text=True, timeout=30, env=environment)
    detail = (result.stdout + result.stderr).strip()
    if result.returncode != 0:
        raise ValueError(detail or 'Dependency consistency check failed.')
    return detail or 'No broken requirements found.'

def load_yaml(path):
    import yaml
    with path.open(encoding='utf-8-sig') as source:
        value = yaml.safe_load(source)
    if not isinstance(value, dict):
        raise ValueError('Expected YAML mapping in ' + str(path))
    return value

def database_path():
    configuration = load_yaml(project / 'dbt_project.yml')
    profiles = load_yaml(project / 'profiles.yml')
    profile = profiles[configuration['profile']]
    if profile.get('target') != 'duckdb':
        raise ValueError('The local profile default target must be duckdb for this course.')
    output = profile['outputs']['duckdb']
    if output.get('type') != 'duckdb':
        raise ValueError('The duckdb output must use the duckdb adapter.')
    path = output.get('path')
    if not isinstance(path, str) or not path or '{{' in path or '{%' in path or path == ':memory:':
        raise ValueError('Expected a concrete file path for DuckDB in the local profile.')
    return (project / path).resolve()

def profile():
    return 'Local DuckDB profile: ' + str(database_path())

def dbt_utils():
    configuration = load_yaml(project / 'dbt_project.yml')
    package_directory = project / configuration.get('packages-install-path', 'dbt_packages') / 'dbt_utils'
    package = load_yaml(package_directory / 'dbt_project.yml')
    if package.get('name') != 'dbt_utils':
        raise ValueError('The installed package is not dbt_utils.')
    return str(package_directory)

def store_seed():
    import duckdb
    path = database_path()
    if not path.is_file():
        raise ValueError('Database file is missing; complete the documented database setup first: ' + str(path))
    connection = duckdb.connect(str(path), read_only=True)
    try:
        exists = connection.execute(
            'select count(*) from information_schema.tables where table_catalog = current_database() and table_schema = ? and table_name = ?',
            ['sales', 'store'],
        ).fetchone()[0]
        if not exists:
            raise ValueError('sales.store is missing; complete the documented seed-loading setup.')
        columns = {row[0] for row in connection.execute(
            'select column_name from information_schema.columns where table_catalog = current_database() and table_schema = ? and table_name = ?',
            ['sales', 'store'],
        ).fetchall()}
        missing = {'businessentityid', 'storename', 'salespersonid', 'modifieddate'} - columns
        if missing:
            raise ValueError('sales.store is missing columns: ' + ', '.join(sorted(missing)))
        count = connection.execute('select count(*) from sales.store').fetchone()[0]
        if count == 0:
            raise ValueError('sales.store has no rows; check the seed-loading setup.')
        return 'sales.store: {0} rows and all expected columns'.format(count)
    finally:
        connection.close()

check('Virtual environment', environment)
check('Required Python packages', packages)
check('Dependency compatibility', dependencies)
check('DuckDB profile', profile)
check('dbt_utils', dbt_utils)
check('Store seed (read-only)', store_seed)
print(json.dumps(checks))
'@

    try {
        $probeOutput = @(& $python -B -c $probe $root)
        if ($LASTEXITCODE -ne 0) {
            throw "Python readiness probe failed with exit code $LASTEXITCODE."
        }
        $results = @((($probeOutput -join [Environment]::NewLine) | ConvertFrom-Json))
        foreach ($result in $results) {
            Write-ReadinessResult -Passed ([bool]$result.passed) -Name $result.name -Detail $result.detail
        }
    }
    catch {
        Write-ReadinessResult -Passed $false -Name 'Python readiness probe' -Detail $_.Exception.Message
    }
}
else {
    Write-Host 'SKIP Python-backed checks: the checkout .venv is missing.'
}

if (-not $SetupOnly) {
    try {
        if (-not (Test-Path -LiteralPath (Join-Path $root '.git'))) {
            throw 'The selected directory is not a Git checkout root.'
        }
        $git = Get-Command git -CommandType Application -ErrorAction Stop
        $branchOutput = @(& $git.Source -C $root branch --show-current)
        if ($LASTEXITCODE -ne 0) {
            throw 'Cannot determine the checked-out Git branch.'
        }
        $branch = ($branchOutput -join '').Trim()
        $expected = 'Example-01-step-(00|01|02|03)-run'
        $matchesBranch = $branch -cmatch ('^' + $expected + '$')
        if ($Step) {
            $expected = "Example-01-step-$Step-run"
            $matchesBranch = $branch -ceq $expected
        }
        Write-ReadinessResult -Passed $matchesBranch -Name 'Exercise branch' -Detail "Current: $branch; expected: $expected"
    }
    catch {
        Write-ReadinessResult -Passed $false -Name 'Exercise branch' -Detail $_.Exception.Message
    }

    $existingModels = @('dim_store.sql', 'dim_store.yml') | Where-Object {
        Test-Path -LiteralPath (Join-Path $root "dbt-dimensional-modelling\adventureworks\models\marts\$_")
    }
    $existingModels = @($existingModels)
    $modelDetail = 'No pre-existing dim_store SQL/YAML files.'
    if ($existingModels.Count -gt 0) {
        $modelDetail = 'Already present: ' + ($existingModels -join ', ') + '. Review existing work; nothing was deleted.'
    }
    Write-ReadinessResult -Passed ($existingModels.Count -eq 0) -Name 'Generation baseline' -Detail $modelDetail
}

Write-Host ('Checks: {0}; failures: {1}' -f $script:totalChecks, $script:failedChecks)
if ($script:failedChecks -gt 0) {
    exit 1
}
exit 0