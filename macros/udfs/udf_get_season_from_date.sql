{% macro create_udf_get_season_from_date() %}

create or replace function udf_get_season_from_date(d date)
  returns number
  comment='Get season from date parameter'
  as
  $$
    case
    when month(d) in (10,11,12) then year(d)
    when month(d) in (1,2,3,4,5,6,7,8) then year(d) - 1
    else
      case
      when day(d) >= 16 then year(d)
      else year(d) - 1
      end
    end
  $$

{% endmacro %}