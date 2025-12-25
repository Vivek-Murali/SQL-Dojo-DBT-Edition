with source as (
    select * from {{ source('new_york_taxi_trips', 'tlc_yellow_trips_2019') }}
),
renamed as (
    select
        -- Identifiers
        vendor_id,
        rate_code as rate_code_id,
        pickup_location_id,
        dropoff_location_id,

        -- Timestamps
        pickup_datetime,
        dropoff_datetime,

        -- Trip info
        passenger_count,
        trip_distance,
        store_and_fwd_flag,

        -- Payment info
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        imp_surcharge,
        total_amount
    from source
)
select * from renamed