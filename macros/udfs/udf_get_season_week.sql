{% macro create_udf_get_season_week() %}

create or replace function {{target.schema}}.udf_get_season_week(SEASON_START date, DAY_OF_SEASON variant)
  returns variant
  language javascript
  as
  $$
    var season_start_weekday_raw = SEASON_START.getDay();
    var season_start_weekday = season_start_weekday_raw === 0 ? 7 : season_start_weekday_raw;
    var week_one_length = season_start_weekday === 1 ? 7 : (15 - season_start_weekday);
    if (DAY_OF_SEASON <= week_one_length) {
      return 1;
    } else {
      return Math.floor((DAY_OF_SEASON - week_one_length -1) / 7) +2;
    }
  $$

{% endmacro %}