# Step 02 Run Record

## Status

**Build passed; prompt-customization evidence is incomplete.** The prompt-file
task was run in this interaction, the requested model files were created, and
the focused DuckDB build and key tests passed. Whether this interaction met the
fresh-chat criterion was not independently verified. Agent Customizations and
response References were not inspected, so instruction discovery is unverified.

- Demo branch: `Example-01-step-02-demo`.
- Source: `Example-01-step-02-solution`.
- Invocation record: `prompt-engineering-course/step-02/prompt.md`.
- VS Code prompt file: `.github/prompts/dimension-task.prompt.md`.
- Applicable instructions: `.github/instructions/adventureworks-dimensions.instructions.md`.
- Execution context: the prompt file was attached to the request in this
	interaction; fresh-chat status and UI customization evidence remain
	unverified.

## Invocation

```text
Follow instructions in #prompt:dimension-task.prompt.md with these arguments:
model_name=dim_store entity=store seed=store natural_key=businessentityid
surrogate_key=store_key included_attributes=storename,salespersonid
excluded_attributes=modifieddate reference_model=dim_customer
```

## Generated SQL

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

## Generated YAML

```yaml
version: 2

models:
  - name: dim_store
    description: Store dimension with store identifiers and descriptive attributes.
    columns:
      - name: store_key
        description: The surrogate key of the store.
        tests:
          - unique
          - not_null

      - name: businessentityid
        description: The natural key of the store.
        tests:
          - unique
          - not_null

      - name: storename
        description: The name of the store.

      - name: salespersonid
        description: The identifier of the salesperson assigned to the store.
```

## Build Evidence

The first attempt was run from the workspace root. It exited 1 because the
DuckDB profile path `target/adventureworks.duckdb` resolved relative to that
directory, where `target` does not exist:

```text
& .\.venv\Scripts\dbt.exe build --project-dir .\dbt-dimensional-modelling\adventureworks --profiles-dir .\dbt-dimensional-modelling\adventureworks --select dim_store --target duckdb
IO Error: Cannot open file "C:\Users\HARKEA\ai-course-prompt-engineering\target\adventureworks.duckdb": The system cannot find the path specified.
Exit code: 1
```

The successful retry ran from
`dbt-dimensional-modelling/adventureworks` with the workspace `.venv`:

```text
& ..\..\.venv\Scripts\dbt.exe build --select dim_store --profiles-dir . --target duckdb
Exit code: 0
```

```text
Running with dbt=1.12.5
Registered adapter: duckdb=1.11.0
Found 9 models, 15 seeds, 46 data tests, 613 macros
Concurrency: 12 threads (target='duckdb')
1 of 5 START sql table model marts.dim_store
1 of 5 OK created sql table model marts.dim_store
2 of 5 PASS not_null_dim_store_businessentityid
3 of 5 PASS not_null_dim_store_store_key
5 of 5 PASS unique_dim_store_store_key
4 of 5 PASS unique_dim_store_businessentityid
Finished running 1 table model, 4 data tests in 0 hours 0 minutes and 0.41 seconds.
Completed successfully
Done. PASS=5 WARN=0 ERROR=0 SKIP=0 NO-OP=0 REUSED=0 TOTAL=5
```

`dbt show --select dim_store --limit 5 --profiles-dir . --target duckdb`
also succeeded and returned:

| businessentityid | storename | salespersonid |
| ---: | --- | ---: |
| 292 | Next-Door Bike Store | 279 |
| 294 | Professional Sales and Service | 276 |
| 296 | Riders Company | 277 |
| 298 | The Bike Mechanics | 275 |
| 300 | Nationwide Supply | 286 |

The generated dimension omits `modifieddate`. The database was not reset and
the seed was not edited. Keep the generated model files and run evidence off
later start and solution branches. This prompt-file task is distinct from the
`/create-dimension` workflow skill introduced in step 03.