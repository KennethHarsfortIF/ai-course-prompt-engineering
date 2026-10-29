# Step 01 Solution: Scoped instructions

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

## File Index

| Status | File | Purpose |
|---|---|---|
| Updated | `prompt-engineering-course/step-01/exercise.md` | Assignment and branch workflow |
| Added | `prompt-engineering-course/step-01/prompt.md` | Dimension task with a shared-instructions reference |
| Optional template | `prompt-engineering-course/step-01/run-result.md` | Suggested personal notes; not a supplied or required file |
| Moved | `.github/instructions/adventureworks-dimensions.instructions.md` | Reusable dimension conventions, moved from `prompt-engineering-course/step-01/instruction.md` |

The sections below contain the complete prepared contents of every added or
updated text file. The moved instruction is shown at its destination;
inherited unchanged files are not repeated. This solution document is excluded
from its own snapshot to avoid recursive self-embedding.
The optional notes template is separate from these file snapshots.

Work on `Example-01-step-01-run`, initially identical to the start branch.
Use the solution branch for prepared instructions and the task prompt, and the
demo branch for a completed example with generated models and validation results.

## prompt-engineering-course/step-01/exercise.md

<!-- file: prompt-engineering-course/step-01/exercise.md -->
```text no-final-newline
# Step 01 Exercise: Store Stable Rules as Instructions

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents. Use the run branch for your own work and the demo
branch as a completed reference.

## Learning Goal

Separate dimension conventions that should be reused from the one-time task
details. VS Code custom instructions are guidance that can attach to matching
files; they are not a skill or an execution guarantee.

## Branches

- Start: `Example-01-step-01-start`, from `Example-01-step-00-solution`.
- Run: `Example-01-step-01-run` is your workspace, initially identical to start;
   complete the exercise here.
- Solution: `Example-01-step-01-solution` contains the prepared instructions
   and task prompt as a reference.
- Demo: `Example-01-step-01-demo` contains a completed example with generated
   models and recorded validation results.

## Assignment

1. On the run branch, create `.github/instructions/adventureworks-dimensions.instructions.md`.
   Scope it only to dimension SQL/YAML files under AdventureWorks marts.
2. Move stable naming, seed reference, key, SQL/YAML, schema, and validation
   conventions there. Do not put `dim_store` values in the instructions.
3. Write `prompt.md` with only the dimension task details and a reference to
   those instructions. Keep stable rules out of this prompt.
4. Consult the supplied `solution.md` as needed. Keeping personal observations
   in a `run-result.md` on your run branch is optional, not an acceptance requirement.
5. Do not ask Copilot to make the model or run dbt during preparation.

## Demonstrate Instruction Use

On the run branch, use a fresh VS Code Copilot chat and submit the task prompt.
Afterward, inspect the response's **References** to see whether the instruction
file was included. References prove inclusion, not that every rule was followed.
Check generated code against conventions the short prompt did not spell out.
Review the generated SQL/YAML and actually run the focused dbt validation
described in the shared instructions.

If the instruction is absent, verify the selected chat harness and that
`applyTo` matches the SQL/YAML files Copilot creates. You can attach the file
manually for comparison, but treat that as a manual attachment rather than
evidence of automatic matching.

## Acceptance Checks

- Instructions cover only stable, reusable dimension guidance.
- The task prompt is shorter and has no copied house-rule list.
- No generated model or build result is claimed before manual execution.
```

## prompt-engineering-course/step-01/prompt.md

<!-- file: prompt-engineering-course/step-01/prompt.md -->
```text no-final-newline
I'm working in dbt-dimensional-modelling/adventureworks, a dbt project on DuckDB that
implements a Kimball-style dimensional model for AdventureWorks (raw seeds in
seeds/**, marts in models/marts/**).

Create a `dim_store` dimension in `dbt-dimensional-modelling/adventureworks`
from the `store` seed. Use `businessentityid` as the natural key and
`store_key` as the surrogate key. Include `storename` and `salespersonid`; omit
`modifieddate`. Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML and validate the requested model.
```

## Optional Run Notes

Keeping a personal run record is optional, not an acceptance requirement. If
useful, create `prompt-engineering-course/step-01/run-result.md` on your run
branch using this template. No run-record file is supplied by the solution.

<!-- optional-template: prompt-engineering-course/step-01/run-result.md -->
```text
# Step 01 Optional Run Notes

## Observations

- Instruction inclusion observed, not observed, or inconclusive:
- Automatic matching or manual attachment:
- Generated model review:
- Validation command and actual outcome:
- Errors, fixes, or questions:
```

## .github/instructions/adventureworks-dimensions.instructions.md

<!-- file: .github/instructions/adventureworks-dimensions.instructions.md -->
```text no-final-newline
---
name: AdventureWorks Dimensions
description: Use when creating or changing AdventureWorks dbt dimension models and their schema YAML.
applyTo: "dbt-dimensional-modelling/adventureworks/models/marts/dim_*.sql, dbt-dimensional-modelling/adventureworks/models/marts/dim_*.yml"
---

# AdventureWorks Dimension Conventions

## Model and Keys

- Put dimension SQL and matching YAML in `models/marts/`, named `dim_<entity>`.
- Model one row per task-defined natural key. Put the surrogate key first and
  create it with `dbt_utils.generate_surrogate_key` over the natural key; alias
  it `<entity>_key`.
- Give the surrogate and natural keys `unique` and `not_null` tests.
- Reference dbt seeds by node name with `ref('<seed_name>')`, not a hardcoded
  schema-qualified relation. Stage each source in a `stg_<seed_name>` CTE.

## Columns and SQL Style

- Select explicit columns; never use `select *` in the dimension output.
- Preserve source key and attribute names in lowercase; use lowercase snake_case
  for any new aliases. Order final columns as surrogate key, natural key(s),
  then requested descriptive attributes. Omit attributes the task excludes.
- Use the existing CTE-then-final-select shape, lowercase SQL keywords, four
  spaces of indentation, and one output column per line. Omit the final trailing
  comma.

## Schema YAML and Materialization

- The companion YAML uses `version: 2`, a model entry matching the SQL model,
  a short model description, and a `columns` list.
- Describe every output column. Follow the nearby YAML style for test lists.
- Inherit the existing marts table materialization and schema from
  `dbt_project.yml`; resolve seeds and models through dbt `ref()`.
- Do not change profiles, packages, schema macros, materialization, or seed
  configuration to complete an ordinary dimension task.

## Validation and Scope

- Validate the requested model with a focused dbt build from the AdventureWorks
  project, using its local profiles directory and DuckDB target where configured.
  Fix model failures and rerun the same focused build.
- Check that required packages and referenced seed relations exist. A model-only
  build does not materialize a missing seed. Report blockers rather than silently
  broadening validation.
- Report the actual command, exit status, and result. If not run, say so; never
  invent build evidence.
- Limit changes to the requested dimension SQL/YAML and necessary documentation.
  Do not edit seeds, facts, other dimensions, dependencies, or unrelated files.
  Preserve existing user changes and do not reset the database.
```

