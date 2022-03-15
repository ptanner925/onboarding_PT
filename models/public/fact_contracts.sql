{{ config(materialized='table', tags=['fact_contracts']) }}

select
  *
from {{ ref('fc_fact_contracts') }}

