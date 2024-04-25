with
    staging as (
        select
            iata_code as airport_code,
            airport as airport_name,
            airline,
            city,
            state,
            country,
            latitude,
            longitude,
            row_number() over (partition by iata_code, airport order by airport) as rn,
            current_timestamp as loaded_at
        from {{ ref("stg_airport_details") }} ad
        left join {{ ref("stg_us_flights") }} ft on ad.iata_code = ft.dep_airport
    )
select *
from staging
where rn = 1
