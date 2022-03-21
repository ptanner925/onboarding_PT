/*view serves as the source query that will be called by the
fact_contracts table in the public folder.

this view also stores the logic for populating the Fact Contracts table with
outputs such as the keys,dates, and measures.

*/
--us.deleted_on filter removes void leases
with current_beds_leased as (
  select us.current_lease_id as lease_id, count(*) as beds_leased from {{ ref('ent_unit_spaces') }} us where us.deleted_on is null group by 1
),
--sp.subject provides a filter for properties currently owned by scion from

contracts_prep as (
select ca.lease_interval_id, leas.primary_customer_id,lc.customer_type_id,sp.id as si_property_id,ca.lease_start_date,ca.lease_end_date,cbl.beds_leased
from {{ ref('ent_cached_applications') }} ca
left join {{ ref('ent_leases') }} leas on leas.id = ca.lease_id
left join {{ ref('ent_lease_customers') }} lc on lc.customer_id = leas.primary_customer_id and lc.lease_id = leas.id
inner join {{ ref('si_entrata_properties') }} ep on ep.entrata_id = ca.property_id
inner join {{ ref('si_properties') }} sp on sp.id = ep.property_id
left join current_beds_leased cbl on cbl.lease_id = ca.lease_id
where sp.subject = 1
),

contracts_final as (
select md5(cp.lease_interval_id) as contract_key,
ifnull(md5(concat(cp.primary_customer_id,'|',ifnull(cp.customer_type_id, '-1'))),'-1') as customer_key,
md5(cp.si_property_id) as property_key,
{{ target.schema }}.udf_get_date_key(cp.lease_start_date) as lease_start_date_key,
{{ target.schema }}.udf_get_date_key(cp.lease_end_date) as lease_end_date_key,
cp.beds_leased
from contracts_prep cp
)

select
  *
from contracts_final

