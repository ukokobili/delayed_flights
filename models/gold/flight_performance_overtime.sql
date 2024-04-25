-- Define a CTE (Common Table Expression) for clarity
with
    flight_performance_overtime as (
        select
            d.date_day,
            d.day_of_week,
            d.month_name,
            d.year,
            d.qtr,
            d.season,
            count(*) as total_flights,  -- Total number of flights per grouping
            avg(f.dep_delay) as average_departure_delay,  -- Average departure delay
            avg(f.arr_delay) as average_arrival_delay,  -- Average arrival delay
            sum(case when f.dep_delay <= 0 then 1 else 0 end) as on_time_departures,  -- Count of on-time or early departures
            sum(case when f.dep_delay > 0 then 1 else 0 end) as delayed_departures,  -- Count of delayed departures
            sum(case when f.dep_delay <= 0 then 1 else 0 end)
            * 100.0
            / count(*) as on_time_departure_rate,  -- Percentage of on-time/early departures
            sum(
                case when f.delay_weather > 0 then 1 else 0 end
            ) as weather_delayed_flights,  -- Flights delayed due to weather
            sum(case when f.delay_weather > 0 then 1 else 0 end)
            * 100.0
            / count(*) as weather_delay_impact  -- Percentage of flights delayed due to weather
        from main_silver.fct_flight_performance f
        left join main_silver.dim_date d on f.flight_date = d.date_day
        where month_name is not null
        group by d.date_day, d.day_of_week, d.month_name, d.year, d.qtr, d.season
    )
-- Final selection from the CTE
select *
from flight_performance_overtime
