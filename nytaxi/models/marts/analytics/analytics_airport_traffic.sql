{{ config(materialized='table') }}

select
    count(*) as airport_trips
from {{ ref('fact_trips') }}
where pickup_zone like '%Airport%' or dropoff_zone like '%Airport%'
