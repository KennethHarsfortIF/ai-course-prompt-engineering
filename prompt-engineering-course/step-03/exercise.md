# Step 03 Exercise: Invoke a Reusable Skill

## Learning Goal

Combine the earlier pieces into a repeatable workflow. Instructions hold project
rules, a native VS Code prompt file holds dimension-specific inputs, and an Agent
Skill guides the procedure for carrying out the task.

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
3. Have the skill reference the existing dimension instructions and the native
   prompt file `.github/prompts/dimension-task.prompt.md`. Do not duplicate their
   stable conventions or task wording. Explain that `/dimension-task` runs the
   prompt file while `/create-dimension` runs the workflow skill.
4. Create `prompt.md` with the exact slash invocation and task inputs for
   `dim_store`; add a pending run record and complete solution snapshots.
5. Do not invoke the skill or execute a dbt build during preparation.

## Manual Run and Evidence

On the run branch, use the intended VS Code Copilot chat harness and type the
exact `/create-dimension` invocation from `prompt.md`. Capture the chat exchange
or screenshot showing the explicit command; if the response lists the skill in
References, record that too. The slash invocation demonstrates selection, while
References provide additional evidence that the skill was included.

Inspect which instruction file and prompt file the skill used, review the
generated SQL/YAML, and record actual validation results. Do not claim that
discovery or invocation guarantees compliance or a successful build.

## Acceptance Checks

- Skill frontmatter has a valid matching name and is user-invocable.
- Manual slash invocation is required; automatic skill discovery is disabled.
- The skill composes earlier instructions and prompt file instead of copying them.
- The prompt-file command and skill command have distinct names and roles.
- No skill run, model output, or build result is fabricated.