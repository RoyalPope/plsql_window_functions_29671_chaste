-- Database Schema for Sales Performance & Customer Segmentation Analysis (MySQL)

-- Create the database
CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

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
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

