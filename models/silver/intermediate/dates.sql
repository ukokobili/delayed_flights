-- DBT configuration to materialize the output as a table
{{ config(materialized="ephemeral") }}

-- Generate a date dimension table for the year 2023
{{ dbt_date.get_date_dimension("2023-01-01", "2023-12-31") }}
