-- JOIN Demonstrations (MySQL)

-- 1. INNER JOIN
SELECT 
    s.sale_id, 
    c.full_name, 
    p.product_name, 
    s.total_amount
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id;


-- 2. LEFT JOIN
-- Customers who never made a purchase
SELECT 
    c.full_name, 
    c.region, 
    s.sale_id
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;


-- 3. RIGHT JOIN
-- Products that never sold
SELECT 
    p.product_name, 
    p.category, 
    s.sale_id
FROM sales s
RIGHT JOIN products p ON s.product_id = p.product_id
WHERE s.sale_id IS NULL;


-- 4. FULL OUTER JOIN Polyfill (MySQL doesn't support FULL OUTER JOIN natively)
-- We use a UNION of a LEFT JOIN and a RIGHT JOIN
SELECT 
    c.full_name as customer,
    p.product_name as product,
    s.total_amount
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
LEFT JOIN products p ON s.product_id = p.product_id
UNION
SELECT 
    c.full_name as customer,
    p.product_name as product,
    s.total_amount
FROM sales s
RIGHT JOIN customers c ON s.customer_id = c.customer_id
RIGHT JOIN products p ON s.product_id = p.product_id;


-- 5. SELF JOIN
-- Customers in the same region
SELECT 
    c1.full_name as Customer_A, 
    c2.full_name as Customer_B, 
    c1.region
FROM customers c1
JOIN customers c2 ON c1.region = c2.region AND c1.customer_id < c2.customer_id
ORDER BY c1.region;
