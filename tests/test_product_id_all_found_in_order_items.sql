-- Vérifier que chaque product_id dans order_items existe dans la table products.

SELECT
    o.product_id
FROM {{ ref('stg_orders_items') }} o

LEFT JOIN {{ ref('stg_products') }} p

    ON o.product_id = p.product_id

WHERE p.product_id IS NULL