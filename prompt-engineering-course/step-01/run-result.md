# Step 01 Run Record

## Status

**Not executed.** This branch is ready for your manual Copilot run. No model
files, assistant response, dbt command, or build result are present.

- Run branch: `Example-01-step-01-run`.
- Source: `Example-01-step-01-solution`.
- Task prompt: `prompt-engineering-course/step-01/prompt.md`.
- Expected future files: `models/marts/dim_store.sql` and
  `models/marts/dim_store.yml` in the AdventureWorks project.

## Instruction Evidence

Use the intended VS Code Copilot harness in a fresh chat. After submitting the
task, expand **References** under the response and record whether
`.github/instructions/adventureworks-dimensions.instructions.md` is listed.
That shows whether the file was included in the request; it does not prove
Copilot followed every rule. Compare the generated key order, tests,
descriptions, references, and scope against the instruction file.

If you manually attach the instruction file, record that separately from
automatic `applyTo` application. If missing, inspect the selected harness,
customization discovery, and Agent Debug Logs.

## Build Evidence

After the manual run, record the exact prompt/context, complete response, full
generated SQL/YAML, dbt build command, exit code, and full output. Note any
failures, fixes, and reruns. Do not mark the build successful until it passes.

No prompt or build was run during course preparation. Do not carry generated
files into later solution/start branches.