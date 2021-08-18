-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2021 at 12:36 PM
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
-- Database: `ponnodb`
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
(13, 'rajonhossaindhaka@gmail.com', 'rajon', '$2b$10$fs4vPhZPpjxIekBa1RPzh.AervdoQG5/eQivdrJuqaSTZcmmB7b1S'),
(14, 'rajonhossaindhaka@gmail.com', 'rajon', '$2b$10$4HP5.LAMmQnfUoK0CMgFuOsG8kmTtA8vMdNIfRXHoitgJQ089rKuC'),
(15, 'rajonhossaindhaka@gmail.com', 'rajon', '$2b$10$RDzCXozlVriCEURvhybm.uQKE1lvk8t5lnvWL4io9tXX3Bqwi0ysO'),
(16, 'rajonhossaindhaka@gmail.com', 'rajon', '$2b$10$TsWyo5ji.kfmy4pF.ixqC.ZYa.v1j6pOI11bS.vD2tb3QjsGx2MQO');

-- --------------------------------------------------------

--
-- Table structure for table `catagori`
--

CREATE TABLE `catagori` (
  `id` int(11) NOT NULL,
  `product_catagori` varchar(100) NOT NULL,
  `product_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catagori`
--

INSERT INTO `catagori` (`id`, `product_catagori`, `product_group`) VALUES
(1, 'baby', 'shart'),
(2, 'old', 'T-Shart'),
(3, 'sdfasdf', 'asdfasdfasdf'),
(4, 'shart', 'Baby'),
(5, 'Khabar', 'Oil');

-- --------------------------------------------------------

--
-- Table structure for table `product_add`
--

CREATE TABLE `product_add` (
  `id` int(11) NOT NULL,
  `catagori` varchar(40) NOT NULL,
  `productgroup` varchar(40) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_img` varchar(200) NOT NULL,
  `product_price` float NOT NULL,
  `product_qunt` float NOT NULL,
  `product_discount` varchar(10) NOT NULL,
  `product_discription` text NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_add`
--

INSERT INTO `product_add` (`id`, `catagori`, `productgroup`, `product_name`, `product_img`, `product_price`, `product_qunt`, `product_discount`, `product_discription`, `create_date`) VALUES
(23, 'Khabar', 'Oil', 'খাটি ঘি', 'http://192.168.0.102:3001/products/1629279964516.jpg', 200, 1, '0', 'খাটি ঘি পাচ্ছে খুব অল্প মুল্যে.', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_authentication`
--
ALTER TABLE `admin_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catagori`
--
ALTER TABLE `catagori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_add`
--
ALTER TABLE `product_add`
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
-- AUTO_INCREMENT for table `catagori`
--
ALTER TABLE `catagori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_add`
--
ALTER TABLE `product_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
