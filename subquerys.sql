# SUBQUERYS

# 1. Qual o número de pedido com o tipo de pagamento igual a “boleto”?

SELECT
COUNT( o.order_id ) AS order_id
FROM orders o
WHERE o.order_id IN ( SELECT DISTINCT op.order_id FROM order_payments op WHERE op.payment_type = 'boleto' )


# 2. Refaça o exercício 01 usando união de tabelas.

SELECT 
	COUNT(o.order_id) AS order_id,
	op.payment_type
FROM orders o LEFT JOIN order_payments op ON (op.order_id=o.order_id)
WHERE op.payment_type ='boleto'

# 3. Cria uma tabela que mostre a média de avaliações por dia, 
# a média de preço por dia, a
# soma dos preços por dia, 
# o preço mínimo por dia, 
# o número de pedidos por dia e o 
# número de clientes únicos que compraram no dia.

SELECT
  t1.date_,
  t1.avg_review,
  t2.avg_price,
  t2.sum_price,
  t2.min_price,
  t3.pedido_por_dia,
  t3.clientes_unicos
FROM (SELECT
  DATE( review_creation_date ) AS date_,
  AVG( review_score ) AS avg_review
  FROM order_reviews or2
  GROUP BY DATE( review_creation_date )) AS t1 LEFT JOIN ( SELECT
           DATE( oi.shipping_limit_date ) AS date_,
           AVG( price ) AS avg_price,
           SUM( price ) AS sum_price,
           MIN( price ) AS min_price
  FROM order_items oi
  GROUP BY DATE( oi.shipping_limit_date )) AS t2 ON ( t2.date_ = t1.date_)
  LEFT JOIN (SELECT
           DATE( o.order_purchase_timestamp ) AS date_,
           COUNT( o.order_id ) AS pedido_por_dia,
           COUNT( DISTINCT o.customer_id ) AS clientes_unicos
FROM orders o
GROUP BY DATE( o.order_purchase_timestamp )) AS t3 ON ( t3.date_ = t1.date_)

# 4.  Eu gostaria de saber, por categoria, a quantidade de produtos, 
# o tamanho médio do produto, o tamanho médio da categoria alimentos e o tamanho médio geral.

SELECT
  p.product_category_name,
  COUNT( DISTINCT p.product_id ) AS produto,
  AVG( DISTINCT p.product_length_cm ) AS avg_length,
  ( SELECT AVG( DISTINCT p2.product_length_cm ) FROM products p2 WHERE p2.product_category_name ='alimentos' ) AS avg_length_alimentos
  ( SELECT AVG( DISTINCT p2.product_length_cm ) FROM products p2) AS avg_length_all
FROM products p
GROUP BY p.product_category_name

# 5. Qual o nome da categoria de produto com o maior preço de venda? 
# Encontre a categoria do produto somente com Subqueries.

SELECT
  p.product_category_name
FROM products p
WHERE p.product_id = ( SELECT product_id
  FROM ( SELECT
    product_id,
    MAX( max_product ) AS max_all
     FROM ( SELECT
     product_id,
     MAX( price ) as max_product
   FROM order_items oi
   GROUP BY product_id ) ) )