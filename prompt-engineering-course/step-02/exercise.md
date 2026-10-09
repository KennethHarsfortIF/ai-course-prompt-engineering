# Step 02 Exercise: Parameterize the Task Prompt

## Learning Goal

Keep stable rules in repository instructions while turning variable dimension
details into explicit prompt inputs. A plain Markdown template is reusable text;
it is not automatically a VS Code command.

## Branches

- Start: `Example-01-step-02-start`, from `Example-01-step-01-solution`.
- Solution: `Example-01-step-02-solution`, from this branch.
- Run: `Example-01-step-02-run`, from the solution.

## Assignment

1. Create `prompt-engineering-course/prompts/create-dimension.md` with
   placeholders for model, entity, seed, natural key, surrogate key, included
   and excluded attributes, and a structural reference model.
2. Refer to the step 01 instructions instead of copying their stable rules.
3. Create this step's `prompt.md` by filling the template with the values below.
   Change no other wording.
4. Add a pending run record and a solution containing complete snapshots of all
   changed text files. Exclude the solution from its own snapshot.
5. Do not submit the prompt or run dbt during preparation.

## Inputs

| Input | Value |
|---|---|
| Model | `dim_store` |
| Entity | `store` |
| Seed node | `store` |
| Natural key | `businessentityid` |
| Surrogate key | `store_key` |
| Included attributes | `storename`, `salespersonid` |
| Excluded attribute | `modifieddate` |
| Structural reference | `dim_customer` |

## Manual Run

On the run branch, paste the concrete prompt into a fresh Copilot chat. Make sure
the scoped instruction file is available, and record in References whether it was
included. Capture the generated files, actual command, exit code, and full output
in `run-result.md` after you perform the run.

## Acceptance Checks

- The reusable template contains placeholders, not the store-specific values.
- The filled prompt matches the template after exact substitution.
- Stable conventions remain in the scoped instructions.
- No generated model or passing build is claimed before execution.