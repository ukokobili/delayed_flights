with
    _source as (
        select *, current_timestamp as loaded_at from {{ source("dev", "us_flights") }}
    )
select *
from _source
