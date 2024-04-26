{% set partitions_to_replace = [
 'timestamp(current_date)',
 'timestamp(date_sub(current_date, interval 1 day))'
] %}

{{
    config(
        materialized="table",
        incremental_strategy = 'insert_overwrite',
        partition_by={"field": "flight_date", "data_type": "date"},
        partitions = partitions_to_replace
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
            loaded_at
        from {{ ref("int_us_flights") }}
    )
select *
from fct_flight_performance
