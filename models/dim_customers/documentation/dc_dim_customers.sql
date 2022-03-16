with dim_customer_final as (
    SELECT 
concat(el.primary_customer_id, elc.customer_type_id) AS customer_key,
elc.customer_id AS customer_id,
ect.description AS customer_type,
ec.name_first AS first_name,
ec.name_last AS last_name,
concat(first_name, last_name) AS full_name,
ec.phone_number AS phone,
ec.mobile_number AS mobile,
ec.email_address AS email,
eca.city AS city,
eca.state_code AS state_code,
eca.country_code as country,
eca.postal_code AS zip_code,
0 AS is_unknown_record
FROM {{ ref('ent_leases') }} el
inner JOIN {{ ref('ent_lease_customers') }} elc ON elc.customer_id = el.primary_customer_id
inner JOIN {{ ref('ent_customer_types') }} ect ON elc.customer_type_id = ect.id
INNER JOIN {{ ref('ent_customers') }} ec ON ec.id = el.primary_customer_id 
INNER JOIN {{ ref('ent_customer_addresses') }} eca ON eca.customer_id = el.primary_customer_id
)

select * from dim_customer_final