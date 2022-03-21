with customers_first as (
    select distinct 
    el.primary_customer_id, 
    elc.customer_type_id, 
    ect.description 
from {{ ref('ent_leases') }} el
left join {{ ref('ent_lease_customers') }} elc on elc.customer_id = el.primary_customer_id AND elc.lease_id = el.id
left join {{ ref('ent_customer_types') }} ect on ect.id = elc.customer_type_id
),
customers_final as (
    select
    ifnull(md5(concat(ec.id,'|',ifnull(cf.customer_type_id, '-1'))),'-1') as customer_key,
    ec.id as customer_id,
    cf.description as customer_type,
    ec.email_address as email,
    ec.phone_number as phone,
    ec.mobile_number as mobile,
    ec.name_first as first_name,
    ec.name_last as last_name,
    concat(first_name, ' ', last_name) as full_name,
    eca.city as city,
    eca.state_code as state,
    eca.country_code as country,
    eca.postal_code as zip_code,
    0 as is_unknown_record
from {{ ref('ent_customers') }} ec
left join {{ ref('ent_customer_addresses') }} eca on eca.customer_id = ec.id AND eca.address_type_id = 1
left join customers_first cf on cf.primary_customer_id = ec.id
)
select * from customers_final
