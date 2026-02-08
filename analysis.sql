-- Analysis (MySQL)
-- 1. Identify top 5 products per region using RANK()
SELECT 
    c.region,
    p.product_name,
    SUM(s.total_amount) as total_sales,
    RANK() OVER (PARTITION BY c.region ORDER BY SUM(s.total_amount) DESC) as product_rank
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region, p.product_name;


-- 2. Calculate running monthly sales totals using SUM() OVER()
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m-01') as sale_month,
    SUM(total_amount) as monthly_sales,
    SUM(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(sale_date, '%Y-%m-01')) as running_total
FROM sales
GROUP BY sale_month
ORDER BY sale_month;


-- 3. Analyze month-over-month (MoM) sales growth using LAG()
SELECT 
    sale_month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sale_month) as prev_month_sales,
    CONCAT(ROUND(((total_sales - LAG(total_sales) OVER (ORDER BY sale_month)) / 
           NULLIF(LAG(total_sales) OVER (ORDER BY sale_month), 0)) * 100, 2), '%') as mom_growth_pct
FROM (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m-01') as sale_month,
        SUM(total_amount) as total_sales
    FROM sales
    GROUP BY sale_month
) AS MonthlySales;


-- 4. Segment customers into quartiles based on total spending using NTILE(4)
SELECT 
    full_name,
    total_spent,
    NTILE(4) OVER (ORDER BY total_spent DESC) as customer_segment
FROM (
    SELECT 
        c.customer_id,
        c.full_name,
        SUM(s.total_amount) as total_spent
    FROM customers c
    JOIN sales s ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.full_name
) AS CustomerSpending;


-- 5. Compute a 3-month moving average of sales using AVG() OVER()
SELECT 
    sale_month,
    total_sales,
    ROUND(AVG(total_sales) OVER (ORDER BY sale_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as three_month_moving_avg
FROM (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m-01') as sale_month,
        SUM(total_amount) as total_sales
    FROM sales
    GROUP BY sale_month
) AS MonthlySales;
