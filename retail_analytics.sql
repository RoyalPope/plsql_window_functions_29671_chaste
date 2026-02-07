-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2026 at 09:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retail_analytics`
--
-- Create the database
CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

-- Drop tables if they exist
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `region` varchar(50) NOT NULL,
  `registration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `region`, `registration_date`) VALUES
(1, 'Alice Johnson', 'North', '2023-01-15'),
(2, 'Bob Smith', 'North', '2023-02-20'),
(3, 'Charlie Davis', 'South', '2023-03-10'),
(4, 'Diana Prince', 'East', '2023-04-05'),
(5, 'Edward Norton', 'West', '2023-05-12'),
(6, 'Frank Miller', 'South', '2023-06-18'),
(7, 'Grace Hopper', 'West', '2023-07-22'),
(8, 'Hank Pym', 'North', '2023-08-30'),
(9, 'Ivy League', 'East', '2023-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `price`) VALUES
(1, 'iPhone 15', 'Electronics', '999.99'),
(2, 'Samsung Galaxy S23', 'Electronics', '849.99'),
(3, 'MacBook Air M2', 'Computers', '1199.99'),
(4, 'AirPods Pro', 'Accessories', '249.99'),
(5, 'Logitech Mouse', 'Accessories', '49.99'),
(6, 'Dell XPS 13', 'Computers', '1299.99'),
(7, 'Sony WH-1000XM5', 'Accessories', '399.99'),
(8, 'VR Headset', 'Electronics', '499.99');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `customer_id`, `product_id`, `sale_date`, `quantity`, `total_amount`) VALUES
(1, 1, 1, '2024-01-05', 1, '999.99'),
(2, 2, 4, '2024-01-12', 2, '499.98'),
(3, 3, 2, '2024-02-10', 1, '849.99'),
(4, 4, 3, '2024-02-15', 1, '1199.99'),
(5, 1, 5, '2024-03-05', 1, '49.99'),
(6, 5, 6, '2024-03-20', 1, '1299.99'),
(7, 6, 7, '2024-04-10', 2, '799.98'),
(8, 7, 1, '2024-04-22', 1, '999.99'),
(9, 8, 2, '2024-05-15', 1, '849.99'),
(10, 2, 3, '2024-05-25', 1, '1199.99'),
(11, 1, 4, '2024-06-05', 1, '249.99'),
(12, 3, 6, '2024-06-15', 1, '1299.99'),
(13, 4, 7, '2024-07-10', 1, '399.99'),
(14, 5, 1, '2024-07-20', 1, '999.99'),
(15, 6, 2, '2024-08-05', 1, '849.99'),
(16, 7, 3, '2024-08-25', 1, '1199.99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `idx_customers_region` (`region`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `idx_sales_date` (`sale_date`),
  ADD KEY `idx_sales_customer` (`customer_id`),
  ADD KEY `idx_sales_product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
