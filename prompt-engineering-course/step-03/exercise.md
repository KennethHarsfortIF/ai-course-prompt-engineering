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