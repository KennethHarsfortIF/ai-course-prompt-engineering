# Step 03 Solution: Invocable skill workflow

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## prompt-engineering-course/step-03/exercise.md

<!-- file: prompt-engineering-course/step-03/exercise.md -->
```text no-final-newline
# Step 03 Exercise: Invoke a Reusable Skill

## Learning Goal

Combine the earlier pieces into a repeatable workflow. Instructions hold project
rules, a template holds dimension-specific inputs, and an Agent Skill guides the
procedure for carrying out the task.

## Branches

- Start: `Example-01-step-03-start`, from `Example-01-step-02-solution`.
- Solution: `Example-01-step-03-solution`, from this branch.
- Run: `Example-01-step-03-run`, from its solution.

## Assignment

1. Create `.github/skills/create-dimension/SKILL.md` using the VS Code project
   skill format. The directory and frontmatter `name` must both be
   `create-dimension`.
2. Make it an explicit slash command, and disable automatic model invocation so
   the exercise can demonstrate a deliberate `/create-dimension` invocation.
3. Have the skill reference the existing dimension instructions and reusable
   task template. Do not duplicate their stable conventions or task wording.
4. Create `prompt.md` with the exact slash invocation and task inputs for
   `dim_store`; add a pending run record and complete solution snapshots.
5. Do not invoke the skill or execute a dbt build during preparation.

## Manual Run and Evidence

On the run branch, use the intended VS Code Copilot chat harness and type the
exact `/create-dimension` invocation from `prompt.md`. Capture the chat exchange
or screenshot showing the explicit command; if the response lists the skill in
References, record that too. The slash invocation demonstrates selection, while
References provide additional evidence that the skill was included.

Inspect which instruction file and template the skill used, review the generated
SQL/YAML, and record actual validation results. Do not claim that discovery or
invocation guarantees compliance or a successful build.

## Acceptance Checks

- Skill frontmatter has a valid matching name and is user-invocable.
- Manual slash invocation is required; automatic skill discovery is disabled.
- The skill composes earlier instructions and template instead of copying them.
- No skill run, model output, or build result is fabricated.
```

## prompt-engineering-course/step-03/prompt.md

<!-- file: prompt-engineering-course/step-03/prompt.md -->
```text no-final-newline
/create-dimension Create `dim_store` from the `store` seed in
`dbt-dimensional-modelling/adventureworks`. Use `businessentityid` as the
natural key and `store_key` as the surrogate key. Include `storename` and
`salespersonid`; exclude `modifieddate`. Use `dim_customer` as the structural
reference.
```

## prompt-engineering-course/step-03/run-result.md

<!-- file: prompt-engineering-course/step-03/run-result.md -->
```text no-final-newline
# Step 03 Run Record

## Status

**Not executed.** The `/create-dimension` skill has not been invoked. No model,
assistant response, dbt command, exit code, or build result is recorded.

- Run branch: `Example-01-step-03-run`.
- Source: `Example-01-step-03-solution`.
- Exact invocation: `prompt-engineering-course/step-03/prompt.md`.
- Skill: `.github/skills/create-dimension/SKILL.md`.
- Instructions: `.github/instructions/adventureworks-dimensions.instructions.md`.
- Template: `prompt-engineering-course/prompts/create-dimension.md`.

## Manual Skill Evidence

In VS Code Copilot chat, confirm the workspace skill is discovered, then type
the exact slash invocation in a fresh chat on this run branch. Capture the
invocation and response. If the response exposes the skill and instruction in
References, record those references; distinguish discovery, explicit
invocation, inclusion, and behavioral compliance rather than treating them as
the same proof.

Review whether the skill read and followed the scoped instructions and filled
the reusable template with the requested values. Check the generated SQL/YAML
against the output columns and schema requirements.

## Validation Evidence

After the manual run, record the actual focused dbt build command, exit code,
and complete output, including failures, fixes, and reruns. If a source seed,
package, or profile is unavailable, record the blocker; do not broaden the build
or edit seeds to force a result.

Preparation did not invoke the skill or execute dbt. Keep all generated files
and evidence on this run branch only.
```

## .github/skills/create-dimension/SKILL.md

<!-- file: .github/skills/create-dimension/SKILL.md -->
```text no-final-newline
---
name: create-dimension
description: Create or update a dimension in the AdventureWorks dbt project from task-specific inputs. Use when asked to build a dimension from a seed and validate its SQL/YAML model.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: true
---

# Create a Dimension

Use this workflow when the user explicitly invokes `/create-dimension`.
Automatic skill invocation is disabled for this course so the learner can see
and record the slash command.

## Resources

- Read the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
  for stable model and validation conventions.
- Read the [dimension task template](../../../prompt-engineering-course/prompts/create-dimension.md)
  for the task request structure.

Do not copy the full instruction list or template text into a second reusable
source. Resolve their relative paths from this skill directory.

## Workflow

1. Extract the requested model name, entity, seed, natural key, surrogate key,
   included and excluded attributes, and structural reference from the invocation.
   Ask concise questions for any missing values; do not guess.
2. Confirm the task is in `dbt-dimensional-modelling/adventureworks` and that
   the requested model files do not contain unrelated user work.
3. Fill every placeholder in the task template with the supplied values. Keep
   the instruction reference intact and do not leave unresolved placeholders.
4. Implement only the requested dimension SQL and its companion schema YAML.
   Do not edit seed data, other dimensions, facts, profiles, package versions,
   schema macros, or unrelated files. Preserve existing user changes.
5. Validate the focused model using the project-local DuckDB profile. From the
   AdventureWorks project directory, run
   `dbt build --select <model_name> --profiles-dir . --target duckdb`.
   If prerequisites such as the seed relation or packages are missing, report
   the blocker instead of broadening the command or changing source data.
6. Report changed files, the command actually run, exit status, and concise
   result. If validation was not run, say so; never invent build evidence.

## Example Invocation

`/create-dimension Create dim_store from the store seed. Use businessentityid as
the natural key and store_key as the surrogate key. Include storename and
salespersonid; exclude modifieddate. Use dim_customer as the structural reference.`
```

