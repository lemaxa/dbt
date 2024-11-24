with filtered_order_items as (
    select 
        order_id,
        product_id,
        quantity,
        list_price
    from {{ ref('stg_orders_items') }}
),

order_items_added as(
    select
        o.order_id,
        o.order_date,
        oi.product_id,
        oi.list_price,
        oi.quantity
from {{ ref('stg_orders') }} o
left join filtered_order_items oi
    on o.order_id = oi.order_id),


products_added as(
    select
        oia.order_id,
        oia.order_date,
        oia.product_id,
        oia.list_price,
        oia.quantity,

        p.brand_id,
        p.category_id

from {{ ref('stg_products') }} p
left join order_items_added oia
    on oia.product_id = p.product_id),

brands_added as(
    select
        pa.order_id,
        pa.order_date,
        pa.product_id,
        pa.list_price,
        pa.quantity,
        pa.brand_id,
        pa.category_id,

        b.brand_name
from {{ ref('stg_brands') }} b
left join products_added pa
    on pa.brand_id = b.brand_id),

categories_added as(
    select
        ba.order_id,
        ba.order_date,
        ba.product_id,
        ba.list_price,
        ba.quantity,
        ba.brand_id,
        ba.category_id,
        ba.brand_name,
        c.category_name
from {{ ref('stg_categories') }} c
left join brands_added ba
    on ba.category_id = c.category_id)

select 
    order_id,
    order_date,
    list_price as price,
    quantity,
    brand_name,
    category_name
from categories_added