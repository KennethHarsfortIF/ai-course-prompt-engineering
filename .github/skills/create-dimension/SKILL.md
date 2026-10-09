---
name: create-dimension
description: Create or update a dimension in the AdventureWorks dbt project from task-specific inputs. Use when asked to build a dimension from a seed and validate its SQL/YAML model.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: true
---

# Create a Dimension

Use this workflow when the user explicitly invokes `/create-dimension`.
Automatic skill invocation is disabled for this course so the learner can see
and record the slash command.

## Resources

- Read the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
  for stable model and validation conventions.
- Read the [dimension task prompt file](../../prompts/dimension-task.prompt.md)
   for the task request structure and input fields.

Do not copy the full instruction list or prompt text into a second reusable
source. Resolve resource paths relative to this skill directory. The prompt file
uses VS Code `${input:...}` variables when invoked directly as `/dimension-task`;
when this skill is invoked, collect concrete values from the user's request and
never send unresolved input tokens as if they were task values.

## Workflow

1. Extract the requested model name, entity, seed, natural key, surrogate key,
   included and excluded attributes, and structural reference from the invocation.
   Ask concise questions for any missing values; do not guess.
2. Confirm the task is in `dbt-dimensional-modelling/adventureworks` and that
   the requested model files do not contain unrelated user work.
3. Use the prompt file's input fields to structure the task request. When the
   skill invocation includes concrete values, apply them directly; ask for any
   missing values. Keep the instruction reference intact and do not leave
   unresolved input tokens in the prompt sent for implementation.
4. Implement only the requested dimension SQL and its companion schema YAML.
   Do not edit seed data, other dimensions, facts, profiles, package versions,
   schema macros, or unrelated files. Preserve existing user changes.
5. Validate the focused model using the project-local DuckDB profile. From the
   AdventureWorks project directory, run
   `dbt build --select <model_name> --profiles-dir . --target duckdb`.
   If prerequisites such as the seed relation or packages are missing, report
   the blocker instead of broadening the command or changing source data.
6. Report changed files, the command actually run, exit status, and concise
   result. If validation was not run, say so; never invent build evidence.

## Example Invocation

`/create-dimension Create dim_store from the store seed. Use businessentityid as
the natural key and store_key as the surrogate key. Include storename and
salespersonid; exclude modifieddate. Use dim_customer as the structural reference.`