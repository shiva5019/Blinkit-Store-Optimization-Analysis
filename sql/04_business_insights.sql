USE blinkit_analytics;

-- Outlet contribution to total sales
WITH outlet_sales AS (
    SELECT outlet_identifier, SUM(sales) AS total_sales
    FROM blinkit_sales
    GROUP BY outlet_identifier
)
SELECT
    outlet_identifier,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        100 * total_sales / SUM(total_sales) OVER (),
        2
    ) AS sales_contribution_pct
FROM outlet_sales
ORDER BY total_sales DESC;

-- Category contribution to total sales
WITH category_sales AS (
    SELECT item_type, SUM(sales) AS total_sales
    FROM blinkit_sales
    GROUP BY item_type
)
SELECT
    item_type,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        100 * total_sales / SUM(total_sales) OVER (),
        2
    ) AS sales_contribution_pct
FROM category_sales
ORDER BY total_sales DESC;

-- Outlet type performance
SELECT
    outlet_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(rating), 2) AS average_rating,
    ROUND(AVG(item_visibility), 4) AS average_visibility
FROM blinkit_sales
GROUP BY outlet_type
ORDER BY total_sales DESC;

-- Identify high-sales categories
SELECT
    item_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(rating), 2) AS average_rating
FROM blinkit_sales
GROUP BY item_type
HAVING SUM(sales) >= (
    SELECT AVG(category_sales)
    FROM (
        SELECT SUM(sales) AS category_sales
        FROM blinkit_sales
        GROUP BY item_type
    ) x
)
ORDER BY total_sales DESC;
