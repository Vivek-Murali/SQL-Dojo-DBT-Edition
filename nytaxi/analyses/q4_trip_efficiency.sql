-- Use for Scatter Plot in Looker
select
    trip_distance,
    fare_amount
from {{ ref('fact_trips') }}
where trip_distance < 100 -- remove outliers
order by rand()
limit 1000 -- Sampling for visualization in BigQuery
