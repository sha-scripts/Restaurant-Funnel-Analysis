-- Checked dt is consistent (it's YYYYMMDD as integer; no change needed if loaded as text/int)
-- Creating a temporary table for aggregated orders per day per restaurant(because funnel is analyzed on a daily basis)
CREATE temporary TABLE daily_orders AS
SELECT 
    res_id,
    dt,
    COUNT(tab_id) AS order_count
FROM orders
GROUP BY res_id, dt;

-- Main funnel analysis query
SELECT 
    r.res_name AS restaurant,
    r.area,
    r.cuisine,
    SUM(f.menu_opens) AS total_menu_opens,
    SUM(f.cart_built) AS total_cart_built,
    COALESCE(SUM(do.order_count), 0) AS total_orders,  -- Handle restaurants with no orders
    ROUND(CAST(SUM(f.cart_built) AS REAL) / NULLIF(SUM(f.menu_opens), 0) * 100, 2) AS cart_conversion_rate,  -- % of menu opens to carts
    ROUND(CAST(SUM(do.order_count) AS REAL) / NULLIF(SUM(f.cart_built), 0) * 100, 2) AS order_conversion_rate,  -- % of carts to orders
    ROUND(CAST(SUM(do.order_count) AS REAL) / NULLIF(SUM(f.menu_opens), 0) * 100, 2) AS overall_conversion_rate  -- % of menu opens to orders
FROM res r
LEFT JOIN funnel f ON r.res_id = f.res_id
LEFT JOIN daily_orders do ON r.res_id = do.res_id AND f.dt = do.dt  -- Matching on date for accurate daily funnel
GROUP BY r.res_id, r.res_name, r.area, r.cuisine
ORDER BY total_menu_opens DESC;  -- Sorted by most engaged restaurants

