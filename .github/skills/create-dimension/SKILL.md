---
name: create-dimension
description: Create an AdventureWorks dbt dimension from a seed using the task values in the user's request.
argument-hint: "model, entity, seed, keys, attributes, reference model"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Follow the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
for the shared model and validation conventions.

Identify each task value in the user's request: model name, entity, seed, natural
key, surrogate key, included attributes, excluded attributes, and structural
reference. If a value is missing or ambiguous, ask the user before proceeding.
Never guess.

Create `<model_name>`, a dimension for `<entity>`, in
`dbt-dimensional-modelling/adventureworks` from the `<seed>` seed. Use
`<natural_key>` as the natural key and `<surrogate_key>` as the surrogate key.
Include `<included_attributes>` as descriptive attributes and exclude
`<excluded_attributes>`. Use `<reference_model>` as the structural reference for
both the SQL and YAML. Create the model files, validate the requested model
according to the shared instructions, and show the result.
