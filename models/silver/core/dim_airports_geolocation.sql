with
    dim_airports_geolocation as (
        select *, current_timestamp as loaded_at
        from {{ ref("int_airports_geolocation") }}
    )
select *
from dim_airports_geolocation
