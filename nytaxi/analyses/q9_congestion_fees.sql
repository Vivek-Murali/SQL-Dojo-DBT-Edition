select
    sum(congestion_surcharge) as total_surcharge_revenue,
    sum(congestion_surcharge) / sum(total_amount) * 100 as pct_of_revenue
from {{ ref('fact_trips') }}
