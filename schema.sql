-- Database Schema for Sales Performance & Customer Segmentation Analysis (MySQL)

-- Create the database
CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

-- Drop tables if they exist
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
SET FOREIGN_KEY_CHECKS = 1;

-- Create customers table
CREATE TABLE customers (
    customer_id       INT AUTO_INCREMENT PRIMARY KEY,
    full_name         VARCHAR(100) NOT NULL,
    region            VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL
);

-- Create products table
CREATE TABLE products (
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(50) NOT NULL,
    price        DECIMAL(10, 2) NOT NULL
);

-- Create sales table
CREATE TABLE sales (
    sale_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    product_id   INT NOT NULL,
    sale_date    DATE NOT NULL,
    quantity     INT NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL,
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create indexes for performance optimization
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_customer ON sales(customer_id);
CREATE INDEX idx_sales_product ON sales(product_id);
CREATE INDEX idx_customers_region ON customers(region);
