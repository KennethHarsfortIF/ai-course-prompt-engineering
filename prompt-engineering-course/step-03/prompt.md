# Step 03 Prompt Examples

Use these three requests to observe how the `create-dimension` skill handles
complete and missing task details. Start a fresh Copilot chat for each test.

## 1. Complete request

```text
Create `dim_store`, a dimension for `store`, from the `store` seed in
`dbt-dimensional-modelling/adventureworks`. Use `businessentityid` as the
natural key and `store_key` as the surrogate key. Include `storename` and
`salespersonid`; exclude `modifieddate`. Use `dim_customer` as the structural
reference for SQL and YAML.
```


## 2. Minimal request

```text
Create a dimension.
```


## 3. Partial details

```text
Create `dim_store`, a dimension for `store`.
```

