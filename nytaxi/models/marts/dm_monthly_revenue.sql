select
    date_trunc(pickup_datetime, MONTH) as revenue_month,
    vendor_id,
    sum(total_amount) as revenue,
    sum(passenger_count) as total_passengers,
    avg(trip_distance) as avg_distance
from {{ ref('fact_trips') }}
group by 1, 2