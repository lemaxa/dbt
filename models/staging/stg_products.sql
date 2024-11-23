SELECT
    product_id,
    category_id,
    brand_id
FROM {{source ('local_bike', 'products')}}