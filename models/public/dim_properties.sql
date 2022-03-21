{{ config(materialized='table', tags=['fact_contracts']) }}

select 
  * 
from {{ ref('dp_dim_properties') }}
union all
select * from {{ref('dp_unknown_record')}}
