-- 7. Segmentación de pedidos por valor de ingreso. 
    WITH order_totals AS (
        SELECT
            o.order_id,
            SUM(oi.price) AS order_value
        FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        WHERE o.order_status = 'delivered'
        GROUP BY o.order_id
    )
    SELECT
        CASE
            WHEN order_value < 50 THEN 'Low Ticket'
            WHEN order_value BETWEEN 50 AND 200 THEN 'Medium Ticket'
            ELSE 'High Ticket'
        END AS ticket_tier,
        COUNT(*) AS total_orders,
        ROUND(SUM(order_value), 2) AS total_revenue,
        ROUND(SUM(order_value) * 100 / SUM(SUM(order_value)) OVER (), 2) AS pct_revenue
    FROM order_totals
    GROUP BY ticket_tier
    ORDER BY total_revenue DESC;

--8 Consulta para agrupar por region las ventas y reviews.
    WITH order_region_data AS (
        SELECT 
            o.order_id,
            CASE
                WHEN c.customer_state = 'SP' THEN 'Sao Paulo'
                WHEN c.customer_state IN ('RJ', 'MG', 'ES') THEN 'Sudeste'
                WHEN c.customer_state IN ('PR', 'SC', 'RS') THEN 'Sur'
                ELSE 'Otras Regiones'
            END AS macro_regiones,
            r.review_score,
            CASE
                WHEN o.order_delivered_customer_date > order_estimated_delivery_date THEN 1
                ELSE 0
            END AS is_late
        FROM orders o
        JOIN customers c 
            ON o.customer_id = c.customer_id
        JOIN order_reviews r
            ON o.order_id = r.order_id
        WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
    )
    SELECT 
        macro_regiones,
        COUNT(*) AS total_orders,
        ROUND(AVG(review_score), 2) AS avg_review_score,
        ROUND(AVG(is_late) * 100, 2) AS pct_late_orders
    FROM order_region_data
    GROUP BY macro_regiones
    HAVING COUNT(*) > 5000
    ORDER BY macro_regiones ASC;