with
    dim_flight_activity as (
        select
            flight_date,
            tail_number,
            dep_airport,
            dep_city_name,
            deptime_label,
            dep_delay_type,
            arr_airport,
            arr_city_name,
            arr_delay_type,
            distance_type,
            current_timestamp as loaded_at
        from {{ ref("int_us_flights") }}
    )
select *, {{ dbt_utils.generate_surrogate_key(["tail_number"]) }} as flight_activity_key
from dim_flight_activity
