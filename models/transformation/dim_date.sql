with date_col as ({{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2024-01-01' as date)",
    end_date="cast('2030-01-01' as date)" 
   )
}}
)
select 
    date_day,
    month(date_day),
    day(date_day),
    week(date_day),
    year(date_day),
    {{ dbt_date.week_of_year("date_day") }} as week_of_year,
   {{ dbt_date.day_name("date_day") }} as day_of_week_short_name
    from
    date_col
    order by
    date_day desc