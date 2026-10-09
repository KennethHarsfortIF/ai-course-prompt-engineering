# Step 02 Exercise: Parameterize the Task Prompt

## Learning Goal

Keep stable rules in repository instructions while turning variable dimension
details into explicit inputs in a native VS Code prompt file. The prompt file
appears in Agent Customizations and can be invoked separately from a workflow
skill.

## Branches

- Start: `Example-01-step-02-start`, from `Example-01-step-01-solution`.
- Solution: `Example-01-step-02-solution`, from this branch.
- Run: `Example-01-step-02-run`, from the solution.

## Assignment

1. Create `.github/prompts/dimension-task.prompt.md` with prompt-file frontmatter
   and `${input:name:placeholder}` fields for model, entity, seed, natural key,
   surrogate key, included and excluded attributes, and a reference model.
   Give it a slash name distinct from the step 03 skill.
2. Refer to the step 01 instructions instead of copying their stable rules.
3. Create this step's `prompt.md` with the prompt-file slash invocation and the
   concrete values below, in the order requested by the input fields.
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

On the run branch, invoke the prompt file in a fresh VS Code Copilot chat and
fill in each requested value. Make sure the scoped instruction file is available,
and record in References whether it was included. Capture the generated files,
actual command, exit code, and full output in `run-result.md` after you perform
the run.

## Acceptance Checks

- The native prompt file appears in Agent Customizations and has input fields.
- The concrete invocation supplies the store-specific values in the right order.
- Stable conventions remain in the scoped instructions.
- No generated model or passing build is claimed before execution.