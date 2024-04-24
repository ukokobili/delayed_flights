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
            {{ dbt_utils.generate_surrogate_key(["tail_number"]) }} as us_flight_key,
            {{ dbt_utils.generate_surrogate_key(["dep_airport"]) }}
            as airports_geolocation_key,
            {{ dbt_utils.generate_surrogate_key(["flight_date"]) }}
            as weather_meteo_key,
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
            aicraft_age,
        from {{ ref("int_us_flights") }}
    )
select *
from facts
