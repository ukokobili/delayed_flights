with
    dim_airport_details as (
        select
            airport_code,
            airport_name,
            airline,
            city,
            state,
            country,
            latitude,
            longitude,
            current_timestamp as loaded_at
        from {{ ref("int_airport_details") }}
    )
select *, {{ dbt_utils.generate_surrogate_key(["airport_code"]) }} as airport_code_key
from dim_airport_details
