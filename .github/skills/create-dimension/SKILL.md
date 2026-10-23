---
name: create-dimension
description: Create or update a dimension in the AdventureWorks dbt project from task-specific inputs. Use when asked to build a dimension from a seed and validate its SQL/YAML model.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Use this workflow when asked to create or update an AdventureWorks dbt dimension
from a seed. It can be selected from a relevant ordinary-language request or
invoked explicitly as `/create-dimension`.

## Resources

- Read the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
  for stable model and validation conventions.

## Workflow

1. Extract the requested model name, entity, seed, natural key, surrogate key,
   included and excluded attributes, and structural reference from the request.
   Ask concise questions for any missing values; do not guess.
2. Confirm the task is in `dbt-dimensional-modelling/adventureworks` and that
   the requested model files do not contain unrelated user work.
3. Use the specified structural reference for both SQL and YAML. Create the
   requested dimension from the seed using the supplied natural and surrogate
   keys. Include the requested descriptive attributes and omit excluded ones.
4. Implement only the requested dimension SQL and its companion schema YAML,
   following the shared dimension instructions.
   Do not edit seed data, other dimensions, facts, profiles, package versions,
   schema macros, or unrelated files. Preserve existing user changes.
5. Validate the focused model using the project-local DuckDB profile. From the
   AdventureWorks project directory, run
   `dbt build --select <model_name> --profiles-dir . --target duckdb`.
   If prerequisites such as the seed relation or packages are missing, report
   the blocker instead of broadening the command or changing source data.
6. Report changed files, the command actually run, exit status, and concise
   result. If validation was not run, say so; never invent build evidence.

## Example Request

Create dim_store, a dimension for store, from the store seed in
dbt-dimensional-modelling/adventureworks. Use businessentityid as the natural
key and store_key as the surrogate key. Include storename and salespersonid;
exclude modifieddate. Use dim_customer as the structural reference for SQL and
YAML. Create the model files, validate the requested model, and show the result.