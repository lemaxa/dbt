SELECT
    CAST(order_id AS STRING) AS order_id,
    product_id,
    quantity,
    list_price

FROM {{source ('local_bike', 'order_items')}}