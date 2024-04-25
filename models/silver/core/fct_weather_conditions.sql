with
    facts as (
        select
            airport_id,
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
        from {{ ref("int_weather_details") }}
    )
select *, {{ dbt_utils.generate_surrogate_key(["airport_id"]) }} as airport_id_key
from facts
