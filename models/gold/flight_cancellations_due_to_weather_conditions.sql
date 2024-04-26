with
    flight_cancellations_to_due_weather_conditions as (
        select
            d.airport_name,
            sum(f.cancelled) as total_cancellations,
            sum(f.diverted) as total_diversions,
            avg(w.prcp) as avg_precipitation,
            avg(w.snow) as avg_snowfall,
            avg(w.wdir) as wind_direction,
            avg(w.wspd) as wind_speed,
            avg(w.pres) as pressure,
        from {{ ref("fct_flight_cancelled_diverted") }} f
        left join
            {{ ref("fct_weather_conditions") }} w on f.flight_date = w.weather_date
        left join
            {{ ref("dim_airport_details") }} d
            on f.airport_code_key = d.airport_code_key
        group by d.airport_name
        order by total_cancellations desc
    )
select *
from flight_cancellations_to_due_weather_conditions
