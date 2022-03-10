with date_range_cte as (
  select 
    seq4() as day_increment,
    dateadd(day, day_increment, to_date('2000-01-01')) as date --need to start at 2000 because of lease start dates for 2000-01-01
  from table(generator(rowcount => 11000))
),
dates as (
  select
    date as date,
    {{ target.schema }}.udf_get_season_from_date(date) as season,
    year(date) as year,
    month(date) as month,
    concat(year, lpad(month, 2, 0)) as year_month,
    monthname(date) as month_name,
    dayofmonth(date) as day_of_month,
    dayofweekiso(date) as day_of_week,
    dayname(date) as day_name,
    date_from_parts(season, 9, 16) as season_start,
    date_from_parts(season + 1, 9, 15) as season_end,
    datediff(day, season_start, date) + 1 as day_of_season,
    {{ target.schema }}.udf_get_season_week(season_start, day_of_season) as week_of_season,
    case
      when date between season_start
      and date_from_parts(season, 12, 31) then month - 8
      else month + 4
    end as month_of_season,
    concat(season, lpad(month_of_season, 2, 0)) as season_month,
    week(date) week_of_year,
    concat(
      right(season, 2),
      '/',
      lpad(to_number(right(season, 2) + 1), 2, 0) --lpad is necessary because the to_number removes the 0 from the front of some of the years
    ) as academic_year,
    case
      when date = last_day(date, month) then 1
      else 0
    end as is_month_end,
    case
      when month >= 8
      and date <= date_from_parts(year(date), 9, 15) then true
      else false
    end as prelease_noshow_inclusion,
    case
      when month >= 8
      or month <= 1 then true
      else false
    end as jan_prelease_noshow_inclusion,
    case
      when month >= 8
      or month <= 5 then true
      else false
    end as may_prelease_noshow_inclusion,
    0 as is_unknown_record --this will only apply to "Unknown" records added through the union all. Dates in the main query will be marked as false.
  from date_range_cte drc
  where
    drc.date <= '2029-12-29'
)
select
  *
from dates
