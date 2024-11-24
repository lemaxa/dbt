{{ config(
    partition_by={
        'field': 'order_date',
        'data_type': 'DATE'
    }
) }}

SELECT
    CAST(order_id AS STRING) AS order_id,
    CAST(staff_id AS STRING) AS staff_id,
    order_date

FROM {{source ('local_bike', 'orders')}}

WHERE
    EXTRACT(YEAR FROM order_date) = 2018