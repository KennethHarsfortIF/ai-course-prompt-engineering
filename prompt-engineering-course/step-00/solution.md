# Step 00 Solution: All-in-one prompt

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

## File Index

| Status | File | Purpose |
|---|---|---|
| Updated | `prompt-engineering-course/step-00/exercise.md` | Learning goal, branch workflow, and run instructions |
| Added | `prompt-engineering-course/step-00/prompt.md` | Self-contained dimension task prompt |
| Optional template | `prompt-engineering-course/step-00/run-result.md` | Suggested personal notes; not a supplied or required file |

The sections below contain the complete prepared contents of every added or
updated text file. Inherited unchanged files are not repeated. This solution
document is excluded from its own snapshot to avoid recursive self-embedding.
The optional notes template is separate from these file snapshots.

Work on `Example-01-step-00-run`, initially identical to the start branch.
Use the solution branch for the prepared prompt and the demo branch for a
completed example with generated models and recorded validation results.

## prompt-engineering-course/step-00/exercise.md

<!-- file: prompt-engineering-course/step-00/exercise.md -->
```text no-final-newline
# Step 00 Exercise: Try the Prompt

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared prompt. Use the run branch for your own work and the demo branch as
a completed reference.

## Learning Goal

Try a detailed, self-contained prompt that combines the task with project
conventions, then review the generated dimension and validate it with dbt.

## Branches

- Start: `Example-01-step-00-start` is the untouched exercise baseline.
- Run: `Example-01-step-00-run` is your workspace, initially identical to start;
  complete the exercise here.
- Solution: `Example-01-step-00-solution` is the reference answer containing the
  prepared prompt.
- Demo: `Example-01-step-00-demo` is a completed example with generated models
  and recorded validation results.

## Assignment

1. Review `solution.md` for the complete prepared prompt.
2. On the run branch, prepare `prompt-engineering-course/step-00/prompt.md`
  using the solution as needed, then submit it in an AI chat.
3. Review generated SQL/YAML, then run `dbt build --select dim_store` from `dbt-dimensional-modelling/adventureworks`.
4. Optionally keep a `run-result.md` on your run branch with observations,
  validation output, and any fixes.

## Acceptance Checks

- The prompt includes the task details and reusable project conventions.
- Review the generated SQL/YAML and actual dbt build output.
- Only claim success if the build passes.
```

## prompt-engineering-course/step-00/prompt.md

<!-- file: prompt-engineering-course/step-00/prompt.md -->
```text
I'm working in dbt-dimensional-modelling/adventureworks, a dbt project on DuckDB that
implements a Kimball-style dimensional model for AdventureWorks (raw seeds in
seeds/**, marts in models/marts/**).

Project conventions you must follow:
- Dimension models live in models/marts/ and are named dim_<entity>.sql, with a
  matching dim_<entity>.yml schema file in the same folder.
- Every dimension has a surrogate key as the first column, generated with
  {{ dbt_utils.generate_surrogate_key(['<natural_key_column>']) }} and aliased as
  <entity>_key.
- Source seeds are referenced with {{ ref('<seed_name>') }}, never hardcoded table
  names, and staged into CTEs named stg_<seed_name> before the final select.
- Column names are snake_case and lowercase, matching the seed's raw column names
  (no camelCase passthrough).
- The final select must list the surrogate key first, then the natural key(s),
  then descriptive attributes - no `select *`.
- Every model needs a companion .yml with `version: 2`, a `models:` entry named
  after the model, and a `columns:` list. The surrogate key column must have
  `tests: [unique, not_null]`. The natural key column must have
  `tests: [unique, not_null]`. Every column should have a short `description`.
- Style: 4-space indent, one column per line, trailing commas omitted on the last
  column, lowercase SQL keywords.
- After creating or changing a model, run `dbt build --select <model_name>` from
  the adventureworks/ folder and fix any failures before considering the task done.

Now, using those conventions, create a new dimension called dim_store. It should be
built from the seeds.sales.store seed (columns: businessentityid, storename,
salespersonid, modifieddate). Use businessentityid as the natural key and derive
store_key as the surrogate key. Include storename and salespersonid as descriptive
attributes (do not include modifieddate in the mart). Create both dim_store.sql and
dim_store.yml in models/marts/, following the exact same structure as the existing
dim_customer.sql / dim_customer.yml files in that folder. Then run dbt build for the
new model and show me the result.
```

## Optional Run Notes

Keeping a personal run record is optional, not an acceptance requirement. If
useful, create `prompt-engineering-course/step-00/run-result.md` on your run
branch using this template. No run-record file is supplied by the solution.

<!-- optional-template: prompt-engineering-course/step-00/run-result.md -->
```text
# Step 00 Optional Run Notes

## Observations

- Request and response summary:
- Validation command and actual outcome:
- Errors, fixes, or questions:
```

