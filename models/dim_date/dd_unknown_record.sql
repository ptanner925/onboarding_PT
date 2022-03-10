with unknown_record as (
  select
    --Unknown record row (can be used when a date far in the past is required for the unknown record)
    '1900-01-01' as date,
    null as season,
    null as year,
    null as month,
    null as year_month,
    null as month_name,
    null as day_of_month,
    null as day_of_week,
    null as day_name,
    null as season_start,
    null as season_end,
    null as day_of_season,
    null as week_of_season,
    null as month_of_season,
    null as season_month,
    null as week_of_year,
    null as academic_year,
    0 as is_month_end,
    false as prelease_noshow_inclusion,
    false as jan_prelease_noshow_inclusion,
    false as may_prelease_noshow_inclusion,
    1 as is_unknown_record
  union all
  select
    --Unknown record row 2 (can be used when a date far in the future is required for the unknown record)
    '2100-01-01' as date,
    null as season,
    null as year,
    null as month,
    null as year_month,
    null as month_name,
    null as day_of_month,
    null as day_of_week,
    null as day_name,
    null as season_start,
    null as season_end,
    null as day_of_season,
    null as week_of_season,
    null as month_of_season,
    null as season_month,
    null as week_of_year,
    null as academic_year,
    0 as is_month_end,
    false as prelease_noshow_inclusion,
    false as jan_prelease_noshow_inclusion,
    false as may_prelease_noshow_inclusion,
    1 as is_unknown_record
)
select
  *
from unknown_record