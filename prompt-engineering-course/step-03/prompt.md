Create `dim_store`, a dimension for `store`, from the `store` seed in
`dbt-dimensional-modelling/adventureworks`. Use `businessentityid` as the
natural key and `store_key` as the surrogate key. Include `storename` and
`salespersonid`; exclude `modifieddate`. Use `dim_customer` as the structural
reference for SQL and YAML. Create the model files, validate the requested
model, and show the result.