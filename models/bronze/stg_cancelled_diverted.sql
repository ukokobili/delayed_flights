with
    _source as (
        select *, current_timestamp as loaded_at
        from {{ source("dev", "cancelled_diverted") }}
    )
select *
from _source
