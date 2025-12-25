select
    date_trunc(pickup_datetime, MONTH) as month,
    vendor_id,
    sum(total_amount) as total_revenue
from {{ ref('fact_trips') }}
group by 1, 2
order by 1, 3 desc
