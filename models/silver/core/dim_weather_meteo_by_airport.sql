with
    weather_meteo_by_airport as (
        select weather_key, weather_date, airport_id, current_timestamp as loaded_at
        from {{ ref("int_weather_meteo_by_airport") }}
    )
select *
from weather_meteo_by_airport
