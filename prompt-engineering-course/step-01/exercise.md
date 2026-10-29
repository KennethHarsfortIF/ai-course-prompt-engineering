# Step 01 Exercise: Store Stable Rules as Instructions

For a guided walkthrough, see [solution.md](solution.md). It includes the full
prepared file contents. Use the run branch for your own work and the demo
branch as a completed reference.

## Learning Goal

Separate dimension conventions that should be reused from the one-time task
details. VS Code custom instructions are guidance that can attach to matching
files; they are not a skill or an execution guarantee.

## Branches

- Start: `Example-01-step-01-start`, from `Example-01-step-00-solution`.
- Run: `Example-01-step-01-run` is your workspace, initially identical to start;
   complete the exercise here.
- Solution: `Example-01-step-01-solution` contains the prepared instructions
   and task prompt as a reference.
- Demo: `Example-01-step-01-demo` contains a completed example with generated
   models and recorded validation results.

## Assignment

1. On the run branch, create `.github/instructions/adventureworks-dimensions.instructions.md`.
   Scope it only to dimension SQL/YAML files under AdventureWorks marts.
2. Move stable naming, seed reference, key, SQL/YAML, schema, and validation
   conventions there. Do not put `dim_store` values in the instructions.
3. Write `prompt.md` with only the dimension task details and a reference to
   those instructions. Keep stable rules out of this prompt.
4. Consult the supplied `solution.md` as needed. Keeping personal observations
   in a `run-result.md` on your run branch is optional, not an acceptance requirement.
5. Do not ask Copilot to make the model or run dbt during preparation.

## Demonstrate Instruction Use

On the run branch, use a fresh VS Code Copilot chat and submit the task prompt.
Afterward, inspect the response's **References** to see whether the instruction
file was included. References prove inclusion, not that every rule was followed.
Check generated code against conventions the short prompt did not spell out.
Review the generated SQL/YAML and actually run the focused dbt validation
described in the shared instructions.

If the instruction is absent, verify the selected chat harness and that
`applyTo` matches the SQL/YAML files Copilot creates. You can attach the file
manually for comparison, but treat that as a manual attachment rather than
evidence of automatic matching.

## Acceptance Checks

- Instructions cover only stable, reusable dimension guidance.
- The task prompt is shorter and has no copied house-rule list.
- No generated model or build result is claimed before manual execution.