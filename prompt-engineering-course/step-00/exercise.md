# Step 00 Exercise: Try the Prompt

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents; the run branch is where you capture real AI and dbt
results.

## Learning Goal

Try a detailed, self-contained prompt that combines the task with project
conventions, then review the generated dimension and validate it with dbt.

## Branches

- Start: `Example-01-step-00-start` contains this exercise and walkthrough.
- Solution: `Example-01-step-00-solution` adds the prepared prompt and pending
  run record.
- Run: `Example-01-step-00-run` is where you submit the prompt and record actual
  output and validation evidence.

## Assignment

1. Review `solution.md` for the complete prepared prompt and run-record contents.
2. On the run branch, submit `prompt-engineering-course/step-00/prompt.md` in an AI chat.
3. Review generated SQL/YAML, then run `dbt build --select dim_store` from `dbt-dimensional-modelling/adventureworks`.
4. Record the response, files, command, exit code, output, and fixes in `run-result.md`; only claim success if the build passes.

## Acceptance Checks

- The prompt includes the task details and reusable project conventions.
- Generated files and run evidence remain on the run branch.
- The run record distinguishes observed results from assumptions.