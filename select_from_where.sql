#1. Gerar uma tabela com: Id_cliente, cidade e estado

SELECT 
	customer_id,
	customer_city,
	customer_state
FROM customer

#2. Gerar uma tabela com Id_cliente e cidades, apenas em Santa Catarina

SELECT 
	customer_id,
	customer_city,
	customer_state
FROM customer
WHERE customer_state = 'SC'

#3. Gerar uma tabela com Id_cliente, estado, na cidade de Florianopolis

SELECT 
	customer_id,
	customer_city
FROM customer
WHERE customer_city = 'florianopolis'

#4. Gerar uma tabela com Estado, latitude, longitude, do estado de São Paulo

SELECT 
	geolocation_lat,
	geolocation_lng,
	geolocation_state
FROM geolocation
WHERE geolocation_state='SP'

#5. Gerar uma tabela com Id_produto, data de envio, preço, para produtos mais caros que 6300

SELECT 
	order_id,
	order_estimated_delivery_date,
	geolocation_state,
	payment_value
FROM orders 
WHERE payment_value>6300

#6. Gerar uma tabela com id_pedido, tipo_pagamento e o numero_parcelas menores que 1.

SELECT 
	payment_sequential,
	payment_type
FROM order_payments
WHERE payment_sequential<1

#7. Gerar uma tabela com id_pedido, id_cliente, status_pedido, data_aprovacao, para compras aprovadas até 5/5/2016)

SELECT 
	order_id,
	customer_id,
	order_status,
	order_approved_at
FROM orders
WHERE order_approved_at < '2016-05-05'