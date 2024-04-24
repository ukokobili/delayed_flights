with
    staging as (
        select
            {{ dbt_utils.generate_surrogate_key(["airport_id"]) }} as weather_key,
            airport_id,
            cast(time as date) as weather_date,
            tavg,
            tmin,
            tmax,
            prcp,
            snow,
            wdir,
            wspd,
            pres,
            current_timestamp as loaded_at
        from {{ ref("stg_weather_meteo_by_airport") }}
    )
select *
from staging
