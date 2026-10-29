# Step 03 Exercise: Package the Same Task as a Skill

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents. Use the run branch for your own work and the demo
branch as a completed reference.

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
- Run: `Example-01-step-03-run` is your workspace, initially identical to start;
   complete the exercise here.
- Solution: `Example-01-step-03-solution` contains the prepared skill and
   ordinary-language request as a reference.
- Demo: `Example-01-step-03-demo` contains a completed example with generated
   models and recorded validation results.

The start and fresh run branches retain the original Step 02 prompt. During
the assignment, replace that prompt with the skill on your run branch, then
test the ordinary-language request there. Leave the start, solution, and demo
reference branches unchanged; do not reset or recreate them.

## Assignment

1. Read `.github/prompts/dimension-task.prompt.md` from Step 02. Package the same
   task instructions in `.github/skills/create-dimension/SKILL.md`; keep the task
   and shared rules equivalent. Replace the prompt file with the skill on your
   run branch only. Leave Step 02 task files and prior task examples unchanged.
2. Set the skill name to `create-dimension` and write a description explaining
   when to use it. Set `disable-model-invocation: false` and keep
   `user-invocable: true`. The skill remains available as `/create-dimension`,
   but the main exercise must not use that command.
3. Replace each `${input:...}` placeholder with an instruction to extract that
   value from the user's request, then keep the prompt's explicit mapping:
   create `<model_name>`, a dimension for `<entity>`, from `<seed>`; use
   `<natural_key>` as the natural key and `<surrogate_key>` as the surrogate;
   include `<included_attributes>` and exclude `<excluded_attributes>`; use
   `<reference_model>` for both SQL and YAML. Ask about missing or ambiguous
   values before acting; never guess. Refer to the shared dimension instructions
   instead of copying those rules.
4. Create `prompt.md` with an ordinary-language request for the same `dim_store`
   task. Do not name the skill, attach its file, or use a slash command. Consult
   the supplied `solution.md` as needed; personal `run-result.md` notes are optional.
5. Do not execute the dimension task or a dbt build during preparation.

## Manual Run and Checks

On the run branch, open a fresh VS Code Copilot chat with workspace skills
enabled and submit the exact request from `prompt.md`. Do not preload the skill
or mention it in the request. Inspect any available References or tool trace
for evidence that `SKILL.md` was loaded.

Assess skill loading as observed, not observed, or inconclusive. Correct model
output alone does not prove that the skill was used. If automatic loading is not
observed, do not claim that it occurred. Optionally try `/create-dimension` in a
separate fresh chat and treat it as an explicit-invocation comparison, not
evidence of automatic discovery.

Review the generated SQL/YAML and actually run the focused dbt validation
described in the shared instructions. Keeping a personal record of observations
and validation outcomes is optional, not an acceptance requirement.
Discovery, loading, compliance, and a successful build are separate observations;
none guarantees the others.

## Acceptance Checks

- Start retains the Step 02 prompt. On your run branch, replace it with the skill
   during the assignment; solution and demo show the prepared packaging.
- The skill has a matching name, a relevant description, and automatic invocation
   enabled; it can still be invoked explicitly.
- The task and shared dimension rules stay the same; only packaging and input
   handling change.
- No unresolved input placeholders or dependency on the removed prompt remain
   in the skill. Shared dimension conventions stay in the instruction file.
- The main request has the same task inputs as Step 02 and no skill-selection hint.
- The skill and ordinary-language request are prepared before the manual test.
- Discovery claims and validation outcomes are based on actual observations,
  not assumed from correct-looking output. Written notes are optional.