with
    dim_flights as (
        select
            flight_key,
            tail_number,
            flight_date,
            airline,
            dep_airport,
            dep_city_name,
            deptime_label,
            dep_delay_type,
            arr_airport,
            arr_city_name,
            arr_delay_type,
            manufacturer,
            model,
            current_timestamp as loaded_at
        from {{ ref("int_us_flights") }}
    )
select *
from dim_flights
