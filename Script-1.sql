SELECT 
    oi.products_id,
    AVG (oi.price) AS avg_price
FROM order_items oi
WHERE oi.product_id IN (SELECT p.product_id
                        FROM products p
                        WHERE p.product_category_name IN ('perfumaria', 'artes')
                        
                        
                        
                        
SELECT 
    AVG (oi.price)
FROM order_items oi 
WHERE oi.product_id IN (SELECT p.product_id
                        FROM products p
                        WHERE p.product_category_name IN ('perfumaria', 'artes'))
                        
SELECT 
    oi.product_id,
    (SELECT p.product_category_name  FROM products p WHERE p.product_id=oi.product_id) AS category 
FROM order_items oi 
LIMIT 10

SELECT
    p.product_category_name, 
    (SELECT  AVG(oi.price) FROM order_items oi) AS avg_price_all, 
    (SELECT AVG(oi2.price) FROM order_items oi2 WHERE oi2.product_id=p.product_id) AS avg_price_category
FROM products p
LIMIT 20


SELECT
    oi.product_id,
    ( SELECT p.product_category_name
FROM products p
WHERE p.product_id = oi.product_id ) AS category
FROM order_items oi
LIMIT 10


SELECT
    AVG (review_id), 
FROM order_reviews or2
WHERE p.product_id IN(SELECT product_id FROM products WHERE product_category_name IN ('calca','sapato'))

SELECT AVG(oi.price) AS avg_price
FROM order_items oi  
WHERE oi.order_id  IN (SELECT o.order_id
                        FROM orders o
                        WHERE o.order_status='delivered')
                        
SELECT 
    DATE (or2.review_creation_date) AS date_, 
    AVG(review_score) 
FROM order_reviews or2
GROUP BY or2.review_creation_date 

SELECT 
    DATE(oi.shipping_limit_date) AS date_, 
    AVG(oi.price) AS avg_price,
    SUM(oi.price) AS sum_price,
    MAX(oi.price) AS max_price,
    MIN(oi.price) AS min_price
FROM order_items oi
GROUP BY DATE(oi.shipping_limit_date) 


SELECT 
    DATE(o.order_purchase_timestamp) AS date_,
    COUNT (DISTINCT customer_id) AS unique_customers
FROM orders o
GROUP BY DATE(o.order_purchase_timestamp)  
    
 
FROM (SELECT 
                DATE (or2.review_creation_date) AS date_, 
                AVG(review_score) AS avg_reviews
                FROM order_reviews or2
                GROUP BY or2.review_creation_date )) AS t1 INNER JOIN (SELECT 
                                                                                                                                    DATE(oi.shipping_limit_date) AS date_, 
                                                                                                                                    AVG(oi.price) AS avg_price,
                                                                                                                                    SUM(oi.price) AS sum_price,
                                                                                                                                    MAX(oi.price) AS max_price,
                                                                                                                                    MIN(oi.price) AS min_price
                                                                                                                                FROM order_items oi
                                                                                                                                GROUP BY DATE(oi.shipping_limit_date) ) AS t2 ON (t1.date_=t2.date_)
                                                                                                                                          INNER JOIN (SELECT 
                                                                                                                                                                                DATE(o.order_purchase_timestamp) AS date_,
                                                                                                                                                                                COUNT (DISTINCT customer_id) AS unique_customers
                                                                                                                                                                            FROM orders o
                                                                                                                                                                            GROUP BY DATE(o.order_purchase_timestamp)) AS t3 ON (t3.date_=t1.date_)

WHERE t1.date_BETWEEN '2016-10-02' AND '2016-10-09';




SELECT
	t1.date_,
	t1.avg_reviews,
	t2.avg_price,
	t2.sum_price,	
	t2.max_price,
	t2.min_price,
	t3.unique_customers
FROM 
(
  SELECT 
    DATE (or2.review_creation_date) AS date_, 
    AVG (review_score) AS avg_reviews
    FROM order_reviews or2
    GROUP BY or2.review_creation_date
) AS t1 
INNER JOIN 
(
  SELECT 
    DATE(oi.shipping_limit_date) AS date_, 
    AVG(oi.price) AS avg_price,
    SUM(oi.price) AS sum_price,
    MAX(oi.price) AS max_price,
    MIN(oi.price) AS min_price
  FROM order_items oi
  GROUP BY DATE(oi.shipping_limit_date) 
) AS t2 
  ON (t1.date_=t2.date_)
INNER JOIN (
  SELECT 
    DATE(o.order_purchase_timestamp) AS date_,
    COUNT (DISTINCT customer_id) AS unique_customers
  FROM orders o
  GROUP BY DATE(o.order_purchase_timestamp)
) AS t3 ON (t3.date_=t1.date_)
WHERE t1.date_BETWEEN '2016-10-02' AND '2016-10-09';