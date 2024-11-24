SELECT
    CAST(brand_id AS STRING) AS brand_id,
    brand_name
FROM {{source ('local_bike', 'brands')}}