with
    _source as (
        select *, current_timestamp as loaded_at
        from {{ source("dev", "weather_meteo_by_airport") }}
    )
select *
from _source
