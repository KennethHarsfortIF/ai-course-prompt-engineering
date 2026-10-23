# Step 03 Solution: Replace the Prompt with a Discoverable Skill

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## Branch Stages

- `Example-01-step-03-start`: revised exercise and inherited Step 02 prompt;
   no prepared skill or run artifacts.
- `Example-01-step-03-solution`: prompt replaced by the skill, with an ordinary
   request and pending run record. No generated dimension or claimed run evidence.
- `Example-01-step-03-run`: prepared materials plus actual output and evidence
   only after a real run. It is intentionally pending until then.

Step 02 branches and their snapshots remain unchanged. Prompts and skills are
alternatives here, not required layers. Automatic invocation is enabled, but
discovery and compliance must be observed rather than assumed.

## Deleted File

`.github/prompts/dimension-task.prompt.md` is removed on the solution and run
branches. Its task instructions now live in the skill; input placeholders become
instructions to extract values from the request and ask for missing values.
Use the start branch or Step 02 to inspect the original prompt. The shared
dimension instruction file remains unchanged.

## prompt-engineering-course/step-03/exercise.md

<!-- file: prompt-engineering-course/step-03/exercise.md -->
```text no-final-newline
# Step 03 Exercise: Replace a Prompt with a Discoverable Skill

## Learning Goal

Package the same dimension task from Step 02 as an Agent Skill instead of a
prompt file. Keep the task and shared project rules the same; change how the
agent can find the task instructions. This is an alternative, not another
required layer or a claim that skills always replace prompts.

## Why Use Either?

Prompt files and skills overlap: both can contain reusable task instructions,
and both can be invoked explicitly. In VS Code, prompt files provide interactive
input placeholders and request-level agent, model, and tool configuration.
Skills support discovery from a relevant request and can bundle supporting
resources that are loaded as needed. Resources are optional for this exercise.

If those prompt-specific conveniences are not needed, a skill can replace the
prompt. A skill can also disable automatic invocation with
`disable-model-invocation: true`; manual invocation is not exclusive to prompts.

## Branches

- Start: `Example-01-step-03-start`, from `Example-01-step-02-solution`.
- Solution: `Example-01-step-03-solution`, from the start branch.
- Run: `Example-01-step-03-run`, from its solution.

Keep the inherited prompt and this assignment on the start branch. On the
solution branch, replace the prompt with the skill and prepare the request,
pending run record, and solution snapshots. Execute the request and record any
generated model files and actual evidence on the run branch only. These are
stage responsibilities, not instructions to reset or recreate existing branches.

## Assignment

1. Read `.github/prompts/dimension-task.prompt.md` from Step 02. Move its task
   instructions into `.github/skills/create-dimension/SKILL.md`, then remove the
   prompt file on the solution and run branches. Do not change Step 02 branches
   or their historical solution snapshots.
2. Set the skill name to `create-dimension` and write a description explaining
   when to use it. Set `disable-model-invocation: false` and keep
   `user-invocable: true`. The skill remains available as `/create-dimension`,
   but the main exercise must not use that command.
3. Replace `${input:...}` placeholders with instructions to extract the model,
   entity, seed, keys, attributes, and structural reference from the user's
   request. Ask for missing values. Reference the existing dimension
   instructions for shared rules; do not copy them or depend on the deleted
   prompt file.
4. Create `prompt.md` with an ordinary-language request for the same `dim_store`
   task. Do not name the skill, attach its file, or use a slash command. Add a
   pending run record and complete solution snapshots, including the deletion.
5. Do not execute the dimension task or a dbt build during preparation.

## Manual Run and Evidence

On the run branch, open a fresh VS Code Copilot chat with workspace skills
enabled and submit the exact request from `prompt.md`. Do not preload the skill
or mention it in the request. Capture the request and response plus any available
References or tool trace showing that `SKILL.md` was loaded.

Record skill loading as observed, not observed, or inconclusive. Correct model
output alone does not prove that the skill was used. If automatic loading is not
observed, retain that result. Optionally try `/create-dimension` in a separate
fresh chat and record it as an explicit-invocation comparison, not evidence of
automatic discovery. Preserve any output from the first attempt.

Review the generated SQL/YAML and record actual focused validation results.
Discovery, loading, compliance, and a successful build are separate observations;
none guarantees the others.

## Acceptance Checks

- Start retains the Step 02 prompt; solution and run replace it with the skill.
- The skill has a matching name, a relevant description, and automatic invocation
   enabled; it can still be invoked explicitly.
- No unresolved input placeholders or dependency on the removed prompt remain
   in the skill. Shared dimension conventions stay in the instruction file.
- The main request has the same task inputs as Step 02 and no skill-selection hint.
- The solution snapshot records changed files and the removed prompt.
- Preparation leaves the run record pending; actual discovery, model output, and
   validation evidence are recorded only after a real run.
```

## prompt-engineering-course/step-03/prompt.md

<!-- file: prompt-engineering-course/step-03/prompt.md -->
```text no-final-newline
Create `dim_store`, a dimension for `store`, from the `store` seed in
`dbt-dimensional-modelling/adventureworks`. Use `businessentityid` as the
natural key and `store_key` as the surrogate key. Include `storename` and
`salespersonid`; exclude `modifieddate`. Use `dim_customer` as the structural
reference for SQL and YAML.
```

## prompt-engineering-course/step-03/run-result.md

<!-- file: prompt-engineering-course/step-03/run-result.md -->
```text no-final-newline
# Step 03 Run Record

## Status

**Not executed.** The ordinary-language request has not been submitted. No
automatic skill loading, model output, assistant response, dbt command, exit
code, or build result is recorded. Redesigning these materials is not a run.

- Run branch: `Example-01-step-03-run`.
- Source: `Example-01-step-03-solution`.
- Exact request: `prompt-engineering-course/step-03/prompt.md`.
- Skill: `.github/skills/create-dimension/SKILL.md`.
- Replaced prompt: `.github/prompts/dimension-task.prompt.md` (removed here; retained on the start branch and in Step 02).
- Instructions: `.github/instructions/adventureworks-dimensions.instructions.md`.

## Automatic Discovery Evidence

Use a fresh VS Code Copilot chat on the run branch with workspace skills enabled.
Submit the exact request without a slash command, skill attachment, or hint to
use the skill. Do not use the chat that prepared these materials: it has already
seen the skill and cannot demonstrate independent discovery.

After the actual run, replace these pending fields with observations:

- Chat environment and relevant skill settings: pending.
- Exact request and captured response or screenshot location: pending.
- Automatic skill loading: pending (observed / not observed / inconclusive).
- References or tool trace showing skill loading, if available: pending.
- Shared instruction loading and behavioral compliance: pending.
- Generated SQL/YAML review and changed files: pending.

Correct model output does not prove skill loading. Missing visible evidence
does not prove the skill was not loaded. Keep discovery, loading, compliance,
and build results separate, and report inconclusive observations honestly.

## Optional Explicit Comparison

If automatic loading is not observed, preserve that attempt and optionally use
`/create-dimension` with the same inputs in a separate fresh chat. Record its
request, starting file state, response, and results separately. Do not overwrite
the first attempt's evidence or call explicit invocation automatic discovery.

## Validation Evidence

After the manual run, record the actual focused dbt build command, exit code,
and complete output, including failures, fixes, and reruns. If a source seed,
package, or profile is unavailable, record the blocker; do not broaden the build
or edit seeds to force a result.

Preparation did not invoke the skill or execute dbt. Keep all generated files
and evidence on this run branch only.

## Comparison with Step 02

Step 02 explicitly selects a prompt with interactive input placeholders. Step 03
replaces that file with a skill eligible for selection from a relevant request.
Both mechanisms can express the task; both can be invoked manually. This example
does not need both. Prompt files remain useful when their input UI or request-level
agent, model, and tool configuration is wanted. A manually invoked text-only skill
may otherwise provide little advantage over a prompt file.
```

## .github/skills/create-dimension/SKILL.md

<!-- file: .github/skills/create-dimension/SKILL.md -->
```text
---
name: create-dimension
description: Create or update a dimension in the AdventureWorks dbt project from task-specific inputs. Use when asked to build a dimension from a seed and validate its SQL/YAML model.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Use this workflow when asked to create or update an AdventureWorks dbt dimension
from a seed.

## Resources

- Read the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
  for stable model and validation conventions.

## Workflow

1. Extract the requested model name, entity, seed, natural key, surrogate key,
   included and excluded attributes, and structural reference from the request.
   Ask concise questions only when missing or ambiguous information prevents
   correct implementation; do not guess. An omitted exclusion list means no
   additional exclusions, not a missing required input.
2. Verify that the requested dimension belongs in
   `dbt-dimensional-modelling/adventureworks`. Before editing its SQL/YAML files,
   check for existing user changes and preserve them.
3. Inspect the seed's columns and the reference model's SQL/YAML before
   generating code. Verify that requested source columns exist. Report missing
   columns or unavailable references rather than inventing them.
4. Create or update only the requested dimension SQL and companion schema YAML.
   Use the supplied keys, include the requested descriptive attributes, and omit
   excluded attributes. Use the reference model for structure; if it conflicts
   with the shared dimension instructions, follow the shared instructions.
   Do not edit seeds, other models, profiles, packages, schema macros, or
   unrelated files.
5. Validate the focused model using the project-local DuckDB profile. From the
   AdventureWorks project directory, run
   `dbt build --select <model_name> --profiles-dir . --target duckdb`.
   If prerequisites such as the seed relation or packages are missing, report
   the blocker instead of broadening the command or changing source data.
6. Report changed files, the command actually run, exit status, and concise
   result. If validation was not run, say so; never invent build evidence.
```

