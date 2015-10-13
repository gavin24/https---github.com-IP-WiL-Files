-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2015 at 07:12 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_Id` varchar(10) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Street` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Postal_Code` int(5) NOT NULL,
  `Age` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Id`, `FName`, `LName`, `Phone`, `Email`, `Street`, `City`, `Postal_Code`, `Age`) VALUES
('1', 'Gavin', 'Ackerman', '0216584856', 'sdfsdf@gmail.com', '14 peach ', 'cape town', 7780, 20),
('2', 'peter', 'johnson', '0127854621', 'ptj@gmail.com', '12 adams', 'joburg', 6654, 32);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `Order_Id` varchar(10) NOT NULL,
  `Cus_Id` varchar(10) NOT NULL,
  `Prod_Id` varchar(10) NOT NULL,
  `Price` float NOT NULL,
  `Date` date NOT NULL,
  `Quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`Order_Id`, `Cus_Id`, `Prod_Id`, `Price`, `Date`, `Quantity`) VALUES
('1', '1', '1', 620, '2015-10-21', 2),
('2', '2', '2', 578, '2015-10-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
  `Delivery_Id` varchar(10) NOT NULL,
  `Ord_Id` varchar(10) NOT NULL,
  `Cus_Id` varchar(10) NOT NULL,
  `Delivery_Date` date NOT NULL,
  `Delivery_Quantity` int(5) NOT NULL,
  `Price` float NOT NULL,
  `Cus_Street` varchar(30) NOT NULL,
  `Cus_City` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Delivery_Id`, `Ord_Id`, `Cus_Id`, `Delivery_Date`, `Delivery_Quantity`, `Price`, `Cus_Street`, `Cus_City`) VALUES
('1', '1', '1', '2015-10-31', 5, 520, '14 peach', 'cape town'),
('2', '2', '2', '2015-10-31', 1, 578, '13 adams', 'joburg');

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE IF NOT EXISTS `order_line` (
  `Order_Line_Id` varchar(10) NOT NULL,
  `Prod_id` varchar(10) NOT NULL,
  `Order_Id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`Order_Line_Id`, `Prod_id`, `Order_Id`) VALUES
('1', '1', '1'),
('2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `Product_Id` varchar(10) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Sup_Id` varchar(10) NOT NULL,
  `Product_Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_Id`, `Description`, `Product_Name`, `Sup_Id`, `Product_Price`) VALUES
('1', 'new black shoes', 'gucci heels', '24', 520),
('2', 'high top shoes', 'nike 64', '2', 840);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `Supplier_Id` varchar(10) NOT NULL,
  `Supplier_Name` varchar(20) NOT NULL,
  `Supplier_City` varchar(30) NOT NULL,
  `Supplier_Phone` varchar(10) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_Id`, `Supplier_Name`, `Supplier_City`, `Supplier_Phone`, `Supplier_Email`) VALUES
('2', 'nike', 'pretoria', '0125789855', 'nike54@gmail.com'),
('24', 'adidas', 'cape town', '0218754695', 'adi11@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `Cus_Id` (`Cus_Id`),
  ADD KEY `Prod_Id` (`Prod_Id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Delivery_Id`),
  ADD KEY `Ord_Id` (`Ord_Id`),
  ADD KEY `Cus_Id` (`Cus_Id`),
  ADD KEY `Cus_Street` (`Cus_Street`),
  ADD KEY `Cus_City` (`Cus_City`),
  ADD KEY `Price` (`Price`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`Order_Line_Id`),
  ADD KEY `Prod_id` (`Prod_id`),
  ADD KEY `Order_Id` (`Order_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_Id`),
  ADD UNIQUE KEY `Sup_Id` (`Sup_Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`Cus_Id`) REFERENCES `customer` (`Customer_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`Prod_Id`) REFERENCES `product` (`Product_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Ord_Id`) REFERENCES `customer_order` (`Order_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Cus_Id`) REFERENCES `customer` (`Customer_Id`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`Prod_id`) REFERENCES `product` (`Product_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `customer_order` (`Order_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
