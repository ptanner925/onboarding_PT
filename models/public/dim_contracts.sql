{{ config(materialized = 'table', tags = ['dim_contracts']) }}

select 
    *
from 
{{ ref('dc_dim_contracts') }}

UNION ALL

select *
from {{ ref('dc_unknown_record') }}