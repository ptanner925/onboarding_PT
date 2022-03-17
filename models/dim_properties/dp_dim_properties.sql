with dim_properties_final as (
    select 
md5(sp.id) as property_key,
sp.id as property_id,
sa.addressable_id as property_code,
sm.id as market_id,
sm.name as market_name,
sa.street as street_address,
sa.city as city,
sa.state as state_code,
sa.postal_code as zip_code,
sp.contact_number as phone,
sp.website as website,
sp.year_built as year_built,
0 as is_unknown_record
from {{ ref('si_properties') }} sp
inner join {{ ref('si_addresses') }} sa ON sa.id = sp.id
inner join {{ ref('si_markets') }} sm ON sm.id = sp.market_id
)

select * from dim_properties_final