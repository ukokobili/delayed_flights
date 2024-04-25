with
    _source as (
        select *, current_timestamp as loaded_at
        from {{ source("dev", "airports_geolocation") }}
    )
select *
from _source
