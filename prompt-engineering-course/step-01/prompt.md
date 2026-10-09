Create a `dim_store` dimension in `dbt-dimensional-modelling/adventureworks`
from the `store` seed. Use `businessentityid` as the natural key and
`store_key` as the surrogate key. Include `storename` and `salespersonid`; omit
`modifieddate`. Use `dim_customer.sql` and `dim_customer.yml` as structural
references. Create the model SQL and YAML and validate the requested model.

The [scoped AdventureWorks dimension instructions](../../.github/instructions/adventureworks-dimensions.instructions.md)
contain the reusable project conventions for matching dimension files.