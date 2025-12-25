{{ config(materialized='table') }}

select
    sum(0) as total_surcharge_revenue,
    sum(0) / sum(total_amount) * 100 as pct_of_revenue
from {{ ref('fact_trips') }}
