# AGRUPAMENTOS

# 1. Qual o número de clientes únicos de todos os estados?
SELECT
	customer_id,	
	COUNT(DISTINCT c.customer_id) AS numero_clientes
FROM customer c 
GROUP BY customer_state

#2. Qual o número de cidades únicas de todos os estados?
SELECT 
	customer_state,
	COUNT( DISTINCT customer_city ) AS numero_cidades
FROM customer c
GROUP BY customer_state

#3. Qual o número de clientes únicos por estado e por cidade?
SELECT 
	customer_id,
	customer_state,
	customer_city, 
	COUNT(DISTINCT c.customer_id ) AS clientes_estado_cidade
FROM customer c 
GROUP BY customer_state, customer_city

# 4. Qual o número de clientes únicos por cidade e por estado?
SELECT 
	customer_id,
	customer_city, 
	customer_state,
	COUNT(DISTINCT c.customer_id ) AS clientes_cidade_estado
FROM customer c 
GROUP BY  customer_city, customer_state

#5. Qual o número total de pedidos únicos acima de R$ 3.500 por cada vendedor?
SELECT 
	seller_id,
	COUNT (DISTINCT order_item_id) AS pedidos_vendedores
FROM order_items oi
WHERE price >3500
GROUP BY seller_id

#6 Qual o número total de pedidos únicos, a data mínima e máxima de envio, o valor máximo, mínimo e médio do frete
# dos pedidos acima de R$ 1.100 por cada vendedor?
SELECT 
	seller_id, 
	COUNT( DISTINCT order_id) as pedidos_unicos,
	MIN (oi.shipping_limit_date) as data_minima_envio,
	MAX (oi.shipping_limit_date) as data_maxima_envio,
	MIN (oi.freight_value) as frete_minimo,
	MAX (oi.freight_value) as frete_maximo
FROM order_items oi 
WHERE price > 1100
GROUP BY seller_id

#7. Qual o valor médio, máximo e mínimo do preço de todos
# os pedidos de cada produto?
SELECT
	oi.product_id, 
	AVG(oi.price),
	MAX(oi.price),
	MIN(oi.price)
FROM order_items oi 
GROUP BY product_id

#8. Qual a quantidade de vendedores distintos que
#receberam algum pedido antes do dia 23 de setembro de
#2016 e qual foi o preço médio desses pedidos?
SELECT 
	shipping_limit_date, 
	COUNT(DISTINCT oi.seller_id) AS vendedores,
	AVG(price) AS preco_medio
FROM order_items oi 
WHERE shipping_limit_date < '2016-09-23 00:00:00'
GROUP BY shipping_limit_date

#10. Qual a quantidade de pedidos por tipo de pagamentos?
SELECT 
	payment_type, 
	COUNT(op.order_id) AS quant_pedidos
FROM order_payments op 
GROUP BY payment_type

#11. Qual a quantidade de pedidos, a média do valor do
#pagamento e o número máximo de parcelas por tipo de pagamentos?
SELECT 
	payment_type, 
	COUNT (op.order_id) AS qunat_pedidos,
	AVG (op.payment_value) AS valor_pagamento,
	MAX(payment_installments) AS max_parcelas
FROM order_payments op 
GROUP BY payment_type

# 12. Qual a valor mínimo, máximo, médio e as soma total
# paga por cada tipo de pagamento e número de parcelas disponíveis?
SELECT 
	payment_type, 
	payment_installments, 
	MIN (op.payment_value) AS min_pag,
	AVG (op.payment_value) AS media_pag,
	MAX(op.payment_value) AS max_pag
FROM order_payments op 
GROUP BY payment_type, payment_installments

#14. Qual a média de pedidos por cliente?
SELECT
	o.customer_id, 
	AVG (o.order_id) AS media_pedidos 
FROM orders o 
GROUP BY o.customer_id

# 15. Qual a quantidade de pedidos realizados por cada
# status do pedido, a partir do dia 23 de Setembro de 2016?
SELECT
	o.order_status,
	COUNT (o.order_id) AS pedido
FROM orders o 
WHERE order_approved_at > '2016-09-23 00:00:00'
GROUP BY order_status

# 16. Qual a quantidade de pedidos realizados por dia, a
# partir do dia 23 de Setembro de 2016?
SELECT 
	DATE(order_approved_at) AS data_,
	COUNT(order_id) AS pedidos
FROM orders o 
WHERE order_approved_at > '2016-09-23 00:00:00'
GROUP BY DATE(order_approved_at)

#17. Quantos produtos estão cadastrados na empresa por categoria?
SELECT 
	product_category_name, 
	COUNT(DISTINCT product_id) AS categorias_prod
FROM products p 
GROUP BY product_category_name