# Restaurant Order Analysis

**Case Study: SQL Analytics**

> **Executive Summary:**  
> Taste of the World Cafe faced a disconnect between menu complexity and operational profitability. By leveraging advanced SQL techniques (CTEs, Window Functions), this analysis categorized menu efficiency, revealing that the highest-volume item (Hamburger) was underperforming in revenue, while the "Italian" segment was a hidden driver of profitability. The recommendations below outline a strategy to optimize staffing for lunch peaks and restructure the menu to feature high-margin items.

---

### Key Insights

| **Top Revenue**                    | **Peak Volume**                 | **Star Item**                                  | **Fusion Factor**                          |
| :--------------------------------- | :------------------------------ | :--------------------------------------------- | :----------------------------------------- |
| **Italian**<br>Cuisine Performance | **Lunch**<br>Mon/Fri/Sun Demand | **Korean Beef Bowl**<br>High Profit / High Vol | **49% Drop-off**<br>Conversion Opportunity |

---

## Query Showcase

### 1. Temporal Traffic Analysis

**Identifying the bottleneck hours using cron-style SQL ordering.**

```sql
SELECT
    DAYNAME(order_date) AS day_of_week,
    HOUR(order_time) AS hour_of_day,
    COUNT(DISTINCT order_id) AS number_of_orders
FROM fact_orders
GROUP BY
    DAYOFWEEK(order_date), day_of_week, hour_of_day
ORDER BY
    DAYOFWEEK(order_date), number_of_orders DESC;
```

- **Result:** Lunch hours on Mon/Fri/Sun are critical peaks. Recommended staffing increase specifically for these windows to maintain service SLAs.

### 2. Strategic Menu Matrix (CTE + NTILE)

**Classification of menu items into 'Stars', 'Puzzle', 'Workhorse', and 'Dud'.**

```sql
WITH total_order_revenue AS (
    SELECT
        m.item_name,
        COUNT(o.order_id) AS total_orders,
        SUM(m.price) AS total_revenue
    FROM dim_menu_items m
    INNER JOIN fact_orders o ON m.menu_item_id = o.item_id
    GROUP BY m.item_name
),
ItemRanks AS (
    SELECT
        item_name, total_orders, total_revenue,
        NTILE(2) OVER (ORDER BY total_orders DESC) AS order_ntile,
        NTILE(2) OVER (ORDER BY total_revenue DESC) AS revenue_ntile
    FROM total_order_revenue
)
SELECT
    item_name, total_orders, total_revenue,
    CASE
        WHEN order_ntile = 1 AND revenue_ntile = 1 THEN 'Star'
        WHEN order_ntile = 1 AND revenue_ntile = 2 THEN 'Workhorse'
        WHEN order_ntile = 2 AND revenue_ntile = 1 THEN 'Puzzle'
        WHEN order_ntile = 2 AND revenue_ntile = 2 THEN 'Dud'
    END AS item_category
FROM ItemRanks;
```

- **Result:** Isolated 'Stars' vs 'Duds'. Revealed that the Hamburger (Volume Leader) isn't the primary Revenue Driver, prompting a re-valuation of bundling strategies.

---

## Building the Data Pipeline

### 1. Schema Foundation (Dimensional Modeling)

**Constructed a robust dimensional model (Star Schema).**
Joined operational fact tables with menu dimension items to create a reliable playground for complex analytical queries.

### 2. Basket Analysis (Self-Joins)

**Executed self-joins on the `fact_orders` table.**
Uncovered cross-cuisine purchasing behavior. Found that customers frequently pair American staples with Asian sides.

### 3. Operational Logic (CASE Expressions)

**Engineered automated categorization.**
This removed manual guesswork for the management team, providing a live "Menu Dashboard" via SQL views.

---

## Strategic Recommendations

### Revenue Gains

- **Promote "Stars":** Focus on items like the **Korean Beef Bowl** to maximize high-margin sales.
- **Staffing Optimization:** Target staffing for peak lunchtime windows (Mon, Fri, Sun).

### Menu Optimization

- **Italian "Puzzles":** Promote the Italian category as the primary revenue segment that needs higher visibility.
- **Fusion Combos:** Launch combos based on identified basket pairing trends (e.g., Burger + Edamame).

---

## Technical Implementation

### Database Schema

The analysis is built on a Star Schema structure:

- **`fact_orders`**: Transactional table containing `order_id`, `item_id`, `order_date`, and `order_time`.
- **`dim_menu_items`**: Dimension table containing `menu_item_id`, `item_name`, `category`, and `price`.

### Setup Instructions

1.  **Prerequisites:** Install [MySQL Workbench](https://www.mysql.com/products/workbench/).
2.  **Data Import:**
    - Unzip `Restaurant Orders MySQL.zip`.
    - Load the `.csv` files into your local MySQL instance.
    - Run `Restaurant Order Analysis.sql` to generate the views and tables.

---

## Contact

**Need SQL Clarity?**
[Email](mailto:mcam215@gmail.com) | [LinkedIn](https://linkedin.com/in/michaelcampbellanalyst) | [GitHub](https://github.com/michaelcampbell215)
