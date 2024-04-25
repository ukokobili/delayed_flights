{{
    config(
        materialized="table",
        partition_by={"field": "flight_date", "data_type": "date"},
    )
}}

with
    fct_flight_cancelled_diverted as (
        select
            {{ dbt_utils.generate_surrogate_key(["flight_date"]) }} as date_key,
            {{ dbt_utils.generate_surrogate_key(["tail_number"]) }}
            as flight_activity_key,
            {{ dbt_utils.generate_surrogate_key(["dep_airport"]) }} as airport_code_key,
            flight_date,
            cancelled,
            diverted,
            current_timestamp as loaded_at
        from {{ ref("int_cancelled_diverted") }}
    )
select *
from fct_flight_cancelled_diverted
