
with unknown_property_record as (
    select
    '-1' as property_key,
    -1 as property_id,
    'Unknown' as property_code,
    -1 as market_id,
    'Unknown' as market_name,
    'Unknown' as street_address,
    'Unknown' as city,
    'Unknown' as state_code,
    'Unknown' as zip_code,
    'Unknown' as phone,
    'Unknown' as website,
    -1 as year_built,
    1 as is_unknown_record
)

select 
* 
from unknown_property_record