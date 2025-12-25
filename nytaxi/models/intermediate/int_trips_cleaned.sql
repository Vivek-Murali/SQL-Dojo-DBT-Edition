with tripdata as (
    select * from {{ ref('stg_yellow_tripdata') }}
),
payment_type_map as (
    select '1' as payment_type, 'Credit Card' as payment_desc union all
    select '2', 'Cash' union all
    select '3', 'No Charge' union all
    select '4', 'Dispute' union all
    select '5', 'Unknown' union all
    select '6', 'Voided'
)
select
    tripdata.*,
    pt.payment_desc,
    timestamp_diff(dropoff_datetime, pickup_datetime, SECOND) / 60 as trip_duration_min
from tripdata
left join payment_type_map pt on tripdata.payment_type = pt.payment_type
where fare_amount > 0 and passenger_count > 0