# PowerPoint Input: Course Introduction and Example

Create an introductory slide deck for developers learning prompt engineering with GitHub Copilot in VS Code. The deck introduces the AdventureWorks dimensional-modelling example, explains how the course's Git branches are organized, and presents the original all-in-one prompt in full across multiple slides. Include concise presenter notes on every slide.

## Audience and Purpose

Assume the audience understands basic SQL and has heard of Git, but may be new to dbt, dimensional modelling, or prompt engineering. Explain only the terms needed to understand this example. This is the opening of a hands-on course, not a sales presentation. Use a clear technical teaching style, restrained colors, legible typography, and simple diagrams. Keep code and prompt text readable; do not shrink it to fit. Use multiple slides for long text rather than omitting or paraphrasing it.

## Slide Sequence

1. **Title and question:** “From One Big Prompt to Reusable Guidance.” Introduce the course question: how can we keep stable project rules reusable while making each Copilot task concise?
2. **The project:** Introduce the AdventureWorks dbt project. Explain that raw data is supplied as seeds, transformations create dimensional marts, and DuckDB is the database used by this tutorial. Keep the focus on the example rather than general dbt instruction.
3. **The business-modeling example:** Explain that the course creates a `dim_store` dimension from the `sales.store` seed. Show the intended fields: natural key `businessentityid`, generated surrogate key `store_key`, attributes `storename` and `salespersonid`; `modifieddate` is intentionally left out. Distinguish the source seed from the resulting dimension.
4. **The baseline approach:** Explain that the original prompt puts durable project conventions and one-time `dim_store` task details together in one message. This is the course's starting point, not the recommended final workflow. Preview the tension: easy to start, but repetitive and prone to copied rules drifting.
5. **Course branch map:** Draw a clear Git branch diagram using these exact local branch names and ancestry:

   ```text
   main
   |-- powerpoint                         (presentation inputs; separate branch)
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
   ```

   Make the diagram visually readable, not a screenshot of this text. Explain that `powerpoint` branches directly from `main` and contains presentation inputs; the exercise sequence is a separate lineage.
6. **How to read the branch workflow:** Explain the three roles: `start` is the exercise state, `solution` contains the prepared answer, and `run` is where the learner manually tries the step and records real evidence. Each next `start` branches from the preceding `solution`, never from a `run` branch. Run branches are based on their matching solution and are intentionally kept separate so learner-generated output does not contaminate later prepared steps. All branches are local; none is pushed.
7. **The original prompt, part 1:** Show the first consecutive portion of the exact prompt below, beginning “I'm working in dbt-dimensional-modelling/adventureworks” and ending with the surrogate-key generation convention. Label it as the original baseline prompt. Preserve its wording and code exactly.
8. **The original prompt, part 2:** Continue with the next consecutive portion, from the seed-reference convention through the `dbt build` validation convention. Preserve its wording and code exactly. Do not omit rules or condense bullets.
9. **The original prompt, part 3:** Continue with the final consecutive task request, from “Now, using those conventions” through “show me the result.” Preserve its wording and code exactly. Indicate in presenter notes that slides 7–9 together reproduce the full prompt from beginning to end.
10. **What happens next:** Summarize the course progression: Step 00 starts with one big prompt; Step 01 moves stable, file-scoped guidance into custom instructions; Step 02 makes changing task inputs reusable in a prompt file; Step 03 composes the workflow in an Agent Skill. Set the expectation that prompt execution, generated model files, and dbt validation belong to the learner's run branch and must not be claimed as completed before they actually happen.

## Accuracy Requirements

- Reproduce the complete prompt in the source block below across slides 7–9. Keep its original wording and ordering; do not silently correct or rewrite it. It may be line-wrapped for slide layout.
- Do not invent Copilot responses, generated SQL/YAML, successful builds, or other execution evidence. This deck introduces the example; it does not perform the exercise.
- Branch names, parent-child relationships, and workflow claims must match the map and explanations above.
- The `powerpoint` branch is separate from the exercise lineage and begins at `main`.
- Distinguish the conceptual task (what the prompt asks for) from observed implementation or validation (which has not happened in this introductory material).

## Complete Original Prompt

Source: `prompt-engineering-course/00-big-prompt.md`, the text inside its `text` code fence.

````text
I'm working in dbt-dimensional-modelling/adventureworks, a dbt project on DuckDB that
implements a Kimball-style dimensional model for AdventureWorks (raw seeds in
seeds/**, marts in models/marts/**).

Project conventions you must follow:
- Dimension models live in models/marts/ and are named dim_<entity>.sql, with a
  matching dim_<entity>.yml schema file in the same folder.
- Every dimension has a surrogate key as the first column, generated with
  {{ dbt_utils.generate_surrogate_key(['<natural_key_column>']) }} and aliased as
  <entity>_key.
- Source seeds are referenced with {{ ref('<seed_name>') }}, never hardcoded table
  names, and staged into CTEs named stg_<seed_name> before the final select.
- Column names are snake_case and lowercase, matching the seed's raw column names
  (no camelCase passthrough).
- The final select must list the surrogate key first, then the natural key(s),
  then descriptive attributes - no `select *`.
- Every model needs a companion .yml with `version: 2`, a `models:` entry named
  after the model, and a `columns:` list. The surrogate key column must have
  `tests: [unique, not_null]`. The natural key column must have
  `tests: [unique, not_null]`. Every column should have a short `description`.
- Style: 4-space indent, one column per line, trailing commas omitted on the last
  column, lowercase SQL keywords.
- After creating or changing a model, run `dbt build --select <model_name>` from
  the adventureworks/ folder and fix any failures before considering the task done.

Now, using those conventions, create a new dimension called dim_store. It should be
built from the seeds.sales.store seed (columns: businessentityid, storename,
salespersonid, modifieddate). Use businessentityid as the natural key and derive
store_key as the surrogate key. Include storename and salespersonid as descriptive
attributes (do not include modifieddate in the mart). Create both dim_store.sql and
dim_store.yml in models/marts/, following the exact same structure as the existing
dim_customer.sql / dim_customer.yml files in that folder. Then run dbt build for the
new model and show me the result.
````