with dim_contracts_prep as (
    select
        eca.lease_interval_id AS lease_interval_id,
        elit.description AS lease_interval_type,
        elst.description AS lease_status_type,
        eas.description AS application_stage,
        east.description AS application_status,
        IFF(eca.lease_interval_type_id = 3, 1,0) as is_renewal,
        eca.is_deleted AS is_deleted,
        0 as is_unknown_record
    FROM {{ ref('ent_cached_applications') }} eca 
    LEFT JOIN {{ ref('ent_lease_interval_types') }} elit ON 
        elit.id = eca.lease_interval_type_id
    LEFT JOIN {{ ref('ent_lease_status_types') }} elst ON 
        elst.id = eca.lease_status_type_id
    LEFT JOIN {{ ref('ent_application_stages') }} eas ON 
        eas.id = eca.application_stage_id
    LEFT JOIN {{ ref('ent_application_statuses') }} east ON 
        east.id =eca.application_status_id
),

dim_contracts_final as (
    select md5(dcp.lease_interval_id) as contract_key,
        dcp.lease_interval_id as lease_interval_id,
        dcp.lease_interval_type as lease_interval_type,
        dcp.lease_status_type as lease_status_type,
        dcp.application_stage as application_stage,
        dcp.application_status as application_status,
        dcp.is_renewal as is_renewal,
        dcp.is_deleted as is_deleted,
        dcp.is_unknown_record as is_unknown_record
    from dim_contracts_prep dcp
)

select 
    * 
from dim_contracts_final