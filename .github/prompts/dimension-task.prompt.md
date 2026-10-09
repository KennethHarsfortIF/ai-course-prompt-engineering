---
name: dimension-task
description: Build a dbt dimension from a seed using supplied task inputs and the repository's scoped dimension instructions.
argument-hint: "model, entity, seed, keys, attributes, reference model"
agent: agent
---

Follow the [AdventureWorks dimension instructions](../instructions/adventureworks-dimensions.instructions.md).

Create `${input:model_name:dim_store}`, a dimension for
`${input:entity:store}`, in `dbt-dimensional-modelling/adventureworks` from the
`${input:seed:store}` seed. Use `${input:natural_key:businessentityid}` as the
natural key and `${input:surrogate_key:store_key}` as the surrogate key.
Include these descriptive attributes: `${input:included_attributes:storename, salespersonid}`.
Exclude these seed attributes: `${input:excluded_attributes:modifieddate}`.

Use `${input:reference_model:dim_customer}` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model,
and show the result.