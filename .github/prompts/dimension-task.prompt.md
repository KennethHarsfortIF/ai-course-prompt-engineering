---
name: dimension-task
description: Build a dbt dimension from a seed using supplied task inputs and the repository's scoped dimension instructions.
argument-hint: "model, entity, seed, keys, attributes, reference model"
agent: agent
---

Follow the [AdventureWorks dimension instructions](../instructions/adventureworks-dimensions.instructions.md).

Create `${input:model_name:model name}`, a dimension for
`${input:entity:entity}`, in `dbt-dimensional-modelling/adventureworks` from the
`${input:seed:seed name}` seed. Use `${input:natural_key:natural key column}` as
the natural key and `${input:surrogate_key:surrogate key column}` as the
surrogate key. Include these descriptive attributes:
`${input:included_attributes:included attributes}`. Exclude these seed
attributes: `${input:excluded_attributes:excluded attributes}`.

Use `${input:reference_model:reference model}` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model,
and show the result.