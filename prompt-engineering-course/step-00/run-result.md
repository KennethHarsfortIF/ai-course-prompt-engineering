# Step 00 Run Record

## Status

**Not executed.** This run branch is prepared for a manual Copilot run. No
prompt has been submitted and no dbt command or build result is recorded. The
`dim_store` files on this branch were moved from the solution branch; they are
not evidence of a prompt run.

- Run branch: `Example-01-step-00-run`.
- Source: `Example-01-step-00-solution`.
- Prompt: `prompt-engineering-course/step-00/prompt.md`.
- Project directory: `dbt-dimensional-modelling/adventureworks`.
- Model files: `models/marts/dim_store.sql` and `models/marts/dim_store.yml`
  (transferred from the solution branch; prompt output not verified).

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