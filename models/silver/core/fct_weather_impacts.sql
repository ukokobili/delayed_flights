with
    facts as (
        select
            {{ dbt_utils.generate_surrogate_key(["airport_id", "weather_date"]) }}
            as fct_weather_key,
            {{ dbt_utils.generate_surrogate_key(["airport_id"]) }} as airport_key,
            weather_date,
            tavg,
            tmin,
            tmax,
            prcp,
            snow,
            wdir,
            wspd,
            pres,
            current_timestamp as loaded_at
        from {{ ref("int_weather_meteo_by_airport") }}
    )
select *
from facts
