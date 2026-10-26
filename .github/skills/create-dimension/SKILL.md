---
name: create-dimension
description: Create an AdventureWorks dbt dimension from a seed using task details in the user's request.
argument-hint: "[dimension task inputs]"
user-invocable: true
disable-model-invocation: false
---

# Create a Dimension

Follow the [AdventureWorks dimension instructions](../../instructions/adventureworks-dimensions.instructions.md)
for the shared model and validation conventions.

Extract the model name, entity, seed, natural key, surrogate key, included and
excluded attributes, and structural reference from the user's request. If any
value is missing or ambiguous, ask the user before proceeding. Never guess.

Create the requested dimension SQL and companion schema YAML. Use the supplied
structural reference for both files, and validate the requested model according
to the shared instructions. Report the files changed and the actual validation
result.
