with unknown_record as (  
  select 
    '-1' as contract_key,
    -1 as lease_interval_id,
    'Unknown' as lease_interval_type,
    'Unknown' as lease_status_type,
    'Unknown' as application_stage,
    'Unknown' as application_status,
    0 as is_renewal,
    0 as is_deleted,
    1 as is_unknown_record
)

select * from unknown_record