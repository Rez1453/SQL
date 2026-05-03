-- SQL Retail Sales Analysis 
-- create database sql_project_1

-- table creation

-- drop table if exists retail_sales;
-- CREATE TABLE retail_sales
-- (
--     transactions_id INT PRIMARY KEY,
--     sale_date DATE,	
--     sale_time TIME,
--     customer_id INT,	
--     gender VARCHAR(10),
--     age INT,
--     category VARCHAR(35),
--     quantity INT,
--     price_per_unit FLOAT,	
--     cogs FLOAT,
--     total_sale FLOAT
-- );

-- Null checker
-- select * from retail_sales 
-- where transactions_id is null
-- or sale_date is null 
-- or sale_time is null
-- or customer_id is null
-- or gender is null
-- or age is null
-- or category is null
-- or quantity is null
-- or price_per_unit is null
-- or cogs is null
-- or total_sale is null;

--  delete from retail_sales
--  where transactions_id is null
-- or sale_date is null 
-- or sale_time is null
-- or customer_id is null
-- or gender is null
-- or age is null
-- or category is null
-- or quantity is null
-- or price_per_unit is null
-- or cogs is null
-- or total_sale is null;

-- number of sales
-- select count(*) as total_sale from retail_sales;

-- select count(distinct customer_id) from retail_sales;

-- select distinct category from retail_sales;

-- select * from retail_sales where sale_date = '2022-11-05';

-- SELECT *
-- FROM retail_sales
-- WHERE 
--     category = 'Clothing'
--     AND
--     quantity >= 4;


    
    
-- select category, sum(total_sale) as net_sale, count(*) as total_orders from retail_sales
-- group by 1;

-- select round(avg(age)) from retail_sales where category = 'beauty';

-- select * from retail_sales where total_sale > 1000;

-- select category, gender, count(*) as total_transactions from retail_sales
-- group by category, gender order by 1;

-- SELECT 
--        year,
--        month,
--     avg_sale
-- FROM 
-- (    
-- SELECT 
--     EXTRACT(YEAR FROM sale_date) as year,
--     EXTRACT(MONTH FROM sale_date) as month,
--     AVG(total_sale) as avg_sale
-- FROM retail_sales
-- GROUP BY 1, 2
-- ) as t1;

-- SELECT 
--     customer_id,
--     SUM(total_sale) as total_sales
-- FROM retail_sales
-- GROUP BY 1
-- ORDER BY 2 DESC
-- LIMIT 5;

-- SELECT 
--     category,
--     count(distinct customer_id) as count_unique_customer
-- FROM retail_sales
-- GROUP BY category;

WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;