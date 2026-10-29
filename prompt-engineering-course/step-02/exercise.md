# Step 02 Exercise: Parameterize the Task Prompt

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents. Use the run branch for your own work and the demo
branch as a completed reference.

## Learning Goal

Keep stable rules in repository instructions while turning variable dimension
details into explicit inputs in a native VS Code prompt file. The prompt file
appears in Agent Customizations and can be invoked separately from a workflow
skill.

## Branches

- Start: `Example-01-step-02-start`, from `Example-01-step-01-solution`.
- Run: `Example-01-step-02-run` is your workspace, initially identical to start;
   complete the exercise here.
- Solution: `Example-01-step-02-solution` contains the prepared prompt file
   and invocation example as a reference.
- Demo: `Example-01-step-02-demo` contains a completed example with generated
   models and recorded validation results.

## Assignment

1. On the run branch, create `.github/prompts/dimension-task.prompt.md` with prompt-file frontmatter
   and `${input:name:placeholder}` fields for model, entity, seed, natural key,
   surrogate key, included and excluded attributes, and a reference model.
   Give it a slash name distinct from the step 03 skill.
2. Refer to the step 01 instructions instead of copying their stable rules.
3. Create this step's `prompt.md` with the prompt-file slash invocation and the
   concrete values below, in the order requested by the input fields.
4. Consult the supplied `solution.md` as needed. Keeping personal observations
   in a `run-result.md` on your run branch is optional, not an acceptance requirement.
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

After preparing the files on your run branch, open a fresh VS Code Copilot chat.
Send the slash-command message with concrete task values as shown in `prompt.md`;
do not assume separate input boxes will appear. Confirm the prompt file is
available in Agent Customizations and inspect References for the scoped
instruction file. References show inclusion, not that every rule was followed.
Review the generated SQL/YAML and actually run the focused dbt validation
described in the shared instructions. Keeping notes about these checks is optional.

## Acceptance Checks

- The native prompt file appears in Agent Customizations and has input fields.
- The concrete invocation supplies the store-specific values in the right order.
- Stable conventions remain in the scoped instructions.
- No generated model or passing build is claimed before execution.