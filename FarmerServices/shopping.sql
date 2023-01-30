-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 07:11 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Vegetable', 'Vegetables', '2021-05-29 19:57:34', NULL),
(8, 'Fruits', 'fruits', '2021-05-29 19:57:45', NULL),
(9, 'Eggs and Meat', 'Eggs and meats', '2021-05-29 19:58:09', NULL),
(10, 'Grocery Items', 'grocery', '2021-05-29 19:58:28', NULL),
(12, 'Oil Crop', 'Oil Crops', '2021-06-03 20:57:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `farmercategory`
--

CREATE TABLE `farmercategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farmercategory`
--

INSERT INTO `farmercategory` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(2, 'Grains', 'Grains', '2021-07-03 12:00:19', ''),
(3, 'Vegetables', 'Vegetables', '2021-07-03 12:00:57', ''),
(4, 'Oil Crop', 'Oil Crop', '2021-07-03 12:01:18', ''),
(5, 'Fruits', 'Fruits', '2021-07-07 14:56:25', '');

-- --------------------------------------------------------

--
-- Table structure for table `farmerorders`
--

CREATE TABLE `farmerorders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `paymentMethod` varchar(50) NOT NULL,
  `orderStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farmerorders`
--

INSERT INTO `farmerorders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 7, '1', 1, '2021-07-01 11:30:53', '', 'Delivered'),
(2, 5, '2', 1, '2021-07-01 12:34:20', '', ''),
(3, 7, '3', 2, '2021-07-06 07:32:47', '', 'in Process');

-- --------------------------------------------------------

--
-- Table structure for table `farmerordertrack`
--

CREATE TABLE `farmerordertrack` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `farmerordertrackhistory`
--

CREATE TABLE `farmerordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmerordertrackhistory`
--

INSERT INTO `farmerordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'in Process', 'ODiue', '2021-07-01 11:05:14'),
(2, 1, 'Delivered', 'Dell', '2021-07-01 11:30:53'),
(3, 3, 'in Process', 'pr', '2021-07-06 07:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `farmerproducts`
--

CREATE TABLE `farmerproducts` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCompany` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productPriceBeforeDiscount` int(11) NOT NULL,
  `productDescription` longtext NOT NULL,
  `productImage1` varchar(255) NOT NULL,
  `productImage2` varchar(255) NOT NULL,
  `productImage3` varchar(255) NOT NULL,
  `shippingCharge` int(11) NOT NULL,
  `productAvailability` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farmerproducts`
--

INSERT INTO `farmerproducts` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(2, 2, 2, 'Arhar Daal', 'GrocerGo', 5000, 5000, '1 Quintal', 'arhar.jpg', 'arhar.jpg', 'arhar.jpg', 0, 'Out of Stock', '2021-07-06 07:57:45', ''),
(3, 2, 2, 'Urad Daal', 'GrocerGo', 4000, 4000, '1 Quintal', 'images.jpg', 'images.jpg', 'images.jpg', 0, 'In Stock', '2021-07-03 12:07:02', ''),
(4, 2, 2, 'Moong Daal', 'GrocerGo', 3500, 3500, '1 Quintal', 'indian-cashew-500x500.jpg', 'indian-cashew-500x500.jpg', 'indian-cashew-500x500.jpg', 0, 'In Stock', '2021-07-03 12:07:51', ''),
(5, 2, 3, 'Paddy Rice', 'Paddy', 2000, 2200, '1 Quintal', 'padddy.jpeg', 'padddy.jpeg', 'padddy.jpeg', 0, 'In Stock', '2021-07-03 12:10:38', ''),
(6, 2, 3, 'Basmati Rice', 'GrocerGo', 2300, 2300, '1 Quintal', 'product-250x250.jpeg', 'product-250x250.jpeg', 'product-250x250.jpeg', 0, 'In Stock', '2021-07-03 12:13:41', ''),
(7, 2, 4, 'Red Winter', 'GrocerGo', 2200, 2200, '1 Quintal', 'redinter.jpg', 'redinter.jpg', 'redinter.jpg', 0, 'In Stock', '2021-07-03 12:16:43', ''),
(8, 2, 4, 'Durum Wheat', 'GrocerGo', 2200, 2200, '1 Quintal', 'durum.jpg', 'durum.jpg', 'durum.jpg', 0, 'In Stock', '2021-07-03 12:17:22', ''),
(9, 3, 5, 'Torai', 'GrocerGo', 400, 400, '20 Kg', 'torai.jpg', 'torai.jpg', 'torai.jpg', 0, 'In Stock', '2021-07-03 12:24:36', ''),
(10, 3, 5, 'Lauki', 'GrocerGo', 450, 450, '20 Kg', 'lauki.jpg', 'lauki.jpg', 'lauki.jpg', 0, 'In Stock', '2021-07-03 12:25:08', ''),
(11, 3, 5, 'Karela', 'GrocerGo', 500, 500, '20 Kg', 'karela.jpg', 'karela.jpg', 'karela.jpg', 0, 'In Stock', '2021-07-03 12:25:40', ''),
(12, 3, 6, 'Garlic', 'GrocerGo', 1200, 1200, '20 Kg', 'alhsun.png', 'alhsun.png', 'alhsun.png', 0, 'In Stock', '2021-07-03 12:26:35', ''),
(13, 3, 6, 'Arbi', 'GrocerGo', 1400, 1400, '20 Kg', 'arbi.jpg', 'arbi.jpg', 'arbi.jpg', 0, 'In Stock', '2021-07-03 12:27:29', ''),
(14, 4, 7, 'Yellow Mustard', 'GrocerGo', 1200, 1200, '10 Kg', 'yellow.jpeg', 'yellow.jpeg', 'yellow.jpeg', 0, 'In Stock', '2021-07-03 12:29:23', ''),
(15, 4, 7, 'Black Mustard', 'GrocerGo', 1400, 1400, '20 Kg', 'black-mustard-seeds-500x500.jpg', 'black-mustard-seeds-500x500.jpg', 'black-mustard-seeds-500x500.jpg', 0, 'In Stock', '2021-07-03 12:31:33', ''),
(16, 5, 8, 'Alfanso Mango', 'Dasheri', 1250, 1500, '100 Kg', 'dashehri-mangoes-500x500.png', 'dashehri-mangoes-500x500.png', 'dashehri-mangoes-500x500.png', 0, 'In Stock', '2021-07-07 14:59:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `farmersucategory`
--

CREATE TABLE `farmersucategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `farmersucategory`
--

INSERT INTO `farmersucategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 2, 'Pulses', '2021-07-03 12:01:31', ''),
(3, 2, 'Rice Crop', '2021-07-03 12:01:52', ''),
(4, 2, 'Wheat Crop', '2021-07-03 12:02:02', ''),
(5, 3, 'Green Vegetables', '2021-07-03 12:02:11', ''),
(6, 3, 'Root Vegetables', '2021-07-03 12:02:19', ''),
(7, 4, 'Mustard', '2021-07-03 12:02:38', ''),
(8, 5, 'Mangoes', '2021-07-07 14:57:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `farmerwishlist`
--

CREATE TABLE `farmerwishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicinecategory`
--

CREATE TABLE `medicinecategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicinecategory`
--

INSERT INTO `medicinecategory` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Organic Pesticides', 'Organic Pesticides', '2021-07-09 07:30:09', '09-07-2021 01:00:09 PM'),
(4, 'Garden Pesticides', 'Garden Pesticides', '2021-07-02 11:22:49', ''),
(5, 'Homemade Pesticides', 'Homemade Pesticides', '2021-07-02 11:23:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicineorders`
--

CREATE TABLE `medicineorders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicineorders`
--

INSERT INTO `medicineorders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(14, 5, '4', 1, '2021-07-01 05:54:26', 'Debit / Credit card', 'Delivered'),
(15, 5, '21', 2, '2021-07-03 05:54:26', 'Debit / Credit card', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicineordertrackhistory`
--

CREATE TABLE `medicineordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicineordertrackhistory`
--

INSERT INTO `medicineordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(8, 14, 'Delivered', 'Deliiii', '2021-07-03 06:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `medicineproductreviews`
--

CREATE TABLE `medicineproductreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicineproducts`
--

CREATE TABLE `medicineproducts` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCompany` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productPriceBeforeDiscount` int(11) NOT NULL,
  `productDescription` longtext NOT NULL,
  `productImage1` varchar(255) NOT NULL,
  `productImage2` varchar(255) NOT NULL,
  `productImage3` varchar(255) NOT NULL,
  `shippingCharge` int(11) NOT NULL,
  `productAvailability` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicineproducts`
--

INSERT INTO `medicineproducts` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(3, 3, 4, 'Safer Spray', 'Safer', 1875, 2000, 'Safer Spray 5 Ltr', 'safer.jpg', 'safer.jpg', 'safer.jpg', 20, 'In Stock', '2021-07-02 11:29:34', ''),
(4, 3, 4, 'SafeGuard', 'SafeGuard', 700, 700, '100 Gram', 'safeguard.png', 'safeguard.png', 'safeguard.png', 10, 'In Stock', '2021-07-02 11:30:17', ''),
(5, 3, 4, 'Zaena', 'Zaena Spray', 190, 200, '200 Gram', 'aena.jpg', 'aena.jpg', 'aena.jpg', 0, 'In Stock', '2021-07-02 11:32:49', ''),
(6, 3, 4, 'Green Nemafare', 'Nemafare', 560, 570, 'Green Nemafare Spray 600 Gram', 'green_nemafare.jpg', 'green_nemafare.jpg', 'green_nemafare.jpg', 0, 'In Stock', '2021-07-02 11:33:45', ''),
(7, 3, 5, 'Worm Fight', 'WormFight', 535, 540, '200 Gram', 'Woemfight.jpg', 'Woemfight.jpg', 'Woemfight.jpg', 0, 'In Stock', '2021-07-02 11:36:24', ''),
(8, 3, 5, 'White Killed', 'KilledMox', 299, 299, '300 Gram', 'whitekilled.jpg', 'whitekilled.jpg', 'whitekilled.jpg', 0, 'In Stock', '2021-07-02 11:37:42', ''),
(9, 3, 5, 'Mox Spray', 'Mox', 399, 399, '150 Gram', 'mox.jpg', 'mox.jpg', 'mox.jpg', 24, 'In Stock', '2021-07-02 11:38:22', ''),
(10, 3, 5, 'Hariyali', 'Hariyali Smraddha Kishan', 599, 599, '400 Gram', 'hariyali-500x500.jpg', 'hariyali-500x500.jpg', 'hariyali-500x500.jpg', 0, 'In Stock', '2021-07-02 11:39:05', ''),
(11, 3, 6, 'Naturo Clean', 'Naturo', 310, 315, '100 Ml', 'naturocleaner.jpg', 'naturocleaner.jpg', 'naturocleaner.jpg', 12, 'In Stock', '2021-07-02 11:43:34', ''),
(12, 3, 6, 'WIZ Cleaner', 'WIZ', 189, 189, '100 Ml', 'wiz.jpg', 'wiz.jpg', 'wiz.jpg', 0, 'In Stock', '2021-07-02 11:44:25', ''),
(13, 3, 6, 'Green Wash', 'Greenwash', 179, 179, '100 Ml', 'greenwash.png', 'greenwash.png', 'greenwash.png', 0, 'In Stock', '2021-07-02 11:44:57', ''),
(14, 3, 6, 'Veggie Assure', 'Veggie', 219, 219, '200 Ml', 'veggie assure.jpg', 'veggie assure.jpg', 'veggie assure.jpg', 0, 'In Stock', '2021-07-02 11:45:39', ''),
(15, 4, 7, 'Cyperfil', 'Cypermethrine', 239, 289, '200 Ml', 'cypermethrin-insecticides-500x500.jpg', 'cypermethrin-insecticides-500x500.jpg', 'cypermethrin-insecticides-500x500.jpg', 0, 'In Stock', '2021-07-02 11:49:24', ''),
(16, 4, 7, 'Aalfu', 'Aalfu', 209, 219, '100 Ml', 'aalfu-synthetic-pyrethroid-500x500.png', 'aalfu-synthetic-pyrethroid-500x500.png', 'aalfu-synthetic-pyrethroid-500x500.png', 0, 'In Stock', '2021-07-02 11:50:23', ''),
(17, 4, 7, 'Aalthrine', 'Aalthrine', 219, 219, '200 ml', 'aalthrin-synthetic-pyrethroid-500x500.png', 'aalthrin-synthetic-pyrethroid-500x500.png', 'aalthrin-synthetic-pyrethroid-500x500.png', 0, 'In Stock', '2021-07-02 11:51:09', ''),
(18, 4, 8, 'Isabion', 'Isabion', 229, 239, '200 Ml', 'isabion-agriculture-pesticides-500x500.jpg', 'isabion-agriculture-pesticides-500x500.jpg', 'isabion-agriculture-pesticides-500x500.jpg', 0, 'In Stock', '2021-07-02 11:53:06', ''),
(19, 4, 8, 'Amistar', 'Amistar', 316, 329, '100 ml', 'syngenta-amistar-top-fungicides-500x500.jpg', 'syngenta-amistar-top-fungicides-500x500.jpg', 'syngenta-amistar-top-fungicides-500x500.jpg', 0, 'In Stock', '2021-07-02 11:53:47', ''),
(20, 5, 9, 'Organeem', 'Annadata', 217, 217, '100 ml', 'annadata.jpg', 'annadata.jpg', 'annadata.jpg', 0, 'In Stock', '2021-07-02 11:56:16', ''),
(21, 5, 9, 'Creative Farmer', 'Farmers', 190, 219, '100 Ml', 'creativefarmer.jpg', 'creativefarmer.jpg', 'creativefarmer.jpg', 0, 'In Stock', '2021-07-02 11:56:51', ''),
(22, 5, 9, 'Xtreme', 'Xtreme', 180, 200, '100 Ml', 'xtreme.jpg', 'xtreme.jpg', 'xtreme.jpg', 0, 'In Stock', '2021-07-02 11:57:31', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicinesubcategory`
--

CREATE TABLE `medicinesubcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicinesubcategory`
--

INSERT INTO `medicinesubcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(4, 3, 'Spray Pesticides', '2021-07-02 11:23:37', ''),
(5, 3, 'Insects Pesticides', '2021-07-02 11:23:48', ''),
(6, 3, 'Vegetable Pesticides', '2021-07-02 11:24:03', ''),
(7, 4, 'Synthetic Pesticides', '2021-07-02 11:25:56', ''),
(8, 4, 'Syngenta Pesticides', '2021-07-02 11:26:12', ''),
(9, 5, 'Neem Oil Pesticides', '2021-07-02 11:26:34', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicinewishlist`
--

CREATE TABLE `medicinewishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicinewishlist`
--

INSERT INTO `medicinewishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(4, 7, 7, '2021-07-02 12:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(11, 6, '21', 1, '2021-07-03 08:51:22', 'upi', 'Delivered'),
(12, 6, '22', 1, '2021-07-03 08:51:22', 'upi', NULL),
(13, 6, '24', 1, '2021-07-03 08:51:22', 'upi', NULL),
(14, 0, '22', 2, '2021-07-07 14:45:28', NULL, NULL),
(15, 0, '22', 2, '2021-07-07 15:04:46', NULL, NULL),
(16, 6, '23', 1, '2021-07-09 07:52:51', 'upi', NULL),
(17, 6, '23', 1, '2021-07-09 10:16:23', 'upi', NULL),
(18, 8, '22', 1, '2021-07-10 17:13:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(11, 11, 'in Process', 'tyuyu', '2021-07-03 08:53:28'),
(12, 11, 'Delivered', 'wdewq', '2021-07-03 09:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 3, 2, 4, 4, 'Animerjhdj', 'aiwurfiuew', 'asuyrf7w', '2021-07-07 14:50:48'),
(6, 3, 4, 3, 4, 'Akhil', 'ertewyrewuitiuoreiotgfm,', 'jwyerfiuew', '2021-07-07 14:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 7, 13, 'Carrot', 'Carrot', 60, 60, 'Carrot 1 Kg', 'download.jpg', 'download.jpg', 'download.jpg', 0, 'Out of Stock', '2021-05-29 20:10:04', NULL),
(22, 7, 13, 'Radish', 'Radish', 30, 30, 'Radish', '51VwLKoBM5L.jpg', '41mZXdBzeLL.jpg', 'images.jpg', 0, 'In Stock', '2021-05-29 20:12:29', NULL),
(23, 10, 21, 'Arhar daal', 'Arhar daal', 190, 150, 'Arhar daal<br>', 'arhar-dal-500x500.jpg', 'arhar-dal-500x500.jpg', 'arhar-dal-500x500.jpg', 0, 'In Stock', '2021-05-29 20:13:57', NULL),
(24, 7, 14, 'Potato', 'Potato', 30, 30, '1 Kg', 'potato.jpg', 'potato.jpg', 'potato.jpg', 0, 'In Stock', '2021-05-29 20:16:46', NULL),
(25, 7, 13, 'Turnip', 'Turnip', 56, 40, '1 Kg', 'turnip.jpg', 'turnip.jpg', 'turnip.jpg', 0, 'In Stock', '2021-05-29 20:17:29', NULL),
(26, 10, 21, 'Bajra', 'Bajra', 120, 120, '1 Kg', 'bajra-500x500.jpg', 'bajra-500x500.jpg', 'bajra-500x500.jpg', 0, 'In Stock', '2021-06-03 19:26:33', NULL),
(28, 12, 23, 'Yellow Mustard', 'Mustards', 200, 220, '2 Kg', 'login.jpg', 'Capture.PNG', 'camss.png', 0, 'In Stock', '2021-06-03 20:58:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'Seasoned Vegetable', '2021-05-29 19:59:32', NULL),
(14, 7, 'Normal Vegetable', '2021-05-29 19:59:43', NULL),
(15, 8, 'Seasoned Fruits', '2021-05-29 19:59:56', NULL),
(16, 8, 'All Time Fruits', '2021-05-29 20:00:07', NULL),
(17, 9, 'Egg', '2021-05-29 20:00:12', NULL),
(18, 9, 'Meat', '2021-05-29 20:00:18', NULL),
(19, 10, 'Pulse', '2021-05-29 20:00:25', NULL),
(20, 10, 'Atta', '2021-05-29 20:00:33', NULL),
(21, 10, 'Grains', '2021-05-29 20:00:41', NULL),
(23, 12, 'Mustard', '2021-06-03 20:57:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'annu@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 19:46:24', NULL, 1),
(25, 'annu@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:05:06', NULL, 1),
(26, 'annu@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:13:10', '04-06-2021 01:45:53 AM', 1),
(27, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:50:40', '04-06-2021 02:24:17 AM', 1),
(28, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:54:32', '04-06-2021 02:25:46 AM', 1),
(29, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:56:00', '04-06-2021 02:29:27 AM', 1),
(30, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:59:44', NULL, 1),
(31, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-06-03 20:59:44', NULL, 1),
(32, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-01 09:39:17', NULL, 0),
(33, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-01 09:40:21', NULL, 0),
(34, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-01 09:40:42', NULL, 1),
(35, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-01 10:51:25', NULL, 1),
(36, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-01 12:21:22', NULL, 1),
(37, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-01 12:22:35', NULL, 1),
(38, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-01 12:33:53', NULL, 1),
(39, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-01 12:51:37', NULL, 1),
(40, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-02 11:20:05', NULL, 1),
(41, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-02 13:09:58', '02-07-2021 06:47:15 PM', 1),
(42, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-02 13:17:29', NULL, 1),
(43, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 05:37:03', NULL, 1),
(44, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 05:38:36', '03-07-2021 11:14:29 AM', 1),
(45, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 05:44:45', '03-07-2021 11:15:35 AM', 1),
(46, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 05:45:55', '03-07-2021 12:36:48 PM', 1),
(47, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:07:05', NULL, 0),
(48, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:07:13', '03-07-2021 12:37:38 PM', 1),
(49, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:11:35', '03-07-2021 12:42:11 PM', 1),
(50, 'animesh@gm.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:12:21', '03-07-2021 01:05:36 PM', 1),
(51, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:43:41', NULL, 0),
(52, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:43:54', NULL, 0),
(53, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:44:21', NULL, 0),
(54, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 07:44:57', NULL, 1),
(55, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 09:02:24', NULL, 1),
(56, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-03 09:16:17', NULL, 1),
(57, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-06 06:38:38', NULL, 1),
(58, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-06 09:46:27', NULL, 1),
(59, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-07 14:45:01', NULL, 1),
(60, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-07 15:01:05', NULL, 1),
(61, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-09 07:49:40', NULL, 1),
(62, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-09 10:16:20', '09-07-2021 04:46:00 PM', 1),
(63, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-09 12:48:07', NULL, 1),
(64, 'ratansy0123@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-10 07:14:53', NULL, 1),
(65, 'vikas@gmail.com', 0x3a3a3100000000000000000000000000, '2021-07-10 17:09:46', '10-07-2021 10:46:49 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `usertype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`, `usertype`) VALUES
(5, 'Anuj@18', 'animesh@gm.com', 7985003121, '12345', 'Jankipuram', 'UP', 'Lucknow', 226024, 'Jankipuram', 'UP', 'Lucknows', 226024, '2021-06-03 20:45:21', '03-07-2021 12:42:07 PM', 'Farmer'),
(6, 'Ratan Yadav', 'ratansy0123@gmail.com', 8209239670, '123456', 'Jankipuram', 'UP', 'Lucknow', 226024, 'Jankipuram', 'UP', 'Lucknow', 226024, '2021-06-03 20:50:10', NULL, 'User'),
(7, 'Admin', 'admin@gmail.com', 9999999996, '123456', 'Lucknow, Bakshi Ka Talab', 'Uttar Pradest', 'Lucknow', 226201, 'Lucknow, Bakshi Ka Talab', 'Uttar Pradesh', 'Lucknow', 226201, '2021-07-01 06:27:01', NULL, 'Admin'),
(8, 'Vikas Kumar', 'vikas@gmail.com', 7878787878, '1234', 'Jankipuram', 'UP', 'Lakhimpur', 226024, 'Jankipuram', 'UP', 'Lalitpur', 226024, '2021-07-10 17:09:01', NULL, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(4, 1, 28, '2021-06-03 20:59:12'),
(7, 7, 2, '2021-07-06 06:39:39'),
(8, 7, 3, '2021-07-06 06:39:47'),
(9, 7, 3, '2021-07-06 06:40:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmercategory`
--
ALTER TABLE `farmercategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmerorders`
--
ALTER TABLE `farmerorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmerordertrackhistory`
--
ALTER TABLE `farmerordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmerproducts`
--
ALTER TABLE `farmerproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmersucategory`
--
ALTER TABLE `farmersucategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmerwishlist`
--
ALTER TABLE `farmerwishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicinecategory`
--
ALTER TABLE `medicinecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicineorders`
--
ALTER TABLE `medicineorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicineordertrackhistory`
--
ALTER TABLE `medicineordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicineproductreviews`
--
ALTER TABLE `medicineproductreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicineproducts`
--
ALTER TABLE `medicineproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicinesubcategory`
--
ALTER TABLE `medicinesubcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicinewishlist`
--
ALTER TABLE `medicinewishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `farmercategory`
--
ALTER TABLE `farmercategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `farmerorders`
--
ALTER TABLE `farmerorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmerordertrackhistory`
--
ALTER TABLE `farmerordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `farmerproducts`
--
ALTER TABLE `farmerproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `farmersucategory`
--
ALTER TABLE `farmersucategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `farmerwishlist`
--
ALTER TABLE `farmerwishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicinecategory`
--
ALTER TABLE `medicinecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicineorders`
--
ALTER TABLE `medicineorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medicineordertrackhistory`
--
ALTER TABLE `medicineordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medicineproductreviews`
--
ALTER TABLE `medicineproductreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicineproducts`
--
ALTER TABLE `medicineproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `medicinesubcategory`
--
ALTER TABLE `medicinesubcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `medicinewishlist`
--
ALTER TABLE `medicinewishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
