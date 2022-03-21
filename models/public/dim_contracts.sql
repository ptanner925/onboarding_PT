{{ config(materialized = 'table', tags = ['fact_contracts']) }}

select 
    *
from 
{{ ref('dc_dim_contracts') }}

UNION ALL

select *
from {{ ref('dc_unknown_record') }}