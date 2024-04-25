-- Define CTE for aggregating cancellation and diversion data by airline
with
    aggregation_of_cancelled_diverted_flights_by_airlines as (
        select
            a.airline,
            count(*) as total_flights,  -- Total flight count per airline
            sum(c.cancelled) as cancelled_flights,  -- Sum of cancelled flights, rounded
            sum(c.diverted) as diverted_flights,  -- Sum of diverted flights, rounded
            round(sum(c.cancelled) * 100.0 / count(*), 2) as cancellation_rate,  -- Calculate cancellation rate
            round(sum(c.diverted) * 100.0 / count(*), 2) as diversion_rate  -- Calculate diversion rate
        from {{ ref('fct_flight_cancelled_diverted') }}  c
        left join
            {{ ref('dim_airport_details') }}  a on a.airport_code_key = c.airport_code_key

        group by 1
        order by cancellation_rate desc, diversion_rate desc
    )
-- Select all results from the defined CTE
select *
from aggregation_of_cancelled_diverted_flights_by_airlines
