with source as (
    select * from {{ source('new_york_taxi_trips', 'taxi_zone_geom') }}
),
renamed as (
    select
        zone_id as locationid,
        borough,
        zone_name as zone,
        'N/A' as service_zone
    from source
)
select * from renamed
