select
    pickup_borough,
    payment_desc,
    count(*) as volume
from {{ ref('fact_trips') }}
group by 1, 2
order by 1, 3 desc
