# PowerPoint Input: Step 00

Create a short instructional slide deck for developers learning prompt engineering with GitHub Copilot in VS Code. Include presenter notes. Use the full literal source files below; do not invent execution results or abbreviate the appendix content.

## Why This Change

Start with the original prompt, where conventions and a one-time dimension task share one long message. This baseline makes repeated rules and task inputs visible before separating them.

## Slide Sequence

1. Learning goal and the friction in the previous stage.
2. Start branch, inherited materials, and exercise.
3. Solution: show which artifact carries conventions, task values, or workflow.
4. Exact prompt or skill invocation and manual-run handoff.
5. Evidence to check, limitations, and next stage.

## Branches and Run Status

Start: `Example-01-step-00-start` at `5c1f2eb92853e017edf84ac4aaeea9862c8a3081`.

Solution: `Example-01-step-00-solution` at `330e0ad70760e7bdf46ae43df7355bc0aa23a8b5`.

Run: `Example-01-step-00-run`, based on the solution. No prompt, skill, or dbt build has been executed. Its record is pending manual work. Expected task only: create dim_store from store with natural key businessentityid, surrogate key store_key, attributes storename and salespersonid, excluding modifieddate. This is not observed output.

No AdventureWorks project files were changed during preparation; no generated models are included. Blocks below include the exact solution prompt and complete contents of every changed step file, plus the full solution snapshot. The solution snapshot excludes itself to prevent recursion.

## Full Source: prompt-engineering-course/step-00/exercise.md

<!-- source: Example-01-step-00-start|prompt-engineering-course/step-00/exercise.md -->
```text no-final-newline
# Step 00 Exercise: One Big Prompt

## Learning Goal

Use the original prompt as a baseline. Identify which text is stable project
guidance and which text describes this one `dim_store` task.

## Branches

- Start: `Example-01-step-00-start`, from `main`.
- Solution: `Example-01-step-00-solution`, from this branch.
- Run: `Example-01-step-00-run`, from the solution.

## Assignment

1. Read `prompt-engineering-course/00-big-prompt.md`.
2. Put the exact text inside its `text` code fence into this step's `prompt.md`.
   Do not edit or replace the original baseline.
3. Add a pending `run-result.md` and a `solution.md` containing the complete
   contents of this step's changed text files. A solution cannot include itself
   recursively; document that exception.
4. Do not run the prompt, invoke Copilot, run dbt, or create model files during
   course preparation.

The future task is a `dim_store` dimension from the `store` seed, with
`businessentityid` as natural key and `store_key` as surrogate key. Include
`storename` and `salespersonid`; exclude `modifieddate`.

## Manual Run

After preparation, switch to `Example-01-step-00-run`, open a fresh Copilot chat,
and submit the exact prompt. Record the actual generated SQL/YAML, assistant
response, build command, exit code, and complete output in the run record. Do
not claim a successful build until the command has really run.

Before running, confirm the dbt environment, installed packages, DuckDB profile,
and seeded `sales.store` relation. The prompt retains its original build command;
configure local profile discovery as needed. A model-only build does not create
a missing seed.

## Acceptance Checks

- Prompt text matches the baseline's runnable prompt fence exactly.
- No dbt model, prompt execution, or build result is added during preparation.
- All course files remain outside the AdventureWorks project.
```

## Full Source: prompt-engineering-course/step-00/prompt.md

<!-- source: Example-01-step-00-solution|prompt-engineering-course/step-00/prompt.md -->
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

## Full Source: prompt-engineering-course/step-00/run-result.md

<!-- source: Example-01-step-00-solution|prompt-engineering-course/step-00/run-result.md -->
```text no-final-newline
# Step 00 Run Record

## Status

**Not executed.** This run branch is intentionally prepared for a manual Copilot
run. No prompt has been submitted, no files generated, and no dbt command or
build result recorded.

- Run branch: `Example-01-step-00-run`.
- Source: `Example-01-step-00-solution`.
- Prompt: `prompt-engineering-course/step-00/prompt.md`.
- Project directory: `dbt-dimensional-modelling/adventureworks`.
- Expected future model files: `models/marts/dim_store.sql` and
  `models/marts/dim_store.yml`.

## Manual Evidence to Capture

Submit the exact prompt in a fresh Copilot chat. Record the date, assistant
response, generated files in full, actual dbt command, exit code, and complete
build output. Include failures and any fixes or reruns. Do not infer that the
build passed merely because the model files look correct.

Check the installed dbt environment, packages, local DuckDB profile, and seeded
`sales.store` before the run. The original prompt's command is retained
verbatim; use the project-local profiles path or set `DBT_PROFILES_DIR` if needed.
Model selection will not seed missing source data.

Keep generated files and evidence only on this run branch. Later steps start
from solution branches, not this run.
```

## Full Source: prompt-engineering-course/step-00/solution.md

<!-- source: Example-01-step-00-solution|prompt-engineering-course/step-00/solution.md -->
````text
# Step 00 Solution: All-in-one prompt

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## prompt-engineering-course/step-00/exercise.md

<!-- file: prompt-engineering-course/step-00/exercise.md -->
```text no-final-newline
# Step 00 Exercise: One Big Prompt

## Learning Goal

Use the original prompt as a baseline. Identify which text is stable project
guidance and which text describes this one `dim_store` task.

## Branches

- Start: `Example-01-step-00-start`, from `main`.
- Solution: `Example-01-step-00-solution`, from this branch.
- Run: `Example-01-step-00-run`, from the solution.

## Assignment

1. Read `prompt-engineering-course/00-big-prompt.md`.
2. Put the exact text inside its `text` code fence into this step's `prompt.md`.
   Do not edit or replace the original baseline.
3. Add a pending `run-result.md` and a `solution.md` containing the complete
   contents of this step's changed text files. A solution cannot include itself
   recursively; document that exception.
4. Do not run the prompt, invoke Copilot, run dbt, or create model files during
   course preparation.

The future task is a `dim_store` dimension from the `store` seed, with
`businessentityid` as natural key and `store_key` as surrogate key. Include
`storename` and `salespersonid`; exclude `modifieddate`.

## Manual Run

After preparation, switch to `Example-01-step-00-run`, open a fresh Copilot chat,
and submit the exact prompt. Record the actual generated SQL/YAML, assistant
response, build command, exit code, and complete output in the run record. Do
not claim a successful build until the command has really run.

Before running, confirm the dbt environment, installed packages, DuckDB profile,
and seeded `sales.store` relation. The prompt retains its original build command;
configure local profile discovery as needed. A model-only build does not create
a missing seed.

## Acceptance Checks

- Prompt text matches the baseline's runnable prompt fence exactly.
- No dbt model, prompt execution, or build result is added during preparation.
- All course files remain outside the AdventureWorks project.
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

## prompt-engineering-course/step-00/run-result.md

<!-- file: prompt-engineering-course/step-00/run-result.md -->
```text no-final-newline
# Step 00 Run Record

## Status

**Not executed.** This run branch is intentionally prepared for a manual Copilot
run. No prompt has been submitted, no files generated, and no dbt command or
build result recorded.

- Run branch: `Example-01-step-00-run`.
- Source: `Example-01-step-00-solution`.
- Prompt: `prompt-engineering-course/step-00/prompt.md`.
- Project directory: `dbt-dimensional-modelling/adventureworks`.
- Expected future model files: `models/marts/dim_store.sql` and
  `models/marts/dim_store.yml`.

## Manual Evidence to Capture

Submit the exact prompt in a fresh Copilot chat. Record the date, assistant
response, generated files in full, actual dbt command, exit code, and complete
build output. Include failures and any fixes or reruns. Do not infer that the
build passed merely because the model files look correct.

Check the installed dbt environment, packages, local DuckDB profile, and seeded
`sales.store` before the run. The original prompt's command is retained
verbatim; use the project-local profiles path or set `DBT_PROFILES_DIR` if needed.
Model selection will not seed missing source data.

Keep generated files and evidence only on this run branch. Later steps start
from solution branches, not this run.
```

````

