with
    flight_cancellations_to_due_weather_conditions as (
        select
            d.dep_airport,
            sum(f.cancelled) as total_cancellations,
            sum(f.diverted) as total_diversions,
            avg(w.prcp) as avg_precipitation,
            avg(w.snow) as avg_snowfall,
            avg(w.wdir) as wind_direction,
            avg(w.wspd) as wind_speed,
            avg(w.pres) as pressure,
        from {{ ref("fct_cancelled_diverted_flights") }} f
        left join
            {{ ref("fct_weather_impacts") }} w
            on f.airports_id_key = w.airport_key
            and f.flight_date = w.weather_date
        left join
            {{ ref("dim_cancelled_diverted") }} d on f._cancelled_key = d.cancelled_key
        group by d.dep_airport
    )
select *
from flight_cancellations_to_due_weather_conditions
