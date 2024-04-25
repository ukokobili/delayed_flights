{{
    config(
        materialized="table",
        partition_by={"field": "flight_date", "data_type": "date"},
    )
}}

with
    fct_flight_performance as (
        select
            {{ dbt_utils.generate_surrogate_key(["flight_date"]) }} as date_key,
            {{ dbt_utils.generate_surrogate_key(["tail_number"]) }}
            as flight_activity_key,
            {{ dbt_utils.generate_surrogate_key(["manufacturer"]) }}
            as aircraft_details_key,
            {{ dbt_utils.generate_surrogate_key(["dep_airport"]) }} as airport_code_key,
            flight_date,
            dep_delay,
            dep_delay_tag,
            arr_delay,
            flight_duration,
            delay_carrier,
            delay_weather,
            delay_nas,
            delay_security,
            delay_last_aircraft,
            current_timestamp as loaded_at
        from {{ ref("int_us_flights") }}
    )
select *
from fct_flight_performance
