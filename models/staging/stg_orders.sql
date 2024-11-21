SELECT
    CAST(order_id AS STRING) AS order_id,
    DATE(shipped_date) AS order_date

FROM {{source ('local_bike', 'orders')}}