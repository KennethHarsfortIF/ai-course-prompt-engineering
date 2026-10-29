# Step 01 Run Record

## Status

**Executed on 2026-10-29. Validation passed.** The requested dimension SQL and
YAML already existed and met the prompt and dimension conventions. Copilot
made no model changes and validated the existing implementation. This run
demonstrates inspection and validation, not fresh model generation.

- Demo branch: `Example-01-step-01-demo`.
- Source: `Example-01-step-01-solution`.
- Task prompt: `prompt-engineering-course/step-01/prompt.md`.
- Project directory: `dbt-dimensional-modelling/adventureworks`.
- Existing files: `models/marts/dim_store.sql` and `models/marts/dim_store.yml`.
- Worktree was clean before validation.

## Prompt and Context

The following prompt was submitted in VS Code Copilot with the step-01 prompt
selected in the editor:

```text
I'm working in dbt-dimensional-modelling/adventureworks, a dbt project on DuckDB that
implements a Kimball-style dimensional model for AdventureWorks (raw seeds in
seeds/**, marts in models/marts/**).

Create a `dim_store` dimension in `dbt-dimensional-modelling/adventureworks`
from the `store` seed. Use `businessentityid` as the natural key and
`store_key` as the surrogate key. Include `storename` and `salespersonid`; omit
`modifieddate`. Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML and validate the requested model.
```

Copilot read the dimension instructions, the customer reference SQL/YAML, the
existing store dimension SQL/YAML, the local profile, and the store seed header.
The environment was Windows PowerShell, with dbt installed in the workspace
`.venv` and the DuckDB profile using `target/adventureworks.duckdb`.

## Instruction Evidence

The session supplied the path and applicability of
`.github/instructions/adventureworks-dimensions.instructions.md`, and Copilot
explicitly read its full contents before inspecting the models. The task
attachment was the selected prompt, not the instruction file. Whether the
instruction file appeared in the response's **References** was not recorded;
automatic content inclusion through `applyTo` is therefore not verified here.

The existing implementation uses a `stg_store` CTE and `ref('store')`, puts the
generated surrogate key first, preserves the requested source column names,
omits `modifieddate`, describes all output columns, and tests both keys for
uniqueness and non-null values. No profiles, seeds, dependencies, other models,
or schema macros were changed, and the database was not reset.

## Model SQL

Existing `models/marts/dim_store.sql`, unchanged by this run:

```sql
with stg_store as (
    select
        businessentityid,
        storename,
        salespersonid
    from {{ ref('store') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['stg_store.businessentityid']) }} as store_key,
    stg_store.businessentityid,
    stg_store.storename,
    stg_store.salespersonid
from stg_store
```

## Schema YAML

Existing `models/marts/dim_store.yml`, unchanged by this run:

```yaml
version: 2

models:
  - name: dim_store
    description: One row per store.
    columns:
      - name: store_key
        description: The surrogate key of the store
        tests:
          - unique
          - not_null

      - name: businessentityid
        description: The natural key of the store
        tests:
          - not_null
          - unique

      - name: storename
        description: The store name.

      - name: salespersonid
        description: The identifier of the salesperson assigned to the store.
```

## Build Evidence

### Attempt 1: dbt Not on PATH

Working directory: workspace root. Exit status: **1**.

```powershell
dbt build --project-dir dbt-dimensional-modelling/adventureworks --profiles-dir dbt-dimensional-modelling/adventureworks --target duckdb --select dim_store
```

Error excerpt:

```text
dbt : The term 'dbt' is not recognized as the name of a cmdlet, function, script file, or operable program.
```

Copilot found the existing workspace `.venv`; no packages were installed.

### Attempt 2: Relative Database Path

Working directory: workspace root. The build failed before running any models.
The captured tool result did not report a numeric exit status. Error excerpt
below; the full Python traceback is not reproduced.

```powershell
.\.venv\Scripts\dbt.exe build --project-dir dbt-dimensional-modelling/adventureworks --profiles-dir dbt-dimensional-modelling/adventureworks --target duckdb --select dim_store
```

```text
06:22:25  Running with dbt=1.12.5
06:22:26  Registered adapter: duckdb=1.11.0
06:22:27  Found 9 models, 15 seeds, 46 data tests, 613 macros
06:22:27  Finished running  in 0 hours 0 minutes and 0.21 seconds (0.21s).
06:22:27  [ERROR]: Encountered an error:
IO Error: Cannot open file "C:\Users\HARKEA\ai-course-prompt-engineering\target\adventureworks.duckdb": The system cannot find the path specified.
```

The profile's relative database path resolved against the working directory.
Copilot changed to the AdventureWorks project directory without changing the
profile or creating another database.

### Attempt 3: Successful Focused Build

Working directory: `dbt-dimensional-modelling/adventureworks`. Exit status:
**0**. Command:

```powershell
..\..\.venv\Scripts\dbt.exe build --profiles-dir . --target duckdb --select dim_store
```

Full build output:

```text
06:22:42  Running with dbt=1.12.5
06:22:42  Registered adapter: duckdb=1.11.0
06:22:43  Found 9 models, 15 seeds, 46 data tests, 613 macros
06:22:43
06:22:43  Concurrency: 12 threads (target='duckdb')
06:22:43
06:22:43  1 of 5 START sql table model marts.dim_store ................................... [RUN]
06:22:43  1 of 5 OK created sql table model marts.dim_store .............................. [OK in 0.11s]
06:22:43  4 of 5 START test unique_dim_store_businessentityid ............................ [RUN]
06:22:43  5 of 5 START test unique_dim_store_store_key ................................... [RUN]
06:22:43  2 of 5 START test not_null_dim_store_businessentityid .......................... [RUN]
06:22:43  3 of 5 START test not_null_dim_store_store_key ................................. [RUN]
06:22:43  2 of 5 PASS not_null_dim_store_businessentityid ................................ [PASS in 0.07s]
06:22:43  5 of 5 PASS unique_dim_store_store_key ......................................... [PASS in 0.08s]
06:22:43  4 of 5 PASS unique_dim_store_businessentityid .................................. [PASS in 0.09s]
06:22:43  3 of 5 PASS not_null_dim_store_store_key ....................................... [PASS in 0.07s]
06:22:43
06:22:43  Finished running 1 table model, 4 data tests in 0 hours 0 minutes and 0.39 seconds (0.39s).
06:22:43
06:22:43  Completed successfully
06:22:43
06:22:43  Done. PASS=5 WARN=0 ERROR=0 SKIP=0 NO-OP=0 REUSED=0 TOTAL=5
```

The build resolved the required package macro and existing store seed relation,
created `marts.dim_store`, and passed all four key tests. No seed build or wider
model selection was needed.

## Final Assistant Response

The complete final response was:

````markdown
[dim_store.sql](dbt-dimensional-modelling/adventureworks/models/marts/dim_store.sql) and [dim_store.yml](dbt-dimensional-modelling/adventureworks/models/marts/dim_store.yml) already meet all requirements. No edits were needed.

Validated from the AdventureWorks directory:
```powershell
..\..\.venv\Scripts\dbt.exe build --profiles-dir . --target duckdb --select dim_store
```

Exit status: **0**. Table built successfully; all four uniqueness and non-null tests passed.
````

Keep this run evidence on the run branch. Do not carry generated artifacts
into later solution/start branches.