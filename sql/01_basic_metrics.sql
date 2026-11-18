--1. En la primer consulta SQL se busco el total de ordenes que han sido entregadas
SELECT COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'delivered'; 

--2. La segunda consulta tiene como objetivo calcular el total de clientes por estado
SELECT
    customer_state,
    COUNT(*) AS total_clientes
FROM customers
GROUP BY customer_state
ORDER BY total_clientes DESC
LIMIT 5;

--3. La tercera consulta calcula el total factura en prodcutos y el precio promedio por item
SELECT
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(AVG(oi.price), 2) AS avg_item_price
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';