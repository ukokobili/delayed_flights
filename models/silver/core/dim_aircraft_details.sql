with
    dim_aircraft_details as (
        select
            tail_number,
            manufacturer,
            model,
            aircraft_age,
            current_timestamp as loaded_at
        from {{ ref("int_us_flights") }}
        group by tail_number, manufacturer, model, aircraft_age
    )
select
    *, {{ dbt_utils.generate_surrogate_key(["manufacturer"]) }} as aircraft_details_key
from dim_aircraft_details
