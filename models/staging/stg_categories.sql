SELECT
    CAST(category_id AS STRING) AS category_id,
    category_name
FROM {{source ('local_bike', 'categories')}}