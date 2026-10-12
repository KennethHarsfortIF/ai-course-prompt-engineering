# PowerPoint Input: Step 01

Create a short instructional slide deck for developers learning prompt engineering with GitHub Copilot in VS Code. Include presenter notes. Use the full literal source files below; do not invent execution results or abbreviate the appendix content.

## Why This Change

Move stable, file-scoped modeling conventions into repository instructions. The task prompt stays focused on the requested dimension, and References can show whether the instructions were included.

## Slide Sequence

1. Learning goal and the friction in the previous stage.
2. Start branch, inherited materials, and exercise.
3. Solution: show which artifact carries conventions, task values, or workflow.
4. Exact prompt or skill invocation and manual-run handoff.
5. Evidence to check, limitations, and next stage.

## Branches and Run Status

Start: `Example-01-step-01-start` at `fc372caae2740506492912f9c305ee5251252ed0`.

Solution: `Example-01-step-01-solution` at `3e98837ef5ba491db72aab54157a9145a2a4e052`.

Run: `Example-01-step-01-run`, based on the solution. No prompt, skill, or dbt build has been executed. Its record is pending manual work. Expected task only: create dim_store from store with natural key businessentityid, surrogate key store_key, attributes storename and salespersonid, excluding modifieddate. This is not observed output.

No AdventureWorks project files were changed during preparation; no generated models are included. Blocks below include the exact solution prompt and complete contents of every changed step file, plus the full solution snapshot. The solution snapshot excludes itself to prevent recursion.

## Full Source: prompt-engineering-course/step-01/exercise.md

<!-- source: Example-01-step-01-start|prompt-engineering-course/step-01/exercise.md -->
```text no-final-newline
# Step 01 Exercise: Store Stable Rules as Instructions

## Learning Goal

Separate dimension conventions that should be reused from the one-time task
details. VS Code custom instructions are guidance that can attach to matching
files; they are not a skill or an execution guarantee.

## Branches

- Start: `Example-01-step-01-start`, from `Example-01-step-00-solution`.
- Solution: `Example-01-step-01-solution`, from this branch.
- Run: `Example-01-step-01-run`, from its solution.

## Assignment

1. Create `.github/instructions/adventureworks-dimensions.instructions.md`.
   Scope it only to dimension SQL/YAML files under AdventureWorks marts.
2. Move stable naming, seed reference, key, SQL/YAML, schema, and validation
   conventions there. Do not put `dim_store` values in the instructions.
3. Write `prompt.md` with only the dimension task details and a reference to
   those instructions. Keep stable rules out of this prompt.
4. Add `run-result.md` and a `solution.md` with complete contents of changed
   files, excluding the solution from its own snapshot.
5. Do not ask Copilot to make the model or run dbt during preparation.

## Demonstrate Instruction Use

On the run branch, use a fresh VS Code Copilot chat and submit the task prompt.
Afterward, inspect the response's **References** to see whether the instruction
file was included. References prove inclusion, not that every rule was followed.
Check generated code against conventions the short prompt did not spell out.

If the instruction is absent, verify the selected chat harness and that
`applyTo` matches the SQL/YAML files Copilot creates. You can attach the file
manually for comparison, but record that as a manual attachment rather than
evidence of automatic matching.

## Acceptance Checks

- Instructions cover only stable, reusable dimension guidance.
- The task prompt is shorter and has no copied house-rule list.
- No generated model or build result is claimed before manual execution.
```

## Full Source: prompt-engineering-course/step-01/prompt.md

<!-- source: Example-01-step-01-solution|prompt-engineering-course/step-01/prompt.md -->
```text no-final-newline
Create a `dim_store` dimension in `dbt-dimensional-modelling/adventureworks`
from the `store` seed. Use `businessentityid` as the natural key and
`store_key` as the surrogate key. Include `storename` and `salespersonid`; omit
`modifieddate`. Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML and validate the requested model.

The [scoped AdventureWorks dimension instructions](../../.github/instructions/adventureworks-dimensions.instructions.md)
contain the reusable project conventions for matching dimension files.
```

## Full Source: prompt-engineering-course/step-01/run-result.md

<!-- source: Example-01-step-01-solution|prompt-engineering-course/step-01/run-result.md -->
```text no-final-newline
# Step 01 Run Record

## Status

**Not executed.** This branch is ready for your manual Copilot run. No model
files, assistant response, dbt command, or build result are present.

- Run branch: `Example-01-step-01-run`.
- Source: `Example-01-step-01-solution`.
- Task prompt: `prompt-engineering-course/step-01/prompt.md`.
- Expected future files: `models/marts/dim_store.sql` and
  `models/marts/dim_store.yml` in the AdventureWorks project.

## Instruction Evidence

Use the intended VS Code Copilot harness in a fresh chat. After submitting the
task, expand **References** under the response and record whether
`.github/instructions/adventureworks-dimensions.instructions.md` is listed.
That shows whether the file was included in the request; it does not prove
Copilot followed every rule. Compare the generated key order, tests,
descriptions, references, and scope against the instruction file.

If you manually attach the instruction file, record that separately from
automatic `applyTo` application. If missing, inspect the selected harness,
customization discovery, and Agent Debug Logs.

## Build Evidence

After the manual run, record the exact prompt/context, complete response, full
generated SQL/YAML, dbt build command, exit code, and full output. Note any
failures, fixes, and reruns. Do not mark the build successful until it passes.

No prompt or build was run during course preparation. Do not carry generated
files into later solution/start branches.
```

## Full Source: .github/instructions/adventureworks-dimensions.instructions.md

<!-- source: Example-01-step-01-solution|.github/instructions/adventureworks-dimensions.instructions.md -->
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

## Full Source: prompt-engineering-course/step-01/solution.md

<!-- source: Example-01-step-01-solution|prompt-engineering-course/step-01/solution.md -->
````text
# Step 01 Solution: Scoped instructions

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## prompt-engineering-course/step-01/exercise.md

<!-- file: prompt-engineering-course/step-01/exercise.md -->
```text no-final-newline
# Step 01 Exercise: Store Stable Rules as Instructions

## Learning Goal

Separate dimension conventions that should be reused from the one-time task
details. VS Code custom instructions are guidance that can attach to matching
files; they are not a skill or an execution guarantee.

## Branches

- Start: `Example-01-step-01-start`, from `Example-01-step-00-solution`.
- Solution: `Example-01-step-01-solution`, from this branch.
- Run: `Example-01-step-01-run`, from its solution.

## Assignment

1. Create `.github/instructions/adventureworks-dimensions.instructions.md`.
   Scope it only to dimension SQL/YAML files under AdventureWorks marts.
2. Move stable naming, seed reference, key, SQL/YAML, schema, and validation
   conventions there. Do not put `dim_store` values in the instructions.
3. Write `prompt.md` with only the dimension task details and a reference to
   those instructions. Keep stable rules out of this prompt.
4. Add `run-result.md` and a `solution.md` with complete contents of changed
   files, excluding the solution from its own snapshot.
5. Do not ask Copilot to make the model or run dbt during preparation.

## Demonstrate Instruction Use

On the run branch, use a fresh VS Code Copilot chat and submit the task prompt.
Afterward, inspect the response's **References** to see whether the instruction
file was included. References prove inclusion, not that every rule was followed.
Check generated code against conventions the short prompt did not spell out.

If the instruction is absent, verify the selected chat harness and that
`applyTo` matches the SQL/YAML files Copilot creates. You can attach the file
manually for comparison, but record that as a manual attachment rather than
evidence of automatic matching.

## Acceptance Checks

- Instructions cover only stable, reusable dimension guidance.
- The task prompt is shorter and has no copied house-rule list.
- No generated model or build result is claimed before manual execution.
```

## prompt-engineering-course/step-01/prompt.md

<!-- file: prompt-engineering-course/step-01/prompt.md -->
```text no-final-newline
Create a `dim_store` dimension in `dbt-dimensional-modelling/adventureworks`
from the `store` seed. Use `businessentityid` as the natural key and
`store_key` as the surrogate key. Include `storename` and `salespersonid`; omit
`modifieddate`. Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML and validate the requested model.

The [scoped AdventureWorks dimension instructions](../../.github/instructions/adventureworks-dimensions.instructions.md)
contain the reusable project conventions for matching dimension files.
```

## prompt-engineering-course/step-01/run-result.md

<!-- file: prompt-engineering-course/step-01/run-result.md -->
```text no-final-newline
# Step 01 Run Record

## Status

**Not executed.** This branch is ready for your manual Copilot run. No model
files, assistant response, dbt command, or build result are present.

- Run branch: `Example-01-step-01-run`.
- Source: `Example-01-step-01-solution`.
- Task prompt: `prompt-engineering-course/step-01/prompt.md`.
- Expected future files: `models/marts/dim_store.sql` and
  `models/marts/dim_store.yml` in the AdventureWorks project.

## Instruction Evidence

Use the intended VS Code Copilot harness in a fresh chat. After submitting the
task, expand **References** under the response and record whether
`.github/instructions/adventureworks-dimensions.instructions.md` is listed.
That shows whether the file was included in the request; it does not prove
Copilot followed every rule. Compare the generated key order, tests,
descriptions, references, and scope against the instruction file.

If you manually attach the instruction file, record that separately from
automatic `applyTo` application. If missing, inspect the selected harness,
customization discovery, and Agent Debug Logs.

## Build Evidence

After the manual run, record the exact prompt/context, complete response, full
generated SQL/YAML, dbt build command, exit code, and full output. Note any
failures, fixes, and reruns. Do not mark the build successful until it passes.

No prompt or build was run during course preparation. Do not carry generated
files into later solution/start branches.
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

````

