with dim_customer_final as (
    SELECT 
concat(el.primary_customer_id, elc.customer_type_id) as customer_key,
elc.customer_id as customer_id,
ect.description as customer_type,
ec.name_first as first_name,
ec.name_last as last_name,
concat(first_name, last_name) as full_name,
ec.phone_number as phone,
ec.mobile_number as mobile,
ec.email_address as email,
eca.city as city,
eca.state_code as state_code,
eca.country_code as country,
eca.postal_code as zip_code,
0 as is_unknown_record
FROM {{ ref('ent_leases') }} el
inner JOIN {{ ref('ent_lease_customers') }} elc on elc.customer_id = el.primary_customer_id
inner JOIN {{ ref('ent_customer_types') }} ect on elc.customer_type_id = ect.id
INNER JOIN {{ ref('ent_customers') }} ec on ec.id = el.primary_customer_id 
INNER JOIN {{ ref('ent_customer_addresses') }} eca on eca.customer_id = el.primary_customer_id
)

select * from dim_customer_final