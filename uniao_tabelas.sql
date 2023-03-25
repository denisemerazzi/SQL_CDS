# Montar a grande tabela da empresa Olist, a partir da união de todas as tabelas.

SELECT
o.order_id,
o.order_status,
oi.product_id,
p.product_category_name,
or2.review_score,
op.payment_value,
op.payment_type,
s.seller_city,
g.geolocation_lat,
g.geolocation_lng
FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
LEFT JOIN order_payments op ON ( op.order_id = o.order_id )
LEFT JOIN products p ON ( p.product_id = oi.product_id )
LEFT JOIN sellers s ON ( s.seller_id = oi.seller_id )
LEFT JOIN geolocation g ON ( g.geolocation_zip_code_prefix = s.seller_zip_code_prefix )
LIMIT 20;