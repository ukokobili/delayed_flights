-- DBT configuration to materialize the output as a table
{{ config(materialized="table") }}

-- Generate a date dimension table for the year 2023
{{ dbt_date.get_date_dimension("2020-01-01", "2023-12-31") }}
