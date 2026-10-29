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