# PowerPoint Input: Step 02

Create a short instructional slide deck for developers learning prompt engineering with GitHub Copilot in VS Code. Include presenter notes. Use the full literal source files below; do not invent execution results or abbreviate the appendix content.

## Why This Change

Make changing task values explicit in a native VS Code prompt file. It appears in Agent Customizations and exposes fields for the model, seed, keys, and attributes, while the stable conventions remain in instructions.

## Slide Sequence

1. Learning goal and the friction in the previous stage.
2. Start branch, inherited materials, and exercise.
3. Solution: show which artifact carries conventions, task values, or workflow.
4. Exact prompt or skill invocation and manual-run handoff.
5. Evidence to check, limitations, and next stage.

## Branches and Run Status

Start: `Example-01-step-02-start` at `67d852152e00c9d62397f4dbf52282d9a790563c`.

Solution: `Example-01-step-02-solution` at `992898d68be30d4890e2d0abe31dc6b981b1b416`.

Run: `Example-01-step-02-run`, based on the solution. No prompt, skill, or dbt build has been executed. Its record is pending manual work. Expected task only: create dim_store from store with natural key businessentityid, surrogate key store_key, attributes storename and salespersonid, excluding modifieddate. This is not observed output.

No AdventureWorks project files were changed during preparation; no generated models are included. Blocks below include the exact solution prompt and complete contents of every changed step file, plus the full solution snapshot. The solution snapshot excludes itself to prevent recursion.

## Full Source: prompt-engineering-course/step-02/exercise.md

<!-- source: Example-01-step-02-start|prompt-engineering-course/step-02/exercise.md -->
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

## Full Source: prompt-engineering-course/step-02/prompt.md

<!-- source: Example-01-step-02-solution|prompt-engineering-course/step-02/prompt.md -->
```text no-final-newline
# Step 02 Prompt Invocation

In a VS Code Copilot chat, invoke `/dimension-task`. The workspace prompt file
will ask for these task inputs:

| Input | Value |
|---|---|
| `model_name` | `dim_store` |
| `entity` | `store` |
| `seed` | `store` |
| `natural_key` | `businessentityid` |
| `surrogate_key` | `store_key` |
| `included_attributes` | `storename, salespersonid` |
| `excluded_attributes` | `modifieddate` |
| `reference_model` | `dim_customer` |

The prompt file is `.github/prompts/dimension-task.prompt.md`; its referenced
instructions contain the stable project conventions.
```

## Full Source: prompt-engineering-course/step-02/run-result.md

<!-- source: Example-01-step-02-solution|prompt-engineering-course/step-02/run-result.md -->
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

Use a fresh VS Code Copilot chat on this run branch. Type `/dimension-task` and
fill in the eight inputs listed in `prompt.md`. Confirm that the prompt file is
available in Agent Customizations. Check the response's References for the
instruction file and record whether it was included. References establish
inclusion, not compliance; check the generated SQL/YAML against the rules.

Record the prompt and context, complete assistant response and generated files,
the actual dbt build command, exit code, and full output. Include failures,
fixes, and reruns. Resolve seed/package prerequisites explicitly; do not reset
the database or edit the seed as part of this exercise.

This run is pending. Keep its generated models and evidence off later start and
solution branches. Do not confuse this prompt-file invocation with the separate
`/create-dimension` workflow skill introduced in step 03.
```

## Full Source: .github/prompts/dimension-task.prompt.md

<!-- source: Example-01-step-02-solution|.github/prompts/dimension-task.prompt.md -->
```text no-final-newline
---
name: dimension-task
description: Build a dbt dimension from a seed using supplied task inputs and the repository's scoped dimension instructions.
argument-hint: "model, entity, seed, keys, attributes, reference model"
agent: agent
---

Follow the [AdventureWorks dimension instructions](../instructions/adventureworks-dimensions.instructions.md).

Create `${input:model_name:dim_store}`, a dimension for
`${input:entity:store}`, in `dbt-dimensional-modelling/adventureworks` from the
`${input:seed:store}` seed. Use `${input:natural_key:businessentityid}` as the
natural key and `${input:surrogate_key:store_key}` as the surrogate key.
Include these descriptive attributes: `${input:included_attributes:storename, salespersonid}`.
Exclude these seed attributes: `${input:excluded_attributes:modifieddate}`.

Use `${input:reference_model:dim_customer}` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model,
and show the result.
```

## Full Source: prompt-engineering-course/step-02/solution.md

<!-- source: Example-01-step-02-solution|prompt-engineering-course/step-02/solution.md -->
````text
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
```text no-final-newline
# Step 02 Prompt Invocation

In a VS Code Copilot chat, invoke `/dimension-task`. The workspace prompt file
will ask for these task inputs:

| Input | Value |
|---|---|
| `model_name` | `dim_store` |
| `entity` | `store` |
| `seed` | `store` |
| `natural_key` | `businessentityid` |
| `surrogate_key` | `store_key` |
| `included_attributes` | `storename, salespersonid` |
| `excluded_attributes` | `modifieddate` |
| `reference_model` | `dim_customer` |

The prompt file is `.github/prompts/dimension-task.prompt.md`; its referenced
instructions contain the stable project conventions.
```

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

Use a fresh VS Code Copilot chat on this run branch. Type `/dimension-task` and
fill in the eight inputs listed in `prompt.md`. Confirm that the prompt file is
available in Agent Customizations. Check the response's References for the
instruction file and record whether it was included. References establish
inclusion, not compliance; check the generated SQL/YAML against the rules.

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

Create `${input:model_name:dim_store}`, a dimension for
`${input:entity:store}`, in `dbt-dimensional-modelling/adventureworks` from the
`${input:seed:store}` seed. Use `${input:natural_key:businessentityid}` as the
natural key and `${input:surrogate_key:store_key}` as the surrogate key.
Include these descriptive attributes: `${input:included_attributes:storename, salespersonid}`.
Exclude these seed attributes: `${input:excluded_attributes:modifieddate}`.

Use `${input:reference_model:dim_customer}` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model,
and show the result.
```

````

