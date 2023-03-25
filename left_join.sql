# LEFT JOIN

# 1. Gerar uma tabela de dados com 20 linhas e contendo as seguintes colunas: 
# 1) Id do pedido, 2) status do pedido, 3) id do produto, 4) categoria do produto, 
# 5) avaliação do pedido, 6) valor do pagamento, 7) tipo do pagamento, 
# 8) cidade do vendedor, 9) latitude e longitude da cidade do vendedor.

SELECT
  o.order_id,
  o.order_status,
  p.product_id,
  p.product_category_name,
  or2.review_score,
  op.payment_value,
  op.payment_type,
  s.seller_city,
  g.geolocation_lat,
  g.geolocation_lng 
FROM orders o LEFT JOIN order_items oi ON (oi.order_id=o.order_id)
			  LEFT JOIN products p ON(p.product_id=oi.product_id)
			  LEFT JOIN order_reviews or2 ON (or2.order_id=o.order_id)
			  LEFT JOIN order_payments op ON (op.order_id=o.order_id)
			  LEFT JOIN sellers s ON (s.seller_id=oi.seller_id)
			  LEFT JOIN geolocation g ON (g.geolocation_zip_code_prefix=s.seller_zip_code_prefix)
LIMIT 20;


# Quantos tipo de pagamentos forma usados pelo cliente para pagar o pedido 'e481f51cbdc54678b7cc49136f2d6af7'. 

SELECT 
	o.order_id,
	o.order_status,
	p.product_category_name,
	op.payment_type
	FROM orders o LEFT JOIN order_items oi ON ( oi.order_id = o.order_id )
                  LEFT JOIN products p ON ( p.product_id = oi.product_id )
                  LEFT JOIN order_payments op ON ( op.order_id = o.order_id )
WHERE o.order_id = 'e481f51cbdc54678b7cc49136f2d6af7'
	

# 3. Quantos pedidos tem mais de 5 items? 

SELECT
  o.order_id,
  COUNT(DISTINCT oi.product_id)
FROM orders o LEFT JOIN order_items oi ON (oi.order_id=o.order_id) 
GROUP BY o.order_id 
HAVING COUNT(DISTINCT oi.product_id) >5




# 4. Qual a cardinalidade entre a tabela Pedidos ( orders ) e Avaliações (reviews )? 

SELECT
	o.order_id,
	COUNT( or2.review_id ) AS review_id
FROM orders o LEFT JOIN order_reviews or2 ON ( or2.order_id = o.order_id )
GROUP BY o.order_id
HAVING COUNT( or2.review_id ) > 1

# Resposta: A cardinalidade é 1:N (porque existe mais de uma avaliação por pedido)

# 5.  Quantos pedidos (orders) não tem nenhuma avaliação (review) ?

SELECT 
  o.order_id, 
  or2.review_score  
FROM orders o LEFT JOIN order_reviews or2 ON (o.order_id=or2.order_id)
WHERE or2.order_id IS NULL 

# 6.  Quais são os top 10 vendedores com mais clientes?

SELECT 
  s.seller_id,
  COUNT(c.customer_id) AS customer_id
FROM orders o LEFT JOIN order_items oi  ON (oi.order_id=o.order_id) 
			  LEFT JOIN customer c  ON(c.customer_id=o.customer_id) 
			  LEFT JOIN sellers s  ON(s.seller_id=oi.seller_id) 
GROUP BY s.seller_id 
ORDER BY customer_id DESC 
LIMIT 10; 


# 7. Quantos pedidos (orders) não possuem nenhum produto (products)?

SELECT 
	COUNT(o.order_id)
FROM orders o LEFT JOIN order_items oi ON (oi.order_id =o.order_id)
	          LEFT JOIN products p ON (p.product_id=oi.product_id)
WHERE p.product_id ISNULL
