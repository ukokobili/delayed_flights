with date_dimension as (select * from {{ ref("dates") }})
select
    {{ dbt_utils.generate_surrogate_key(["date_day"]) }} as date_key,
    date_day,
    extract(day from date_day) as day,
    extract(dow from date_day) as week_day,
    extract(week from date_day) as week,
    {{ dbt_date.day_of_month("date_day") }} as day_of_month,
    case
        when extract(month from date_day) in (3, 4, 5)
        then 'Spring'
        when extract(month from date_day) in (6, 7, 8)
        then 'Summer'
        when extract(month from date_day) in (9, 10, 11)
        then 'Fall'
        else 'Winter'
    end as season,
    extract(year from date_day) as year,
    {{ get_quarter("date_day") }} as qtr,
    {{ dbt_date.day_name("date_day", short=true) }} as day_of_week,
    {{ dbt_date.month_name("date_day", short=true) }} as month_name,
    current_timestamp as loaded_at
from date_dimension
