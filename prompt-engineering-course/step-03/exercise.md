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