SELECT
    CAST(order_id AS STRING) AS order_id,
    CAST(product_id AS STRING) AS product_id,
    quantity,
    list_price

FROM {{source ('local_bike', 'order_items')}}

ORDER BY order_id DESC