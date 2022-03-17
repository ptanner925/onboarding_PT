{{ config(materialized='table', tags=['dim_properties']) }}

select 
  * 
from {{ ref('dp_dim_properties') }}
union all
select * from {{ref('dp_unknown_record')}}
