SELECT *
FROM {{ ref('order_items') }}
WHERE quantity <= 0
   OR list_price <= 0
