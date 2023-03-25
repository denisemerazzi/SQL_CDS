# FUNÇÕES AGREGADORAS

# 1. Qual o número de clientes únicos do estado de Minas Gerais? (11.635)
SELECT 
	COUNT (DISTINCT customer_id)
FROM customer c
WHERE 
	customer_state='MG'

# 2. Qual a quantidade de cidades únicas dos vendedores do estado de Santa Catarina?(420)
SELECT 
	COUNT (DISTINCT geolocation_city)
FROM geolocation g
WHERE
	geolocation_state='SC'

# 3. Qual a quantidade de cidades únicas de todos os vendedores da base?(8011)
SELECT 
	COUNT(DISTINCT geolocation_city)
FROM geolocation g

# 4. Qual o número total de pedidos únicos acima de R$ 3.500? (18)
SELECT 
	COUNT(DISTINCT order_id)
FROM order_items oi
WHERE 
	price > 3500

# 5. Qual o valor médio do preço de todos os pedidos? (R$120)
SELECT 
	AVG(price)
FROM order_items oi

# 6. Qual o maior valor de preço entre todos os pedidos?(R$6,70)
SELECT 
	MAX(price)
FROM order_items oi

# 7. Qual o menor valor de preço entre todos os pedidos?(R$ 0,85)
SELECT 
	MIN(price)
FROM order_items oi

# 8. Qual a quantidade de produtos distintos vendidos abaixo do preço de R$ 100.00? (20.112)
SELECT 
	COUNT(DISTINCT product_id)
FROM order_items oi
WHERE price < 100

# 9. Qual a quantidade de vendedores distintos que receberam algum pedido antes do dia 23 de setembro de 2016? (2)
SELECT 
	COUNT(DISTINCT seller_id)
FROM order_items oi
WHERE 
	shipping_limit_date <'2016-09-23 00:00:00'

# 10. Quais os tipos de pagamentos existentes?
# credit_card, boleto, voucher, debit_card, not_defined
SELECT
	DISTINCT payment_type
FROM order_payments op

# 11. Qual o maior número de parcelas realizado? (24)
SELECT
	MAX (payment_installments)
FROM order_payments op

# 12. Qual o menor número de parcelas realizado? (0)
SELECT
	MIN (payment_installments)
FROM order_payments op

# 13. Qual a média do valor pago no cartão de crédito?(R$163,31)
SELECT
	AVG (payment_value)
FROM order_payments op
WHERE 
	payment_type='credit_card'

# 14. Quantos tipos de status para um pedido existem?(8)
SELECT 
	COUNT(DISTINCT order_status)
FROM orders o

# 15. Quais os tipos de status para um pedido?
(delivered,invoiced, shipped, processing,unavailable,canceled,created,approved)
SELECT 
	DISTINCT order_status
FROM orders o

# 16. Quantos clientes distintos fizeram um pedido?(99.441)
SELECT 	
	COUNT(DISTINCT customer_id)
FROM orders o

# 17. Quantos produtos estão cadastrados na empresa?(32.951)
SELECT
	COUNT(DISTINCT product_id) 
FROM
	products p

# 18. Qual a quantidade máxima de fotos de um produto?(20)
SELECT
	MAX (product_photos_qty)
FROM products p

# 19. Qual o maior valor do peso entre todos os produtos?(40.425)
SELECT
	MAX (DISTINCT product_weight_g)
FROM products p

# 20. Qual a altura média dos produtos? (52.6)
SELECT
	AVG (DISTINCT product_height_cm)
FROM  products p