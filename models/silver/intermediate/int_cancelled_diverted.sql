with
    staging as (
        select
            tail_number,
            cast(flightdate as date) as flight_date,
            day_of_week,
            airline,
            cast(cancelled as int) as cancelled,
            cast(diverted as int) as diverted,
            dep_airport,
            dep_cityname as dep_city_name,
            deptime_label,
            dep_delay,
            dep_delay_tag,
            dep_delay_type,
            arr_airport,
            arr_cityname as arr_city_name,
            arr_delay,
            arr_delay_type,
            flight_duration,
            distance_type,
            delay_carrier,
            delay_weather,
            delay_nas,
            delay_security,
            delay_lastaircraft as delay_last_aircraft,
            current_timestamp as loaded_at
        from {{ ref("stg_cancelled_diverted") }}
    )
select *
from staging
