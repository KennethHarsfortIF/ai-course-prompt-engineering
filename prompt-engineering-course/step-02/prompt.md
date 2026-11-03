# Step 02 Prompt Invocation

In VS Code Copilot Chat, include the task values after `/dimension-task` in
the same message. The `${input:...}` placeholders guide the model; they do not
open separate VS Code input boxes. For this example, send:

```text
/dimension-task model_name=dim_store entity=store seed=store natural_key=businessentityid surrogate_key=store_key included_attributes=storename,salespersonid excluded_attributes=modifieddate reference_model=dim_customer
```

The prompt file is `.github/prompts/dimension-task.prompt.md`; its referenced
instructions contain the stable project conventions.