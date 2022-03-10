{{ config(materialized='table') }}

select 
  *
from {{ ref('dd_dim_dates') }}
union all
select
  *
from {{ ref('dd_unknown_record') }}