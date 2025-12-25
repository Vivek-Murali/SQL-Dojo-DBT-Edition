select
    t.*,
    pz.borough as pickup_borough,
    pz.zone as pickup_zone,
    dz.borough as dropoff_borough,
    dz.zone as dropoff_zone
from {{ ref('int_trips_cleaned') }} t
left join {{ ref('dim_zones') }} pz on t.pickup_location_id = pz.locationid
left join {{ ref('dim_zones') }} dz on t.dropoff_location_id = dz.locationid