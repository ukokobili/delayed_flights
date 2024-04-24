with
    dim_cancelled_diverted as (
        select
            cancelled_key,
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
            current_timestamp as loaded_at
        from {{ ref("int_cancelled_diverted") }}
    )
select *
from dim_cancelled_diverted
