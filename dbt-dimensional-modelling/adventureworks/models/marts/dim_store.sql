with stg_store as (
    select
        businessentityid,
        storename,
        salespersonid
    from {{ ref('store') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['stg_store.businessentityid']) }} as store_key,
    stg_store.businessentityid,
    stg_store.storename,
    stg_store.salespersonid
from stg_store