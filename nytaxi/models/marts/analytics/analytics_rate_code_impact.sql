{{ config(materialized='table') }}

select
    rate_code_id,
    avg(total_amount) as avg_cost
from {{ ref('fact_trips') }}
group by 1
