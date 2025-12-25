{{ config(materialized='table') }}

select
    extract(hour from pickup_datetime) as hour,
    avg(passenger_count) as avg_passengers
from {{ ref('fact_trips') }}
group by 1
order by 1
