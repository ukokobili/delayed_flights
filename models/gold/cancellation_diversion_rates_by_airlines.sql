-- Define CTE for aggregating cancellation and diversion data by airline
with
    aggregation_of_cancelled_diverted_flights_by_airlines as (
        select
            d.airline,  -- Airline name
            count(*) as total_flights,  -- Total flight count per airline
            round(sum(f.cancelled)) as cancelled_flights,  -- Sum of cancelled flights, rounded
            round(sum(f.diverted)) as diverted_flights,  -- Sum of diverted flights, rounded
            round(sum(f.cancelled) * 100.0 / count(*), 2) as cancellation_rate,  -- Calculate cancellation rate
            round(sum(f.diverted) * 100.0 / count(*), 2) as diversion_rate  -- Calculate diversion rate
        from {{ ref("fct_cancelled_diverted_flights") }} f  -- Reference to the fact table of cancellations/diversions
        left join
            {{ ref("dim_cancelled_diverted") }} d on f._cancelled_key = d.cancelled_key  -- Join with dimension table on cancellation key
        group by 1  -- Group results by airline
        order by
            cancellation_rate desc,  
            diversion_rate desc  
    )
-- Select all results from the defined CTE
select *
from aggregation_of_cancelled_diverted_flights_by_airlines
