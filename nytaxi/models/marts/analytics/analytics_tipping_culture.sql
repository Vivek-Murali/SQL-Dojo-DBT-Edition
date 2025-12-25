{{ config(materialized='table') }}

select
    case
        when trip_distance < 5 then 'Short (<5 miles)'
        when trip_distance < 15 then 'Medium (5-15 miles)'
        else 'Long (>15 miles)'
    end as distance_category,
    avg(tip_amount / nullif(fare_amount, 0)) * 100 as avg_tip_pct
from {{ ref('fact_trips') }}
group by 1
