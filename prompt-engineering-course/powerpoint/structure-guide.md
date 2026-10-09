# Course Structure and Branch Guide

## Learning Progression

The course uses one AdventureWorks dimension task to compare four forms of
prompt reuse:

| Step | Mechanism | Reusable content |
|---|---|---|
| 00 | One big prompt | Project conventions and the particular task are mixed together. |
| 01 | Scoped instructions | Stable dimension conventions attach to matching model files. |
| 02 | Prompt file | A native VS Code prompt exposes task inputs and can be invoked directly. |
| 03 | Agent Skill | A slash-invoked workflow composes the instructions and prompt file. |

The task throughout is to create `dim_store` from the `store` seed. No model is
generated during course preparation; run branches are intentionally left for
the learner.

## Folder Map

```text
.github/
  instructions/adventureworks-dimensions.instructions.md
  skills/create-dimension/SKILL.md
  prompts/dimension-task.prompt.md
prompt-engineering-course/
  00-big-prompt.md                         # original baseline; unchanged
  step-00/{exercise,prompt,solution,run-result}.md
  step-01/{exercise,prompt,solution,run-result}.md
  step-02/{exercise,prompt,solution,run-result}.md
  step-03/{exercise,prompt,solution,run-result}.md
  powerpoint/                              # separate presentation branch content
```

This map describes the cumulative solution branch. Each step's run branch is
created from that solution, and any learner-generated files belong only there.

## Branch Lineage

```text
main
`-- Example-01-step-00-start
    `-- Example-01-step-00-solution
        |-- Example-01-step-00-run
        `-- Example-01-step-01-start
            `-- Example-01-step-01-solution
                |-- Example-01-step-01-run
                `-- Example-01-step-02-start
                    `-- Example-01-step-02-solution
                        |-- Example-01-step-02-run
                        `-- Example-01-step-03-start
                            `-- Example-01-step-03-solution
                                `-- Example-01-step-03-run
`-- powerpoint
```

The previous course branches were removed and recreated with `start` suffixes.
All branches are local. `main` is unchanged and no branch is pushed. Each next
start branch begins at the preceding solution, never at a run branch. A run
branch initially points at its matching solution; no run output is fabricated.
The fresh `powerpoint` branch begins directly at `main` and contains only
presentation inputs, committed separately from the course exercise branches.

## What Each Mechanism Does

- **Instructions:** `.github/instructions/adventureworks-dimensions.instructions.md`
  defines durable dimension conventions and narrows automatic inclusion to
  matching SQL/YAML files. A References entry shows inclusion, not compliance.
- **Prompt file:** `.github/prompts/dimension-task.prompt.md` holds changing task
  inputs as VS Code `${input:...}` variables. In a compatible VS Code Copilot
  harness, it appears in Agent Customizations and runs as `/dimension-task`.
- **Skill:** `.github/skills/create-dimension/SKILL.md` is a project skill.
  It is user-invocable and model auto-invocation is disabled so the learner can
  demonstrate `/create-dimension` explicitly. The skill references the
  instructions and prompt-file input schema rather than duplicating them.
  `/dimension-task` runs the reusable prompt; `/create-dimension` runs the
  multi-step workflow.

## Slide Input Files

On this branch, provide `step-00.md` through `step-03.md` to Copilot in
PowerPoint. Each file has a rationale, slide sequence, source branch and commit,
exact prompt or skill invocation, and full literal contents of the step's
changed exercise/solution files. Complete `solution.md` snapshots are included;
each solution excludes only itself to avoid recursive embedding. Longer outer
fences preserve nested Markdown code blocks. Source markers identify the branch
and exact path for comparison.

Each slide document is committed separately. Verify embedded content against
the source branch Git blobs, not a working-tree copy, to avoid Windows newline
conversion differences. Do not invent model output or successful build results.

## Manual Run Boundary

Only on the corresponding run branch, the learner opens a fresh Copilot chat
and uses that step's exact prompt. For step 02, invoke `/dimension-task` and
provide its requested values. For step 03, invoke `/create-dimension`.
Capture the response, generated SQL/YAML, actual validation command, exit code,
and full output in that step's run record. For step 01, check References to see
whether the instruction file was included. For step 03, distinguish the explicit
slash invocation from discovery, inclusion, and whether the generated code
actually followed the guidance.

All run records remain **Not executed** until the learner performs those tasks.
The focused future build is documented in course materials, but no prompt, skill,
or dbt build was run while preparing the branches.