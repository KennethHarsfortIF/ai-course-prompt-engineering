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