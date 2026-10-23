---
name: create-dimension
description: Create or update a dimension in the AdventureWorks dbt project from task-specific inputs. Use when asked to build a dimension from a seed and validate its SQL/YAML model.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Use this workflow when asked to create or update an AdventureWorks dbt dimension
from a seed.

## Resources

- Read the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
  for stable model and validation conventions.

## Workflow

1. Extract the requested model name, entity, seed, natural key, surrogate key,
   included and excluded attributes, and structural reference from the request.
   Ask concise questions only when missing or ambiguous information prevents
   correct implementation; do not guess. An omitted exclusion list means no
   additional exclusions, not a missing required input.
2. Verify that the requested dimension belongs in
   `dbt-dimensional-modelling/adventureworks`. Before editing its SQL/YAML files,
   check for existing user changes and preserve them.
3. Inspect the seed's columns and the reference model's SQL/YAML before
   generating code. Verify that requested source columns exist. Report missing
   columns or unavailable references rather than inventing them.
4. Create or update only the requested dimension SQL and companion schema YAML.
   Use the supplied keys, include the requested descriptive attributes, and omit
   excluded attributes. Use the reference model for structure; if it conflicts
   with the shared dimension instructions, follow the shared instructions.
   Do not edit seeds, other models, profiles, packages, schema macros, or
   unrelated files.
5. Validate the focused model using the project-local DuckDB profile. From the
   AdventureWorks project directory, run
   `dbt build --select <model_name> --profiles-dir . --target duckdb`.
   If prerequisites such as the seed relation or packages are missing, report
   the blocker instead of broadening the command or changing source data.
6. Report changed files, the command actually run, exit status, and concise
   result. If validation was not run, say so; never invent build evidence.
