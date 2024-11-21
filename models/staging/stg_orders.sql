{{ config(
    partition_by={
        'field': 'order_date',
        'data_type': 'DATE'
    }
) }}

SELECT
    CAST(order_id AS STRING) AS order_id,
    order_date

FROM {{source ('local_bike', 'orders')}}

WHERE
    EXTRACT(YEAR FROM order_date) = 2018