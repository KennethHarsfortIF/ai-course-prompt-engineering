# Prompt Engineering Course

Hands-on exercises using GitHub Copilot to build AdventureWorks dimension models
with dbt and DuckDB. The course progresses from standalone prompts to reusable
instructions, parameterized prompt files, and agent skills.

The dbt example is based on
[Data Engineer Camp's dimensional modelling project](https://github.com/Data-Engineer-Camp/dbt-dimensional-modelling).

## Setup

For participant PC setup instructions, follow [Getting Started](gettingstarted.md).

## Reset the DuckDB Database

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

