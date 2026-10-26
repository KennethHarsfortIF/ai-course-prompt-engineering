# Step 03 Solution: Package the Same Task as a Skill

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

## File Index

| Status | File | Purpose |
|---|---|---|
| Updated | `prompt-engineering-course/step-03/exercise.md` | Same-task comparison and branch workflow |
| Added | `prompt-engineering-course/step-03/prompt.md` | Plain-language request for the manual run |
| Added | `prompt-engineering-course/step-03/run-result.md` | Pending evidence record for the run branch |
| Added | `.github/skills/create-dimension/SKILL.md` | Same dimension task, with values extracted from the request |
| Deleted | `.github/prompts/dimension-task.prompt.md` | Replaced by the skill on solution and run branches |

The sections below contain the complete prepared contents of every added or
updated text file. Inherited unchanged files are not repeated. This solution
document is excluded from its own snapshot to avoid recursive self-embedding.

## Branch Stages

- `Example-01-step-03-start`: keeps the original Step 02 prompt and updated
   exercise; no skill or run artifacts are added.
- `Example-01-step-03-solution`: packages the same task as a skill and adds an
   ordinary-language request plus a pending run record.
- `Example-01-step-03-run`: records the real manual test and evidence only after
   it happens; the prepared run record remains pending until then.

Step 02 branches and their snapshots remain unchanged. The task and shared
dimension rules stay the same; only packaging and input handling change.
Automatic invocation is enabled, but discovery must be observed rather than
assumed.

## Deleted File

`.github/prompts/dimension-task.prompt.md` is removed on the solution and run
branches. Its task instructions now live in the skill. Input placeholders become
instructions to extract the same values from the request and ask about anything
missing or ambiguous; the skill must never guess. Use the start branch or Step 02
to inspect the original prompt. Shared dimension rules remain in the existing
instruction file.

## prompt-engineering-course/step-03/exercise.md

<!-- file: prompt-engineering-course/step-03/exercise.md -->
```text no-final-newline
# Step 03 Exercise: Package the Same Task as a Skill

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents; the run branch is where you capture real Copilot and
validation evidence.

## Learning Goal

In Step 02, the dimension task was packaged as a prompt file with input
placeholders. Now package that same task as an Agent Skill. Keep the requested
model, task details, and shared dimension rules unchanged. The comparison is
about how Copilot finds the instructions, not a new modeling workflow.

## Why Use Either?

Prompt files and skills overlap, and both can be invoked explicitly. Prompt
files can provide input placeholders and request-level agent, model, and tool
configuration. Skills can be discovered from a relevant request and can bundle
optional resources. This exercise keeps the task constant to focus on that
difference; correct output alone does not prove a skill was discovered.

## Branches

- Start: `Example-01-step-03-start`, from `Example-01-step-02-solution`.
- Solution: `Example-01-step-03-solution`, from the start branch.
- Run: `Example-01-step-03-run`, from its solution.

Keep the original Step 02 prompt on the start branch. On the solution branch,
replace it with the skill and prepare the ordinary-language request, pending
run record, and solution snapshots. Test the request and record actual evidence
on the run branch only. These are stage responsibilities, not instructions to
reset or recreate existing branches.

## Assignment

1. Read `.github/prompts/dimension-task.prompt.md` from Step 02. Package the same
   task instructions in `.github/skills/create-dimension/SKILL.md`; keep the task
   and shared rules equivalent. Remove the prompt file on the solution and run
   branches only. Do not change Step 02 branches or historical snapshots.
2. Set the skill name to `create-dimension` and write a description explaining
   when to use it. Set `disable-model-invocation: false` and keep
   `user-invocable: true`. The skill remains available as `/create-dimension`,
   but the main exercise must not use that command.
3. Replace each `${input:...}` placeholder with an instruction to extract that
   value from the user's request, then keep the prompt's explicit mapping:
   create `<model>` as a dimension for `<entity>` from `<seed>`; use
   `<natural_key>` as the natural key and `<surrogate_key>` as the surrogate;
   include `<included_attributes>` and exclude `<excluded_attributes>`; use
   `<reference_model>` for both SQL and YAML. Ask about missing or ambiguous
   values before acting; never guess. Refer to the shared dimension instructions
   instead of copying those rules.
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
- The task and shared dimension rules stay the same; only packaging and input
   handling change.
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
description: Create an AdventureWorks dbt dimension from a seed using the task values in the user's request.
argument-hint: "model, entity, seed, keys, attributes, reference model"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Follow the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
for the shared model and validation conventions.

Identify each task value in the user's request: model name, entity, seed, natural
key, surrogate key, included attributes, excluded attributes, and structural
reference. If a value is missing or ambiguous, ask the user before proceeding.
Never guess.

Create `<model_name>`, a dimension for `<entity>`, in
`dbt-dimensional-modelling/adventureworks` from the `<seed>` seed. Use
`<natural_key>` as the natural key and `<surrogate_key>` as the surrogate key.
Include `<included_attributes>` as descriptive attributes and exclude
`<excluded_attributes>`. Use `<reference_model>` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model
according to the shared instructions, and show the result.
```

