
dbt-dimensional-modelling is a clone of https://github.com/Data-Engineer-Camp/dbt-dimensional-modelling.git


# If script execution is disabled on the pc run this:
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Create virtual environment
python -m venv .venv

# Activate it
.\\.venv\Scripts\Activate.ps1

# Upgrade pip
python -m pip install --upgrade pip
# Install requirements
python -m pip install -r requirements.txt


# Check that dbt is working.
cd dbt-dimensional-modelling\adventureworks\
dbt deps\
mkdir target\
dbt debug\
dbt seed\
dbt run

# check that duckdb cli is working
duckdb target\adventureworks.duckdb -c "SELECT date_day, prior_date_day, day_of_month, day_of_year FROM date.date LIMIT 5;"

# Reset the DuckDB database

Close any DuckDB connections and activate the virtual environment first.
From the repository root, run:

```powershell
.\dbt-dimensional-modelling\adventureworks\Reset-DuckDb.ps1
```

The script asks for confirmation, installs dbt packages, deletes
`target/adventureworks.duckdb` and its WAL file, then rebuilds seeds and models.
All existing database data and custom objects are lost. The script can be invoked
from any working directory and always uses the project's DuckDB profile.
Use `-WhatIf` to preview the reset without changing anything, or `-Confirm:$false`
to skip confirmation for automation.

