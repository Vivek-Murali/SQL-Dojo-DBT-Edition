{{ config(materialized='table') }}

select
    pickup_zone,
    count(*) as trips
from {{ ref('fact_trips') }}
group by 1
order by 2 desc
limit 10
