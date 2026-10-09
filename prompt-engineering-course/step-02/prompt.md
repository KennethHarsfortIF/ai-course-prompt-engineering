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