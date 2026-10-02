USE blinkit_analytics;

DROP TABLE IF EXISTS blinkit_sales;

CREATE TABLE blinkit_sales (
    item_fat_content VARCHAR(30),
    item_identifier VARCHAR(20),
    item_type VARCHAR(60),
    outlet_establishment_year INT,
    outlet_identifier VARCHAR(20),
    outlet_location_type VARCHAR(20),
    outlet_size VARCHAR(20),
    outlet_type VARCHAR(40),
    item_visibility DECIMAL(12,8),
    item_weight DECIMAL(10,2),
    sales DECIMAL(14,4),
    rating DECIMAL(3,2),
    outlet_age INT,
    sales_per_weight DECIMAL(14,4)
);
