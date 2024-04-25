with
    staging as (
        select
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
        from {{ ref("stg_weather_details") }}
    )
select *
from staging
