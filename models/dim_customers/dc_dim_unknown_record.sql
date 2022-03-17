
with unknown_customer_record as (
    select
    '-1' as customer_key,
    -1 as customer_id,
    'Unknown' as customer_type,
    'Unknown' as first_name,
    'Unknown' as last_name,
    'Unknown' as full_name,
    null as phone,
    null as mobile,
    'Unknown' as email,
    'Unknown' as city,
    'Unknown' as state_code,
    'Unknown' as country,
    'Unknown' as zip_code,
    1 as is_unknown_record
)

select 
* 
from unknown_customer_record