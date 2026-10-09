# Step 02 Prompt Invocation

In a VS Code Copilot chat, invoke `/dimension-task`. The workspace prompt file
will ask for these task inputs:

| Input | Value |
|---|---|
| `model_name` | `dim_store` |
| `entity` | `store` |
| `seed` | `store` |
| `natural_key` | `businessentityid` |
| `surrogate_key` | `store_key` |
| `included_attributes` | `storename, salespersonid` |
| `excluded_attributes` | `modifieddate` |
| `reference_model` | `dim_customer` |

The prompt file is `.github/prompts/dimension-task.prompt.md`; its referenced
instructions contain the stable project conventions.