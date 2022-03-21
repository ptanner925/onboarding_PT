
{{ config(materialized = 'table', tags = ['fact_contracts']) }}

select * from {{ ref('dc_dim_customers') }}

union all 

select * from {{ ref('dc_dim_unknown_record') }}