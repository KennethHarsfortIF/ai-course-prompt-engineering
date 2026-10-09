/create-dimension Create `dim_store` from the `store` seed in
`dbt-dimensional-modelling/adventureworks`. Use `businessentityid` as the
natural key and `store_key` as the surrogate key. Include `storename` and
`salespersonid`; exclude `modifieddate`. Use `dim_customer` as the structural
reference. The skill uses the input structure in
`.github/prompts/dimension-task.prompt.md`; that separate prompt file can also
be invoked directly as `/dimension-task`.