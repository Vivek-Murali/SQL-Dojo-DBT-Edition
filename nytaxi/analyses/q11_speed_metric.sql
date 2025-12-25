select
    extract(hour from pickup_datetime) as hour_of_day,
    avg(trip_distance / nullif(trip_duration_min / 60, 0)) as avg_speed_mph
from {{ ref('fact_trips') }}
where trip_duration_min > 0
group by 1
order by 1
