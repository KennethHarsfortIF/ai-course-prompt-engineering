---
name: AdventureWorks Dimensions
description: Use when creating or changing AdventureWorks dbt dimension models and their schema YAML.
applyTo: "dbt-dimensional-modelling/adventureworks/models/marts/dim_*.sql, dbt-dimensional-modelling/adventureworks/models/marts/dim_*.yml"
---
# AdventureWorks Dimension Conventions
## Model and Keys
- Put dimension SQL and matching YAML in `models/marts/`, named `dim_<entity>`.
- Model one row per task-defined natural key. Put the surrogate key first and create it with `dbt_utils.generate_surrogate_key` over the natural key; alias it `<entity>_key`.
- Give the surrogate and natural keys `unique` and `not_null` tests.
- Reference dbt seeds by node name with `ref('<seed_name>')`, not a hardcoded schema-qualified relation. Stage each source in a `stg_<seed_name>` CTE.
## Columns and SQL Style
- Select explicit columns; never use `select *` in the dimension output.
- Preserve source key and attribute names in lowercase; use lowercase snake_case for any new aliases. Order final columns as surrogate key, natural key(s), then requested descriptive attributes. Omit attributes the task excludes.
- Use the existing CTE-then-final-select shape, lowercase SQL keywords, four spaces of indentation, and one output column per line. Omit the final trailing comma.
## Schema YAML and Materialization
- The companion YAML uses `version: 2`, a model entry matching the SQL model, a short model description, and a `columns` list.
- Describe every output column. Follow the nearby YAML style for test lists.
- Inherit the existing marts table materialization and schema from `dbt_project.yml`; resolve seeds and models through dbt `ref()`.
- Do not change profiles, packages, schema macros, materialization, or seed configuration to complete an ordinary dimension task.
## Validation and Scope
- Validate the requested model with a focused dbt build from the AdventureWorks project, using its local profiles directory and DuckDB target where configured. Fix model failures and rerun the same focused build.
- Check that required packages and referenced seed relations exist. A model-only build does not materialize a missing seed. Report blockers rather than silently broadening validation.
- Report the actual command, exit status, and result. If not run, say so; never invent build evidence.
- Limit changes to the requested dimension SQL/YAML and necessary documentation. Do not edit seeds, facts, other dimensions, dependencies, or unrelated files. Preserve existing user changes and do not reset the database.
