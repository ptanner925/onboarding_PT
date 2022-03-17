
{{ config(materialized = 'table', tags = ['dim_customers']) }}

select * from {{ ref('dc_dim_customers') }}

union all 

select * from {{ ref('dc_dim_unknown_record') }}