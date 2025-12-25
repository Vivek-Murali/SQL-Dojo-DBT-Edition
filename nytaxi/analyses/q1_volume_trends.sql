select
    extract(hour from pickup_datetime) as hour_of_day,
    format_date('%A', pickup_datetime) as day_of_week,
    count(*) as trip_count
from {{ ref('fact_trips') }}
group by 1, 2
order by 3 desc
