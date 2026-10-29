# Getting Started

Run these commands in PowerShell from the repository root (the folder containing
this file and `requirements.txt`). A virtual environment keeps this project's
Python packages separate from other projects and from your system Python.

## Create and activate the environment

Check which Python command is available in PowerShell. The `py` launcher is
common on Windows, but it is not installed with every Python setup:

```powershell
py --version
python --version
python3 --version
```

Use one command that works to create the environment in `.venv` (do not run all
of these):

```powershell
py -m venv .venv
```

If `py` is unavailable but `python` works:

```powershell
python -m venv .venv
```

A version-specific command may also be available:

```powershell
python3.12 -m venv .venv
```

Replace `3.12` with the installed version. If Python is not on `PATH`, run the
executable by its full path instead, for example:

```powershell
& "C:\Path\To\python.exe" -m venv .venv
```

After creating the environment, activate it:

```powershell
.\.venv\Scripts\Activate.ps1
```

When activation succeeds, `(.venv)` appears at the start of the PowerShell
prompt. After activation, use `python` for the remaining commands; it will
refer to the environment's Python.

If PowerShell says script execution is disabled, allow locally created scripts
for your Windows user, then activate the environment again:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## Install the requirements

With the environment active, upgrade pip and install the dependencies listed in
the repository-root requirements file:

```powershell
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Using `python -m pip` ensures pip installs packages into the Python environment
currently selected by the active environment.

## Alternative: use uv

Use this approach instead of the environment-creation and pip-install steps
above. Install `uv` using its PowerShell installer:

```powershell
irm https://astral.sh/uv/install.ps1 | iex
```

Or install it with WinGet:

```powershell
winget install --id astral-sh.uv -e
```

If PowerShell cannot find `uv` after installation, open a new terminal. Then,
from the repository root, create the environment, install the root requirements,
and activate it:

```powershell
uv --version
uv venv .venv
uv pip install -r requirements.txt
.\.venv\Scripts\Activate.ps1
```

## Verify the installation

Run the check for the setup method you used.

For the pip setup:

```powershell
python -m pip check
python -m pip show dbt-duckdb duckdb-cli
```

For the uv setup:

```powershell
uv pip check
uv pip show dbt-duckdb duckdb-cli
```

The check should report no broken requirements, and the show command should
display both installed packages.

## Check dbt with DuckDB

From the repository root, move into the AdventureWorks dbt project, ensure its
DuckDB file's parent directory exists, and check the connection:

```powershell
Set-Location .\dbt-dimensional-modelling\adventureworks
New-Item -ItemType Directory -Force target | Out-Null
dbt debug --profiles-dir .
```

The `--profiles-dir .` option tells dbt to use the project's local
`profiles.yml`. A successful `dbt debug` confirms dbt can load the DuckDB
profile and connect to the database.

The nested `dbt-dimensional-modelling\requirements.txt` belongs to that
subproject and pins a different set of versions. For the repository setup
described here, install from the root `requirements.txt` as shown above.

## Readiness Checklist

Before the course, confirm:

- [ ] The project's `.venv` is active, and `python` uses its Python executable.
- [ ] The pip or uv dependency check above reports no broken requirements.
- [ ] `dbt debug --profiles-dir .` succeeds from the AdventureWorks project.
- [ ] dbt packages, including `dbt_utils`, are installed.


Before each generation exercise, use the assigned `Example-01-step-NN-run`
branch and check that `models/marts/dim_store.sql` and `dim_store.yml` are not
already present in the AdventureWorks project. If they exist, ask the instructor
before deleting or overwriting any work.

To leave the environment when you are done, run:

```powershell
deactivate
```