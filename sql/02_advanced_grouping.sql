--4. La siguiente consulta identifica por vendedor el total de ventas y cuantos de ellos lograron venderos +1000 productos
SELECT
    oi.seller_id,
    ROUND(SUM(oi.price), 2) as total_revenue,
    COUNT(*) AS items_sold
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
HAVING COUNT(*) > 1000
ORDER BY total_revenue DESC;

--5. La siguiente consulta clasifica por categoria los productos que mas se han vendido, la cantidad de productos y el promedio de ventas.
SELECT
    t.product_category_name_english AS category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(COUNT(*), 2) AS items_sold,
    ROUND(AVG(oi.price), 2) AS avg_items
FROM order_items oi
JOIN orders o 
    ON oi.order_id = o.order_id
JOIN products p 
    ON oi.product_id = p.product_id
JOIN translation t
    ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY t.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 5;

--6. Consulta para segmentar los pedidos por tamaño de items. 
WITH order_item_counts AS (
        SELECT 
            o.order_id,
            COUNT(oi.order_item_id) AS items_count
        FROM orders o
        JOIN order_items oi 
            ON o.order_id = oi.order_id
        WHERE o.order_status = 'delivered'
        GROUP BY o.order_id
    )
    SELECT 
        CASE 
            WHEN items_count = 1 THEN 'Single Item'
            WHEN items_count BETWEEN 2 AND 3 THEN 'Small Basket'
            ELSE 'Large Basket'
        END AS basket_segment,
        COUNT(*) AS total_orders,
        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_orders
    FROM order_item_counts
    GROUP BY basket_segment
    ORDER BY total_orders DESC;