# Step 00 Exercise: Try the Prompt

Use the provided prompt to ask AI to create the `dim_store` model, then try
building it with dbt.

1. Switch to the `Example-01-step-00-run` branch.
2. Copy the full prompt from `prompt-engineering-course/step-00/prompt.md` into
   your AI chat and send it. Let the AI create the model and try the build.
3. If needed, run `dbt build --select dim_store` from
   `dbt-dimensional-modelling/adventureworks` to see whether the model builds.
   Record what happened in `run-result.md`, including any errors. Only mark the
   build successful if it actually succeeds.