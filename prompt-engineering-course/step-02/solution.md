# Step 02 Solution: Reusable prompt template

This solution prepares course materials only. No prompt, skill, model, or dbt build was executed.

The following blocks are complete verbatim copies of every changed text payload introduced by this step, including its start-branch exercise. Inherited unchanged files are not repeated. This solution document is excluded from its own snapshot to avoid recursive self-embedding.

## prompt-engineering-course/step-02/exercise.md

<!-- file: prompt-engineering-course/step-02/exercise.md -->
```text no-final-newline
# Step 02 Exercise: Parameterize the Task Prompt

## Learning Goal

Keep stable rules in repository instructions while turning variable dimension
details into explicit prompt inputs. A plain Markdown template is reusable text;
it is not automatically a VS Code command.

## Branches

- Start: `Example-01-step-02-start`, from `Example-01-step-01-solution`.
- Solution: `Example-01-step-02-solution`, from this branch.
- Run: `Example-01-step-02-run`, from the solution.

## Assignment

1. Create `prompt-engineering-course/prompts/create-dimension.md` with
   placeholders for model, entity, seed, natural key, surrogate key, included
   and excluded attributes, and a structural reference model.
2. Refer to the step 01 instructions instead of copying their stable rules.
3. Create this step's `prompt.md` by filling the template with the values below.
   Change no other wording.
4. Add a pending run record and a solution containing complete snapshots of all
   changed text files. Exclude the solution from its own snapshot.
5. Do not submit the prompt or run dbt during preparation.

## Inputs

| Input | Value |
|---|---|
| Model | `dim_store` |
| Entity | `store` |
| Seed node | `store` |
| Natural key | `businessentityid` |
| Surrogate key | `store_key` |
| Included attributes | `storename`, `salespersonid` |
| Excluded attribute | `modifieddate` |
| Structural reference | `dim_customer` |

## Manual Run

On the run branch, paste the concrete prompt into a fresh Copilot chat. Make sure
the scoped instruction file is available, and record in References whether it was
included. Capture the generated files, actual command, exit code, and full output
in `run-result.md` after you perform the run.

## Acceptance Checks

- The reusable template contains placeholders, not the store-specific values.
- The filled prompt matches the template after exact substitution.
- Stable conventions remain in the scoped instructions.
- No generated model or passing build is claimed before execution.
```

## prompt-engineering-course/step-02/prompt.md

<!-- file: prompt-engineering-course/step-02/prompt.md -->
```text no-final-newline
Follow the applicable instructions in
`.github/instructions/adventureworks-dimensions.instructions.md`.

Create `dim_store`, a dimension for `store`, in
`dbt-dimensional-modelling/adventureworks` from the `store` seed.
Use `businessentityid` as the natural key and `store_key` as the
surrogate key. Include these descriptive attributes: storename, salespersonid.
Exclude these seed attributes: modifieddate.

Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML, validate the requested model, and
show the result.
```

## prompt-engineering-course/step-02/run-result.md

<!-- file: prompt-engineering-course/step-02/run-result.md -->
```text no-final-newline
# Step 02 Run Record

## Status

**Not executed.** The concrete prompt is ready for your manual run. No skill,
prompt, or dbt command has been run; no model files or build output are recorded.

- Run branch: `Example-01-step-02-run`.
- Source: `Example-01-step-02-solution`.
- Concrete prompt: `prompt-engineering-course/step-02/prompt.md`.
- Reusable template: `prompt-engineering-course/prompts/create-dimension.md`.
- Applicable instructions: `.github/instructions/adventureworks-dimensions.instructions.md`.

## Manual Evidence

Use a fresh Copilot chat on this run branch. Submit the concrete prompt, not the
unfilled template. Check the response's References for the instruction file and
record whether it was included. References establish inclusion, not compliance;
check the generated SQL/YAML against the rules.

Record the prompt and context, complete assistant response and generated files,
the actual dbt build command, exit code, and full output. Include failures,
fixes, and reruns. Resolve seed/package prerequisites explicitly; do not reset
the database or edit the seed as part of this exercise.

This run is pending. Keep its generated models and evidence off later start and
solution branches.
```

## prompt-engineering-course/prompts/create-dimension.md

<!-- file: prompt-engineering-course/prompts/create-dimension.md -->
```text no-final-newline
Follow the applicable instructions in
`.github/instructions/adventureworks-dimensions.instructions.md`.

Create `<<model>>`, a dimension for `<<entity>>`, in
`dbt-dimensional-modelling/adventureworks` from the `<<seed>>` seed.
Use `<<natural_key>>` as the natural key and `<<surrogate_key>>` as the
surrogate key. Include these descriptive attributes: <<included_attributes>>.
Exclude these seed attributes: <<excluded_attributes>>.

Use `<<reference_model>>.sql` and `<<reference_model>>.yml` as structural
references. Create the model SQL and YAML, validate the requested model, and
show the result.
```

