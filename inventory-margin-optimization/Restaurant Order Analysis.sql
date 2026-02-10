# Objective 1:  Operational Health Check
# 1.1.a: What are the busiest days of the week?
SELECT
    DAYNAME(order_date) AS day_of_week,
    COUNT(DISTINCT order_id) AS number_of_orders
FROM
    fact_orders
GROUP BY
    day_of_week
ORDER BY
    number_of_orders DESC;
 
# 1.1.b What are the busiest hours within each day?
SELECT
    DAYNAME(order_date) AS day_of_week,
    HOUR(order_time) AS hour_of_day,
    COUNT(DISTINCT order_id) AS number_of_orders
FROM
    fact_orders 
GROUP BY
	DAYOFWEEK(order_date),
    day_of_week,
    hour_of_day
ORDER BY
    DAYOFWEEK(order_date), 
    number_of_orders DESC;     
    

# 1.2.a What are the most and least popular items?
SELECT
    m.item_name,
    COUNT(o.order_id) AS total_orders
FROM
	dim_menu_items m
LEFT JOIN
	fact_orders o ON m.menu_item_id = o.item_id
GROUP BY 
    m.item_name
ORDER BY
	total_orders DESC;


# 1.2.b  only the items that have never sold a single time
SELECT
    m.item_name,
    COUNT(o.order_id) AS total_orders
FROM
	dim_menu_items m
LEFT JOIN
	fact_orders o
	ON m.menu_item_id = o.item_id
GROUP BY 
    m.item_name
HAVING 
	COUNT(o.order_id) = 0;


# Objective 2:  Uncovering Profit & Marketing Drivers
# 2.1.a Which menu items and categories generate the most revenue? 
SELECT
	m.item_name,
    m.category,
    SUM(m.price) AS total_revenue
FROM
	dim_menu_items m
INNER JOIN
	fact_orders o
	ON m.menu_item_id = o.item_id
GROUP BY 
	m.item_name,
    m.category
ORDER BY 
	total_revenue DESC;


# 2.1.b Are the most popular items also the most profitable?
WITH Popularity AS (
  SELECT 
    m.menu_item_id, 
    m.item_name, 
    COUNT(o.order_id) AS total_orders 
  FROM 
    dim_menu_items m 
    LEFT JOIN fact_orders o ON m.menu_item_id = o.item_id 
  GROUP BY 
    m.menu_item_id, 
    m.item_name
), 
Revenue AS (
  SELECT 
    m.menu_item_id, 
    m.item_name, 
    m.category, 
    sum(m.price) AS total_revenue 
  FROM 
    dim_menu_items m 
    INNER JOIN fact_orders o ON m.menu_item_id = o.item_id 
  GROUP BY 
    m.menu_item_id, 
    m.item_name, 
    m.category
) 
SELECT 
  p.item_name, 
  p.total_orders, 
  r.total_revenue 
FROM 
  Popularity p 
  INNER JOIN Revenue r ON r.menu_item_id = p.menu_item_id 
ORDER BY 
  p.total_orders DESC, 
  r.total_revenue;



# 2.1.c Which menu categories generate the most revenue?
SELECT 
  m.category, 
  COUNT(o.order_id) AS total_orders, 
  SUM(m.price) AS total_revenue 
FROM 
  dim_menu_items m 
  INNER JOIN fact_orders o ON m.menu_item_id = o.item_id 
GROUP BY 
  m.category 
ORDER BY 
  total_revenue DESC;


# 2.1.d Which items are most frequently purchased together? (e.g., Hamburgers and French Fries)
WITH order_items AS(
  SELECT 
    o.order_id, 
    o.item_id, 
    m.item_name 
  FROM 
    dim_menu_items m 
    INNER JOIN fact_orders o ON m.menu_item_id = o.item_id
) 
SELECT 
  count(a.order_id) order_pairs, 
  a.item_name, 
  b.item_name 
FROM 
  order_items a 
  INNER JOIN order_items b ON a.order_id = b.order_id 
WHERE 
  a.item_id < b.item_id 
GROUP BY 
  a.item_name, 
  b.item_name 
ORDER BY 
  order_pairs DESC;



# 2.2 How does average order value (AOV) change during peak vs. off-peak hours?
WITH ordertotals AS (
    SELECT
        o.order_id,
        o.order_time,
        SUM(m.price) AS order_total
    FROM
        fact_orders o
    INNER JOIN
        dim_menu_items m ON o.item_id = m.menu_item_id
    GROUP BY
        o.order_id,
        o.order_time
)
SELECT
    CASE
        WHEN order_time BETWEEN '11:00:00' AND '14:00:00'
             OR order_time BETWEEN '18:00:00' AND '21:00:00'
        THEN 'Peak'
        ELSE 'Off-Peak'
    END AS peak_hours,
    ROUND(AVG(order_total),2) AS avg_order_total
FROM
    ordertotals
GROUP BY
    peak_hours;


# 2.3  Which items are most frequently purchased together and do they cross cuisines?
WITH order_items AS(
  SELECT 
    o.order_id, 
    o.item_id, 
    m.item_name 
  FROM 
    dim_menu_items m 
    INNER JOIN fact_orders o ON m.menu_item_id = o.item_id
), 
item_pairs AS(
  SELECT 
    COUNT(a.order_id) paired_orders, 
    a.item_name AS item_name_1, 
    b.item_name AS item_name_2 
  FROM 
    order_items a 
    INNER JOIN order_items b ON a.order_id = b.order_id 
  WHERE 
    a.item_id < b.item_id 
  GROUP BY
    item_name_1, 
    item_name_2
), 
categorypairs AS(
  SELECT 
    p.paired_orders, 
    p.item_name_1, 
    m1.category AS category_1, 
    p.item_name_2, 
    m2.category AS category_2 
  FROM 
    item_pairs p 
    LEFT JOIN dim_menu_items m1 ON m1.item_name = p.item_name_1 
    LEFT JOIN dim_menu_items m2 ON m2.item_name = p.item_name_2
) 
SELECT 
  paired_orders, 
  item_name_1, 
  category_1, 
  item_name_2, 
  category_2, 
  CASE WHEN category_1 = category_2 THEN 'Same Category' ELSE 'Cross Category' END AS category_paring 
FROM 
  categorypairs 
ORDER BY
  paired_orders DESC;


# Objective 3: Menu Engineering & Segmentation
# Segment every menu item into one of four strategic categories
WITH total_order_revenue AS (
  SELECT 
    m.item_name, 
    COUNT(o.order_id) AS total_orders, 
    SUM(m.price) AS total_revenue 
  FROM 
    dim_menu_items m 
    INNER JOIN fact_orders o ON m.menu_item_id = o.item_id 
  GROUP BY 
    m.item_name
), 
ItemRanks AS (
  SELECT 
    item_name, 
    total_orders, 
    total_revenue, 
    NTILE(2) OVER (ORDER BY total_orders DESC) AS order_ntile, 
    NTILE(2) OVER (ORDER BY total_revenue DESC) AS revenue_ntile 
  FROM 
    total_order_revenue
) 
SELECT 
  item_name, 
  CASE WHEN order_ntile = 1 
	  AND revenue_ntile = 1 THEN 'Stars' WHEN order_ntile = 1 
	  AND revenue_ntile = 2 THEN 'Workhorses' WHEN revenue_ntile = 1 
	  AND order_ntile = 2 THEN 'Puzzles' WHEN order_ntile 
	  AND revenue_ntile = 2 THEN 'Low Performers' ELSE 'other' END AS ranking 
FROM 
  ItemRanks 
ORDER BY
  ranking;
