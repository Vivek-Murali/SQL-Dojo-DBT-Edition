{{ config(materialized='table') }}

select
    count(case when trip_distance < 2 then 1 end) as short_trips,
    count(case when trip_distance >= 2 then 1 end) as long_trips,
    count(case when trip_distance < 2 then 1 end) / count(*) as short_trip_ratio
from {{ ref('fact_trips') }}
