{{
    config(
        materialized="table",
        partition_by={"field": "flight_date", "data_type": "date"},
    )
}}

with
    facts as (
        select
            {{ dbt_utils.generate_surrogate_key(["tail_number", "flight_date"]) }}
            as fct_delay_key,
            {{ dbt_utils.generate_surrogate_key(["flight_date"]) }} as date_day_key,
            {{ dbt_utils.generate_surrogate_key(["tail_number"]) }} as _cancelled_key,
            {{ dbt_utils.generate_surrogate_key(["dep_airport"]) }} as airports_id_key,
            {{ dbt_utils.generate_surrogate_key(["flight_date"]) }}
            as weather_meteo_key,
            flight_date,
            dep_delay,
            cancelled,
            diverted,
            dep_delay_tag,
            arr_delay,
            arr_delay_type,
            flight_duration,
            distance_type,
            delay_carrier,
            delay_weather,
            delay_nas,
            delay_security,
            delay_last_aircraft,
            current_timestamp as loaded_at
        from {{ ref("int_cancelled_diverted") }}
    )
select *
from facts
