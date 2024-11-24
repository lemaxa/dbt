SELECT
    order_id,
    order_date,
    SUM(price * quantity) as turnover,
    brand_name,
    category_name

FROM {{ref ('int_orders_detailed')}}

WHERE order_id IS NOT NULL

GROUP BY 1,2,4,5

ORDER BY order_id ASC