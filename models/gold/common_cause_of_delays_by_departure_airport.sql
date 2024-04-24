with
    delay_sums as (
        select
            d.dep_airport,
            d.dep_city_name,
            sum(f.delay_carrier) as total_carrier_delay,
            sum(f.delay_weather) as total_weather_delay,
            sum(f.delay_nas) as total_nas_delay,
            sum(f.delay_security) as total_security_delay,
            sum(f.delay_last_aircraft) as total_lateaircraft_delay
        from {{ ref("fct_flights_delay") }} f
        left join
            {{ ref("dim_us_flights") }} d
            on f.us_flight_key = d.flight_key
            and f.flight_date = d.flight_date
        group by d.dep_airport, d.dep_city_name
    ),
    max_delays as (
        select
            dep_airport,
            dep_city_name,
            greatest(
                total_carrier_delay,
                total_weather_delay,
                total_nas_delay,
                total_security_delay,
                total_lateaircraft_delay
            ) as max_delay
        from delay_sums
    )
select
    a.dep_airport,
    a.dep_city_name,
    case
        when total_carrier_delay = max_delay
        then 'Carrier'
        when total_weather_delay = max_delay
        then 'Weather'
        when total_nas_delay = max_delay
        then 'NAS'
        when total_security_delay = max_delay
        then 'Security'
        else 'Late Aircraft'
    end as most_common_delay_cause
from delay_sums a
join max_delays b on a.dep_airport = b.dep_airport
order by a.dep_airport
