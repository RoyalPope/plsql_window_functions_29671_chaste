-- Populate Customers (MySQL)
INSERT INTO customers (full_name, region, registration_date) VALUES 
('Alice Johnson', 'North', '2023-01-15'),
('Bob Smith', 'North', '2023-02-20'),
('Charlie Davis', 'South', '2023-03-10'),
('Diana Prince', 'East', '2023-04-05'),
('Edward Norton', 'West', '2023-05-12'),
('Frank Miller', 'South', '2023-06-18'),
('Grace Hopper', 'West', '2023-07-22'),
('Hank Pym', 'North', '2023-08-30'),
('Ivy League', 'East', '2023-09-15');

-- Populate Products
INSERT INTO products (product_name, category, price) VALUES 
('iPhone 15', 'Electronics', 999.99),
('Samsung Galaxy S23', 'Electronics', 849.99),
('MacBook Air M2', 'Computers', 1199.99),
('AirPods Pro', 'Accessories', 249.99),
('Logitech Mouse', 'Accessories', 49.99),
('Dell XPS 13', 'Computers', 1299.99),
('Sony WH-1000XM5', 'Accessories', 399.99),
('VR Headset', 'Electronics', 499.99);

-- Populate Sales
INSERT INTO sales (customer_id, product_id, sale_date, quantity, total_amount) VALUES 
(1, 1, '2024-01-05', 1, 999.99),
(2, 4, '2024-01-12', 2, 499.98),
(3, 2, '2024-02-10', 1, 849.99),
(4, 3, '2024-02-15', 1, 1199.99),
(1, 5, '2024-03-05', 1, 49.99),
(5, 6, '2024-03-20', 1, 1299.99),
(6, 7, '2024-04-10', 2, 799.98),
(7, 1, '2024-04-22', 1, 999.99),
(8, 2, '2024-05-15', 1, 849.99),
(2, 3, '2024-05-25', 1, 1199.99),
(1, 4, '2024-06-05', 1, 249.99),
(3, 6, '2024-06-15', 1, 1299.99),
(4, 7, '2024-07-10', 1, 399.99),
(5, 1, '2024-07-20', 1, 999.99),
(6, 2, '2024-08-05', 1, 849.99),
(7, 3, '2024-08-25', 1, 1199.99);
