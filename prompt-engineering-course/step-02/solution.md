# Step 02 Solution: Reusable prompt template

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

## File Index

| Status | File | Purpose |
|---|---|---|
| Updated | `prompt-engineering-course/step-02/exercise.md` | Assignment and branch workflow |
| Added | `prompt-engineering-course/step-02/prompt.md` | Example prompt-file invocation |
| Optional template | `prompt-engineering-course/step-02/run-result.md` | Suggested personal notes; not a supplied or required file |
| Added | `.github/prompts/dimension-task.prompt.md` | Reusable prompt template with task inputs |

The sections below contain the complete prepared contents of every added or
updated text file. Inherited unchanged files are not repeated. This solution
document is excluded from its own snapshot to avoid recursive self-embedding.
The optional notes template is separate from these file snapshots.

Work on `Example-01-step-02-run`, initially identical to the start branch.
Use the solution branch for the prepared prompt file and invocation example,
and the demo branch for a completed example with generated models and validation results.

## prompt-engineering-course/step-02/exercise.md

<!-- file: prompt-engineering-course/step-02/exercise.md -->
```text no-final-newline
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

## Optional Run Notes

Keeping a personal run record is optional, not an acceptance requirement. If
useful, create `prompt-engineering-course/step-02/run-result.md` on your run
branch using this template. No run-record file is supplied by the solution.

<!-- optional-template: prompt-engineering-course/step-02/run-result.md -->
```text
# Step 02 Optional Run Notes

## Observations

- Invocation and supplied task values:
- Prompt availability and instruction inclusion:
- Generated model review:
- Validation command and actual outcome:
- Errors, fixes, or questions:
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

