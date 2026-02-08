Project Title
Sales Performance & Customer Segmentation Analysis for a Retail Company
Step 1: 
1. Business Context
A mid-sized retail company operating in multiple regions sells electronics and accessories through physical stores.
The Sales & Marketing department wants better insight into sales performance and customer behavior to improve revenue and customer retention.

2. Data Challenge
The company collects transaction data, but it is spread across multiple tables (customers, products, sales).
Management struggles to identify top-performing products, inactive customers, and sales trends over time needed for informed decisions.

3. Expected Outcome
Provide analytical insights that help management:
Identify high-performing and low-performing products
Understand customer purchasing patterns
Track sales growth and trends over time
Segment customers for targeted marketing campaigns

Step 2: Success Criteria
Identify top 5 products per region using RANK()
Calculate running monthly sales totals using SUM() OVER()
Analyze month-over-month sales growth using LAG()
Segment customers into quartiles based on total spending using NTILE(4)
Compute a 3-month moving average of sales using AVG() OVER()

Step 3: Database Schema
Database : `retail_analytics`
Table 1: customers
customer_id (PK)
full_name
region
registration_date
Table 2: products
product_id (PK)
product_name
category
price
Table 3: sales
sale_id (PK)
customer_id (FK → customers)
product_id (FK → products)
sale_date
quantity
total_amount
//ER Diagram

Step 4: JOINs to Demonstrate
INNER JOIN
→ Sales with valid customers and products
LEFT JOIN
→ Customers who never made a purchase
RIGHT JOIN / FULL JOIN
→ Products with no sales
FULL OUTER JOIN
→ Compare customers and products including unmatched records
SELF JOIN
→ Compare customers within the same region

Step 5: Window Functions
Ranking → Top customers / products (ROW_NUMBER, RANK)
Aggregate Windows → Running totals, trends (SUM, AVG)
Navigation → Growth analysis (LAG, LEAD)
Distribution → Customer segmentation (NTILE, CUME_DIST)

Step 6: Git hub Done

Step 7: Results Analysis Angles
Descriptive: Salary and performance distribution
Diagnostic: Reasons for pay disparities or performance gaps
Prescriptive: HR actions (bonuses, training, restructuring)
