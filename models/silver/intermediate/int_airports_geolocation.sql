with staging as (
    select{{ dbt_utils.generate_surrogate_key( ["iata_code"] ) }} as geolocation_key,
        iata_code,
        airport,
        latitude,
        longitude,
        current_timestamp as loaded_at
    from {{ ref("stg_airports_geolocation") }}
)
select *
from staging
