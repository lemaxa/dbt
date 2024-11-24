SELECT
    CAST(product_id AS STRING) AS product_id,
    CAST(category_id AS STRING) AS category_id,
    CAST(brand_id AS STRING) AS brand_id,
FROM {{source ('local_bike', 'products')}}