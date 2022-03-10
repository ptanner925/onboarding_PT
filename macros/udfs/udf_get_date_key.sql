{% macro create_udf_get_date_key() %}

create or replace function udf_get_date_key(d date)
  returns date
  comment='Get date key from date param'
  as
  $$
    case
      when d is null then '1900-01-01'
      when d < '2000-01-01' then '1900-01-01' -- min dim_date
      when d > '2029-12-29' then '2100-01-01' -- max dim_date
      else d
    end
  $$

{% endmacro %}