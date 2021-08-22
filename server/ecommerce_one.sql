-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2021 at 04:27 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_one`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_authentication`
--

CREATE TABLE `admin_authentication` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `conpassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_authentication`
--

INSERT INTO `admin_authentication` (`id`, `email`, `username`, `conpassword`) VALUES
(12, 'rajonhossaindhaka@gmail.com', 'rajon', '$2b$10$Mv1SzBFUfBft3IO3RJns9ex.y2Fx4mkOljN.pf9Uf08YAX38uN7aS'),
(13, 'rajonhossaindhaka@gmail.com', 'rajonhossain', '$2b$10$fs4vPhZPpjxIekBa1RPzh.AervdoQG5/eQivdrJuqaSTZcmmB7b1S');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `product_items` varchar(255) NOT NULL,
  `qty` varchar(55) NOT NULL,
  `price` varchar(55) NOT NULL,
  `title` varchar(255) NOT NULL,
  `productCode` varchar(55) NOT NULL,
  `totalQty` varchar(55) NOT NULL,
  `totalCost` varchar(55) NOT NULL,
  `user` varchar(55) NOT NULL,
  `createdAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(155) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `slug`, `create_at`) VALUES
(31, 'Cycle', '', '2021-08-22 10:38:04'),
(32, 'Laptop', '', '2021-08-22 10:38:09'),
(34, 'Home', '', '2021-08-22 10:38:44'),
(35, 'Electronic', '', '2021-08-22 10:39:21'),
(36, 'Desktop Computer', '', '2021-08-22 11:02:33'),
(37, 'Mobile', '', '2021-08-22 12:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `client_user`
--

CREATE TABLE `client_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `productCode` varchar(55) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(50) NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `manufacturer` varchar(155) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `productCode`, `title`, `imagePath`, `description`, `price`, `product_category`, `manufacturer`, `available`, `createdAt`) VALUES
(26, '1457164HD', 'Samsung J7 Phone', 'http://192.168.0.102:3001/products/1629628880390.jpg', 'Samsung J7 Phone', '32000', 'Mobile', 'Samsung J7 Phone', 0, '2021-08-22 10:41:20'),
(27, 'EHD478H54d', 'Samsung D7 Phone', 'http://192.168.0.102:3001/products/1629628955608.jpg', 'Samsung D7 Phone', '45000', 'Mobile', 'Samsung D7 Phone', 0, '2021-08-22 10:42:35'),
(28, '478H54d497', 'Samsung Z7 Phone', 'http://192.168.0.102:3001/products/1629629096648.jpg', 'Samsung Z7 Phone', '22000', 'Mobile', 'Samsung Z7 Phone', 0, '2021-08-22 10:44:56'),
(29, '478H54dZ', 'Samsung E7 Phone', 'http://192.168.0.102:3001/products/1629629157598.jpg', 'Samsung E7 Phone', '16000', 'Mobile', 'Samsung E7 Phone', 0, '2021-08-22 10:45:57'),
(30, '478H54dX', 'Samsung A7 Phone', 'http://192.168.0.102:3001/products/1629629206223.jpg', 'Samsung A7 Phone', '19000', 'Mobile', 'Samsung A7 Phone', 0, '2021-08-22 10:46:46'),
(31, 'Cycle2464J', 'Cycle A50', 'http://192.168.0.102:3001/products/1629629284717.jpg', 'Cycle A50', '9000', 'Cycle', 'Cycle A50', 0, '2021-08-22 10:48:04'),
(32, 'Cycle2464Z', 'Cycle A40', 'http://192.168.0.102:3001/products/1629629353850.jpg', 'Cycle A40', '11000', 'Cycle', 'Cycle A40', 0, '2021-08-22 10:49:13'),
(33, 'Cycle_47A40', 'Cycle B30', 'http://192.168.0.102:3001/products/1629629407582.jpg', 'Cycle A40', '13500', 'Cycle', 'Cycle A40', 0, '2021-08-22 10:50:07'),
(34, 'CycEHD478H54d', 'Cycle J11', 'http://192.168.0.102:3001/products/1629629496942.jpg', 'Cycle J11', '8400', 'Cycle', 'Cycle J11', 0, '2021-08-22 10:51:36'),
(35, 'CYEEHD478H54d', 'Cycle 12AB', 'http://192.168.0.102:3001/products/1629629576532.jpg', 'Cycle 12AB', '8760', 'Cycle', 'Cycle 12AB', 0, '2021-08-22 10:52:56'),
(36, 'HP145', 'HP Laptop', 'http://192.168.0.102:3001/products/1629629635153.jpg', 'HP Laptop', '45700', 'Laptop', 'HP Laptop', 0, '2021-08-22 10:53:55'),
(37, 'lanovo4767C', 'Lanovo Laptop_11', 'http://192.168.0.102:3001/products/1629629792958.jpg', 'lanovo', '31455', 'Laptop', 'lanovo', 0, '2021-08-22 10:56:32'),
(38, 'lanovo4767DDY', 'Lanovo_4767DDY', 'http://192.168.0.102:3001/products/1629629963676.jpg', 'Lanovo_4767DDY', '75488', 'Laptop', 'Lanovo_4767DDY', 0, '2021-08-22 10:59:23'),
(39, 'Lanovo_5787ZDY', 'Lanovo_57', 'http://192.168.0.102:3001/products/1629630027220.jpg', 'Lanovo_5787ZDY', '87555', 'Laptop', 'Lanovo_5787ZDY', 0, '2021-08-22 11:00:27'),
(40, 'Lanovo_ZZP8TZDZ', 'Lanovo_5P8TZDZ', 'http://192.168.0.102:3001/products/1629630088341.jpg', 'Lanovo_5P8TZDZ', '85466', 'Laptop', 'Lanovo_5P8TZDZ', 0, '2021-08-22 11:01:28'),
(41, 'Apple_45789JJ', 'Apple_45789JJ', 'http://192.168.0.102:3001/products/1629630237310.jpg', 'Apple_45789JJ', '145000', 'Desktop Computer', 'Apple_45789JJ', 0, '2021-08-22 11:03:57'),
(42, 'HP_des_45789JJ', 'HP_Desk_45789JJ', 'http://192.168.0.102:3001/products/1629630297478.jpg', 'HP_des_45789JJ', '80400', 'Desktop Computer', 'HP_des_45789JJ', 0, '2021-08-22 11:04:57'),
(43, 'Samung_des_45789JJ', 'Samung_des_45789JJ', 'http://192.168.0.102:3001/products/1629630355977.jpg', 'Samung_des_45789JJ', '45000', 'Desktop Computer', 'Samung_des_45789JJ', 0, '2021-08-22 11:05:55'),
(44, 'w3Sw4xyieWmd5XBBbhUHED', 'Celeraon Computer ', 'http://192.168.0.102:3001/products/1629630428740.jpg', 'w3Sw4xyieWmd5XBBbhUHED', '879000', 'Desktop Computer', 'w3Sw4xyieWmd5XBBbhUHED', 0, '2021-08-22 11:07:08'),
(45, 'giant_133900.jpg', 'HP giant_133900.jpg', 'http://192.168.0.102:3001/products/1629630474611.jpg', 'giant_133900.jpg', '96400', 'Desktop Computer', 'giant_133900.jpg', 0, '2021-08-22 11:07:54'),
(46, 'headphone14578', 'Headphone14578', 'http://192.168.0.102:3001/products/1629630559028.jpg', 'headphone14578', '1500', 'Electronic', 'headphone14578', 0, '2021-08-22 11:09:19'),
(47, 'PowerBank78495', 'PowerBank78495', 'http://192.168.0.102:3001/products/1629630616916.jpg', 'PowerBank78495', '845', 'Electronic', 'PowerBank78495', 0, '2021-08-22 11:10:16'),
(48, 'HP Remote46765', 'HP Remote', 'http://192.168.0.102:3001/products/1629630672612.jpg', 'HP Remote', '844', 'Electronic', 'HP Remote', 0, '2021-08-22 11:11:12'),
(49, 'Memoricard', 'Memori Card_8GB', 'http://192.168.0.102:3001/products/1629630737213.jpg', 'Memori Card_8GB', '3540', 'Electronic', 'Memori Card_8GB', 0, '2021-08-22 11:12:17'),
(50, 'Caltulator4579', 'Electric Calculator', 'http://192.168.0.102:3001/products/1629630812951.jpg', 'caltulator', '1400', 'Electronic', 'caltulator', 0, '2021-08-22 11:13:32'),
(51, 'table4567', 'Table Karpt', 'http://192.168.0.102:3001/products/1629630931038.jpg', 'Table Karpt', '1500', 'Home', 'Table Karpt', 0, '2021-08-22 11:15:31'),
(52, 'Table Karpt4879', 'Table Karpt4879', 'http://192.168.0.102:3001/products/1629630964900.jpg', 'Table Karpt4879', '4500', 'Home', 'Table Karpt4879', 0, '2021-08-22 11:16:04'),
(53, 'Table Karpt488799', 'Table_pt488799', 'http://192.168.0.102:3001/products/1629631012917.jpg', 'Table Karpt488799', '7000', 'Home', 'Table Karpt488799', 0, '2021-08-22 11:16:52'),
(54, 'BRB45789', 'BRB Table', 'http://192.168.0.102:3001/products/1629631061348.jpg', 'BRB Table', '32000', 'Home', 'BRB Table', 0, '2021-08-22 11:17:41'),
(55, 'Table45879', 'Home Table45879', 'http://192.168.0.102:3001/products/1629631109372.jpg', 'Home Table45879', '14000', 'Home', 'Home Table45879', 0, '2021-08-22 11:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `user` varchar(55) NOT NULL,
  `cart` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `paymentId` varchar(55) NOT NULL,
  `createdAt` date NOT NULL,
  `Delivered` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_authentication`
--
ALTER TABLE `admin_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_user`
--
ALTER TABLE `client_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_authentication`
--
ALTER TABLE `admin_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `client_user`
--
ALTER TABLE `client_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
