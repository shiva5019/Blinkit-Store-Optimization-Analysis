USE blinkit_analytics;

-- 1. Overall KPIs
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records,
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(DISTINCT item_identifier) AS unique_items,
    COUNT(DISTINCT outlet_identifier) AS unique_outlets
FROM blinkit_sales;

-- 2. Sales by outlet
SELECT
    outlet_identifier,
    outlet_type,
    outlet_size,
    outlet_location_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY outlet_identifier, outlet_type, outlet_size, outlet_location_type
ORDER BY total_sales DESC;

-- 3. Sales by item category
SELECT
    item_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY item_type
ORDER BY total_sales DESC;

-- 4. Sales by outlet type
SELECT
    outlet_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY outlet_type
ORDER BY total_sales DESC;

-- 5. Sales by location tier
SELECT
    outlet_location_type,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY outlet_location_type
ORDER BY total_sales DESC;

-- 6. Sales by outlet size
SELECT
    outlet_size,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY outlet_size
ORDER BY total_sales DESC;

-- 7. Fat-content performance
SELECT
    item_fat_content,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY item_fat_content
ORDER BY total_sales DESC;

-- 8. Establishment-year trend
SELECT
    outlet_establishment_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales
FROM blinkit_sales
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;

-- 9. Top 10 item categories by sales
SELECT
    item_type,
    ROUND(SUM(sales), 2) AS total_sales
FROM blinkit_sales
GROUP BY item_type
ORDER BY total_sales DESC
LIMIT 10;

-- 10. Rating vs sales
SELECT
    rating,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    COUNT(*) AS records
FROM blinkit_sales
GROUP BY rating
ORDER BY rating;
