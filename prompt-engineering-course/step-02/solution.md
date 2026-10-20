# Step 02 Solution: Reusable prompt template

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## prompt-engineering-course/step-02/exercise.md

<!-- file: prompt-engineering-course/step-02/exercise.md -->
```text no-final-newline
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
```

## prompt-engineering-course/step-02/prompt.md

<!-- file: prompt-engineering-course/step-02/prompt.md -->
````text no-final-newline
# Step 02 Prompt Invocation

In VS Code Copilot Chat, include the task values after `/dimension-task` in
the same message. The `${input:...}` placeholders guide the model; they do not
open separate VS Code input boxes. For this example, send:

```text
/dimension-task model_name=dim_store entity=store seed=store natural_key=businessentityid surrogate_key=store_key included_attributes=storename,salespersonid excluded_attributes=modifieddate reference_model=dim_customer
```

The prompt file is `.github/prompts/dimension-task.prompt.md`; its referenced
instructions contain the stable project conventions.
````

## prompt-engineering-course/step-02/run-result.md

<!-- file: prompt-engineering-course/step-02/run-result.md -->
```text no-final-newline
# Step 02 Run Record

## Status

**Not executed.** The concrete prompt is ready for your manual run. No skill,
prompt, or dbt command has been run; no model files or build output are recorded.

- Run branch: `Example-01-step-02-run`.
- Source: `Example-01-step-02-solution`.
- Invocation record: `prompt-engineering-course/step-02/prompt.md`.
- VS Code prompt file: `.github/prompts/dimension-task.prompt.md`.
- Applicable instructions: `.github/instructions/adventureworks-dimensions.instructions.md`.

## Manual Evidence

Use a fresh VS Code Copilot chat on this run branch. Send the exact invocation
message shown in `prompt.md`. Confirm that the prompt file is available in Agent
Customizations. Check the response's References for the instruction file and
record whether it was included. References establish inclusion, not compliance;
check the generated SQL/YAML against the rules.

Record the prompt and context, complete assistant response and generated files,
the actual dbt build command, exit code, and full output. Include failures,
fixes, and reruns. Resolve seed/package prerequisites explicitly; do not reset
the database or edit the seed as part of this exercise.

This run is pending. Keep its generated models and evidence off later start and
solution branches. Do not confuse this prompt-file invocation with the separate
`/create-dimension` workflow skill introduced in step 03.
```

## .github/prompts/dimension-task.prompt.md

<!-- file: .github/prompts/dimension-task.prompt.md -->
```text no-final-newline
---
name: dimension-task
description: Build a dbt dimension from a seed using supplied task inputs and the repository's scoped dimension instructions.
argument-hint: "model, entity, seed, keys, attributes, reference model"
agent: agent
---

Follow the [AdventureWorks dimension instructions](../instructions/adventureworks-dimensions.instructions.md).

Create `${input:model_name:model name}`, a dimension for
`${input:entity:entity}`, in `dbt-dimensional-modelling/adventureworks` from the
`${input:seed:seed name}` seed. Use `${input:natural_key:natural key column}` as
the natural key and `${input:surrogate_key:surrogate key column}` as the
surrogate key. Include these descriptive attributes:
`${input:included_attributes:included attributes}`. Exclude these seed
attributes: `${input:excluded_attributes:excluded attributes}`.

Use `${input:reference_model:reference model}` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model,
and show the result.
```

