# Stage 0 — The "one giant prompt" (before)

This is the kind of prompt a developer pastes into chat the *first* time they ask
Copilot to add a new dimension table to the `dbt-dimensional-modelling/adventureworks`
project. Everything the agent needs to know is crammed into a single message.

It works, but every teammate who wants a new dimension has to write (or copy-paste
and edit) this whole thing again, and the "house rules" section drifts out of sync
across copies. This is the prompt we'll split apart in the following stages.

---

```text
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
```

---

**Problems with this as a recurring workflow:**

1. The first ~20 lines (conventions) never change between requests, but must be
   retyped/pasted every time -> copy-paste drift.
2. The "task" part (build `dim_store`) is buried inside a wall of rules, making it
   hard to reuse for the *next* dimension (e.g. `dim_salesreason`).
3. Nothing stops someone from skipping the validation step (`dbt build`) if they
   forget to ask for it, or from an agent editing seed CSVs directly.
4. There's no scoped persona - any chat participant could go off and refactor
   unrelated files while "helping" with the dimension.

The following stages split this into four reusable pieces:

| Piece | File | Solves |
|---|---|---|
| Stage 1 | [`.github/instructions/dbt-dimensional-modelling.instructions.md`](../.github/instructions/dbt-dimensional-modelling.instructions.md) | conventions repeated every time |
| Stage 2 | [`.github/prompts/create-dimension.prompt.md`](../.github/prompts/create-dimension.prompt.md) | task buried in rules |
| Stage 3 | [`.github/agents/dbt-modeler.agent.md`](../.github/agents/dbt-modeler.agent.md) | scope/persona/tool restriction |
| Stage 4 | [`.github/hooks/dbt-marts-guard.json`](../.github/hooks/dbt-marts-guard.json) | enforcement instead of hope |

See [README.md](./README.md) for the full walkthrough and the final "small prompt".
