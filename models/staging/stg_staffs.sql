SELECT
    CAST(staff_id AS STRING) AS staff_id,
    CAST(store_id AS STRING) AS store_id,
FROM {{source ('local_bike', 'staffs')}}