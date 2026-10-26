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
3. Replace `${input:...}` placeholders with instructions to extract the same
   values from the user's request: model, entity, seed, keys, attributes, and
   structural reference. Ask about any missing or ambiguous value before acting;
   never guess. Reference the existing dimension instructions instead of copying
   the shared rules. Do not add a different modeling or validation workflow.
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