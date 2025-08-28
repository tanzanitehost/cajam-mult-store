-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2025 at 11:48 AM
-- Server version: 10.11.14-MariaDB
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multstore_cajam`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Default Customer');

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_keys`
--

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_limits`
--

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_api_logs`
--

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(6) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_attachments`
--

CREATE TABLE `sma_attachments` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_attachments`
--

INSERT INTO `sma_attachments` (`id`, `subject_id`, `subject_type`, `file_name`, `orig_name`) VALUES
(1, 1, 'purchase', '35c42f4febee57a821ea5c6175acf311.pdf', 'ELIASI_ID.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `description`) VALUES
(1, 'FF', 'FarmFresh', 'farmfresh.png', 'farmfresh', 'FarmFresh poultry and egg products'),
(2, 'CK', 'CluckKing', 'cluckking.png', 'cluckking', 'CluckKing poultry and livestock products'),
(3, 'ON', 'OrganicNest', 'organicnest.png', 'organicnest', 'OrganicNest organic poultry and livestock'),
(4, 'SG', 'SunGold', 'sungold.png', 'sungold', 'SunGold oil products'),
(5, 'AP', 'AgroPure', 'agropure.png', 'agropure', 'AgroPure oil and related products'),
(6, 'OM', 'OilMasters', 'oilmasters.png', 'oilmasters', 'OilMasters oil and by-products'),
(7, 'HE', 'HomeEase', 'homeease.png', 'homeease', 'HomeEase domestic products'),
(8, 'DM', 'DailyMart', 'dailymart.png', 'dailymart', 'DailyMart household essentials'),
(9, 'KJ', 'KitchenJoy', 'kitchenjoy.png', 'kitchenjoy', 'KitchenJoy food and dairy products'),
(10, 'AH', 'AgroHarvest', 'agroharvest.png', 'agroharvest', 'AgroHarvest agricultural products'),
(11, 'GF', 'GreenField', 'greenfield.png', 'greenfield', 'GreenField crops and seeds'),
(12, 'CKG', 'CropKing', 'cropking.png', 'cropking', 'CropKing agricultural products');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(20) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_cart`
--

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(19, 'SP1_2', 'Layer Chicken', 'sp1_2.png', 14, 'layer-chicken', 'Layer chicken products from brands like FarmFresh'),
(17, 'A1', 'Farm Products', 'b257a3b641c0d2c0123d4ffdfde3cea9.jpg', 17, 'farm-products', 'Crops like cashew nuts, sunflower seeds, groundnuts, sesame'),
(16, 'D1', 'Domestic Products', 'd1.png', NULL, 'domestic-products', 'Food products and other home-use items'),
(15, 'I1', 'Industrial Processing Products', 'i1.png', NULL, 'industrial-processing-products', 'Sunflower cooking oil'),
(14, 'P1', 'Poultry Products', 'p1.png', NULL, 'poultry-products', 'Pig meat'),
(20, 'SP1_3', 'Organic Eggs', 'sp1_3.png', 14, 'organic-eggs', 'Organic eggs from brands like FarmFresh'),
(21, 'SI1_1', 'Sunflower Oil', 'si1_1.png', 15, 'sunflower-oil', 'Sunflower oil products from brands like SunGold'),
(22, 'SI1_2', 'Sunflower Cake', 'si1_2.png', 15, 'sunflower-cake', 'Sunflower cake products from brands like SunGold'),
(23, 'SI1_3', 'Soybean Oil', 'si1_3.png', 15, 'soybean-oil', 'Soybean oil products from brands like SunGold'),
(24, 'SD1_1', 'Rice', 'sd1_1.png', 16, 'rice', 'Rice products from brands like HomeEase'),
(25, 'SD1_2', 'Sugar', 'sd1_2.png', 16, 'sugar', 'Sugar products from brands like HomeEase'),
(27, 'SD1_4', 'Soap', 'sd1_4.png', 16, 'soap', 'Soap products from brands like HomeEase'),
(31, 'SA1_4', 'Wheat', 'sa1_4.png', 17, 'wheat', 'Wheat products from brands like AgroHarvest'),
(32, 'L1', 'Livestock Products', 'l1.png', NULL, 'livestock-products', 'Pig meat and piglets');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'kongwa', 'Dodoma', '46000', 'Tanzania', '0123456789', 'customer@store.cajam.co.tz', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, 500000.0000, NULL, NULL, ''),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', '', 'Dzm', 'dms', 'Ubungo', '46050', 'Tanzania', '0123456789', 'customer@store.cajam.co.tz', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, ''),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'customer@store.cajam.co.tz', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'header_logo.png', 0, NULL, NULL, NULL, ''),
(4, 4, 'supplier', NULL, NULL, 'AgroSupplier', 'AgroSupplier Ltd', '', 'AgroSupplier Address', 'DAR ES SALAAM', 'Ubungo', '46050', 'Tanzania', '0123456789', 'customer@store.cajam.co.tz', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(3, 'TZS', 'Tanzania Shilling', 2540.0000, 1, 'Tsh');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`, `discount`) VALUES
(1, 'General', 0, NULL),
(2, 'Reseller', -5, NULL),
(3, 'Distributor', -15, NULL),
(4, 'New Customer (+10)', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_deposits`
--

INSERT INTO `sma_deposits` (`id`, `date`, `company_id`, `amount`, `paid_by`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2025-08-19 02:55:00', 1, 500000.0000, 'JUMA', '<p>Thanks </p>', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Default Customer'),
(4, 'utawala', 'Utawala'),
(5, 'store', 'store');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(3, 0x34312e35392e3137382e3634, 'janebethuel@gmail.com', '0000-00-00 00:00:00'),
(4, 0x34312e35392e3137382e3634, 'janebethuel@gmail.com', '0000-00-00 00:00:00'),
(5, 0x34312e35392e3137382e3634, 'jane.bethuel@gmail.com', '0000-00-00 00:00:00'),
(6, 0x34312e35392e3137382e3634, 'jane.bethuel@gmail.com', '0000-00-00 00:00:00'),
(9, 0x34312e35392e3135392e313433, 'jane', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sma_logs`
--

CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL,
  `detail` varchar(190) NOT NULL,
  `model` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2025-08-01', 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pages`
--

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2025-08-18 17:24:00', NULL, NULL, 1, 'POP2025/08/0001', NULL, 'cash', '', '', '', '', '', 'Visa', 2160000.0000, NULL, 1, '0d995d9ee52efe3ead8317f0b4fb8d10.pdf', 'sent', '&lt;p&gt;paid&lt;&sol;p&gt;', 0.0000, 0.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0,
  `categories-index` tinyint(1) NOT NULL DEFAULT 0,
  `categories-add` tinyint(1) NOT NULL DEFAULT 0,
  `categories-edit` tinyint(1) NOT NULL DEFAULT 0,
  `categories-delete` tinyint(1) NOT NULL DEFAULT 0,
  `brands-index` tinyint(1) NOT NULL DEFAULT 0,
  `brands-add` tinyint(1) NOT NULL DEFAULT 0,
  `brands-edit` tinyint(1) NOT NULL DEFAULT 0,
  `brands-delete` tinyint(1) NOT NULL DEFAULT 0,
  `customer_groups-index` tinyint(1) NOT NULL DEFAULT 0,
  `customer_groups-add` tinyint(1) NOT NULL DEFAULT 0,
  `customer_groups-edit` tinyint(1) NOT NULL DEFAULT 0,
  `customer_groups-delete` tinyint(1) NOT NULL DEFAULT 0,
  `price_groups-index` tinyint(1) NOT NULL DEFAULT 0,
  `price_groups-add` tinyint(1) NOT NULL DEFAULT 0,
  `price_groups-edit` tinyint(1) NOT NULL DEFAULT 0,
  `price_groups-delete` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rates-index` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rates-add` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rates-edit` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rates-delete` tinyint(1) NOT NULL DEFAULT 0,
  `units-index` tinyint(1) NOT NULL DEFAULT 0,
  `units-add` tinyint(1) NOT NULL DEFAULT 0,
  `units-edit` tinyint(1) NOT NULL DEFAULT 0,
  `units-delete` tinyint(1) NOT NULL DEFAULT 0,
  `variants-index` tinyint(1) NOT NULL DEFAULT 0,
  `variants-add` tinyint(1) NOT NULL DEFAULT 0,
  `variants-edit` tinyint(1) NOT NULL DEFAULT 0,
  `variants-delete` tinyint(1) NOT NULL DEFAULT 0,
  `warehouses-index` tinyint(1) NOT NULL DEFAULT 0,
  `warehouses-add` tinyint(1) NOT NULL DEFAULT 0,
  `warehouses-edit` tinyint(1) NOT NULL DEFAULT 0,
  `warehouses-delete` tinyint(1) NOT NULL DEFAULT 0,
  `groups-index` tinyint(1) NOT NULL DEFAULT 0,
  `groups-add` tinyint(1) NOT NULL DEFAULT 0,
  `groups-edit` tinyint(1) NOT NULL DEFAULT 0,
  `groups-delete` tinyint(1) NOT NULL DEFAULT 0,
  `pages-index` tinyint(1) NOT NULL DEFAULT 0,
  `pages-add` tinyint(1) NOT NULL DEFAULT 0,
  `pages-edit` tinyint(1) NOT NULL DEFAULT 0,
  `pages-delete` tinyint(1) NOT NULL DEFAULT 0,
  `slider-index` tinyint(1) NOT NULL DEFAULT 0,
  `slider-edit` tinyint(1) NOT NULL DEFAULT 0,
  `banners-index` tinyint(1) NOT NULL DEFAULT 0,
  `banners-add` tinyint(1) NOT NULL DEFAULT 0,
  `banners-edit` tinyint(1) NOT NULL DEFAULT 0,
  `banners-delete` tinyint(1) NOT NULL DEFAULT 0,
  `menus-index` tinyint(1) NOT NULL DEFAULT 0,
  `menus-add` tinyint(1) NOT NULL DEFAULT 0,
  `menus-edit` tinyint(1) NOT NULL DEFAULT 0,
  `menus-delete` tinyint(1) NOT NULL DEFAULT 0,
  `themes-index` tinyint(1) NOT NULL DEFAULT 0,
  `themes-edit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`, `categories-index`, `categories-add`, `categories-edit`, `categories-delete`, `brands-index`, `brands-add`, `brands-edit`, `brands-delete`, `customer_groups-index`, `customer_groups-add`, `customer_groups-edit`, `customer_groups-delete`, `price_groups-index`, `price_groups-add`, `price_groups-edit`, `price_groups-delete`, `tax_rates-index`, `tax_rates-add`, `tax_rates-edit`, `tax_rates-delete`, `units-index`, `units-add`, `units-edit`, `units-delete`, `variants-index`, `variants-add`, `variants-edit`, `variants-delete`, `warehouses-index`, `warehouses-add`, `warehouses-edit`, `warehouses-delete`, `groups-index`, `groups-add`, `groups-edit`, `groups-delete`, `pages-index`, `pages-add`, `pages-edit`, `pages-delete`, `slider-index`, `slider-edit`, `banners-index`, `banners-add`, `banners-edit`, `banners-delete`, `menus-index`, `menus-add`, `menus-edit`, `menus-delete`, `themes-index`, `themes-edit`) VALUES
(1, 5, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 5, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2025-08-13 18:24:43', 1, 4000.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(11) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.53',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.4.53', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(1, 'P001', 'FarmFresh Broiler Chicken 1Kg', 1, 12000.0000, 15000.0000, 50.0000, 'assets/uploads/farmfresh_broiler_chicken_1kg.png', 14, 18, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'High-quality broiler chicken from FarmFresh, perfect for grilling', 1, 'code128', NULL, NULL, 0, 'standard', 4, 12000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP001', NULL, NULL, NULL, NULL, 1, 1, 1, 'farmfresh-broiler-chicken-1kg', NULL, NULL, 0, 0, 0, 'Broiler 1Kg', 0),
(2, 'P002', 'CluckKing Layer Chicken 1.5Kg', 1, 14400.0000, 18000.0000, 50.0000, 'assets/uploads/cluckking_layer_chicken_1.5kg.png', 14, 19, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Fresh layer chicken from CluckKing, ideal for roasting', 1, 'code128', NULL, NULL, 0, 'standard', 4, 14400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP002', NULL, NULL, NULL, NULL, 1, 1, 2, 'cluckking-layer-chicken-1.5kg', NULL, NULL, 0, 0, 0, 'Layer 1.5Kg', 0),
(3, 'P003', 'OrganicNest Organic Eggs 12-Pack', 5, 8000.0000, 10000.0000, 50.0000, 'assets/uploads/organicnest_organic_eggs_12-pack.png', 14, 20, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Organic eggs from OrganicNest, free-range and nutrient-rich', 1, 'code128', NULL, NULL, 0, 'standard', 4, 8000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP003', NULL, NULL, NULL, NULL, 5, 5, 3, 'organicnest-organic-eggs-12-pack', NULL, NULL, 0, 0, 0, 'Eggs 12-Pack', 0),
(4, 'P004', 'FarmFresh Chicken Wings 500g', 1, 6400.0000, 8000.0000, 50.0000, 'assets/uploads/farmfresh_chicken_wings_500g.png', 14, 18, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Juicy chicken wings from FarmFresh, great for snacks', 1, 'code128', NULL, NULL, 0, 'standard', 4, 6400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP004', NULL, NULL, NULL, NULL, 1, 1, 1, 'farmfresh-chicken-wings-500g', NULL, NULL, 0, 0, 0, 'Wings 500g', 0),
(5, 'P005', 'CluckKing Chicken Thighs 1Kg', 1, 12800.0000, 16000.0000, 50.0000, 'assets/uploads/cluckking_chicken_thighs_1kg.png', 14, 18, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Tender chicken thighs from CluckKing for hearty meals', 1, 'code128', NULL, NULL, 0, 'standard', 4, 12800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP005', NULL, NULL, NULL, NULL, 1, 1, 2, 'cluckking-chicken-thighs-1kg', NULL, NULL, 0, 0, 0, 'Thighs 1Kg', 0),
(6, 'P006', 'OrganicNest Manure Pack 5Kg', 1, 4000.0000, 5000.0000, 50.0000, 'assets/uploads/organicnest_manure_pack_5kg.png', 14, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Organic manure from OrganicNest for farming', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP006', NULL, NULL, NULL, NULL, 1, 1, 3, 'organicnest-manure-pack-5kg', NULL, NULL, 0, 0, 0, 'Manure 5Kg', 0),
(7, 'P007', 'FarmFresh Pig Meat 2Kg', 1, 20000.0000, 25000.0000, 50.0000, 'assets/uploads/farmfresh_pig_meat_2kg.png', 32, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Premium pig meat from FarmFresh, perfect for stews', 1, 'code128', NULL, NULL, 0, 'standard', 4, 20000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP007', NULL, NULL, NULL, NULL, 1, 1, 1, 'farmfresh-pig-meat-2kg', NULL, NULL, 0, 0, 0, 'Pig Meat 2Kg', 0),
(8, 'P008', 'CluckKing Piglets Each', 3, 40000.0000, 50000.0000, 50.0000, 'assets/uploads/cluckking_piglets_each.png', 32, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Healthy piglets from CluckKing for breeding', 1, 'code128', NULL, NULL, 0, 'standard', 4, 40000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP008', NULL, NULL, NULL, NULL, 3, 3, 2, 'cluckking-piglets-each', NULL, NULL, 0, 0, 0, 'Piglet', 0),
(9, 'P009', 'OrganicNest Chicken Breast 1Kg', 1, 13600.0000, 17000.0000, 50.0000, 'assets/uploads/organicnest_chicken_breast_1kg.png', 14, 18, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Lean chicken breast from OrganicNest for healthy meals', 1, 'code128', NULL, NULL, 0, 'standard', 4, 13600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP009', NULL, NULL, NULL, NULL, 1, 1, 3, 'organicnest-chicken-breast-1kg', NULL, NULL, 0, 0, 0, 'Breast 1Kg', 0),
(10, 'P010', 'FarmFresh Egg Tray 30-Pack', 5, 16000.0000, 20000.0000, 50.0000, 'assets/uploads/farmfresh_egg_tray_30-pack.png', 14, 20, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Fresh eggs in a 30-pack tray from FarmFresh', 1, 'code128', NULL, NULL, 0, 'standard', 4, 16000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP010', NULL, NULL, NULL, NULL, 5, 5, 1, 'farmfresh-egg-tray-30-pack', NULL, NULL, 0, 0, 0, 'Eggs 30-Pack', 0),
(11, 'P011', 'CluckKing Chicken Drumsticks 1Kg', 1, 11200.0000, 14000.0000, 50.0000, 'assets/uploads/cluckking_chicken_drumsticks_1kg.png', 14, 18, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Flavorful drumsticks from CluckKing for barbecues', 1, 'code128', NULL, NULL, 0, 'standard', 4, 11200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP011', NULL, NULL, NULL, NULL, 1, 1, 2, 'cluckking-chicken-drumsticks-1kg', NULL, NULL, 0, 0, 0, 'Drumsticks 1Kg', 0),
(12, 'P012', 'OrganicNest Pig Meat 1Kg', 1, 17600.0000, 22000.0000, 50.0000, 'assets/uploads/organicnest_pig_meat_1kg.png', 32, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Organic pig meat from OrganicNest, ethically sourced', 1, 'code128', NULL, NULL, 0, 'standard', 4, 17600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP012', NULL, NULL, NULL, NULL, 1, 1, 3, 'organicnest-pig-meat-1kg', NULL, NULL, 0, 0, 0, 'Pig Meat 1Kg', 0),
(13, 'I001', 'SunGold Sunflower Oil 20L', 2, 72000.0000, 90000.0000, 50.0000, 'assets/uploads/sungold_sunflower_oil_20l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Pure sunflower oil from SunGold, ideal for bulk cooking', 1, 'code128', NULL, NULL, 0, 'standard', 4, 72000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP013', NULL, NULL, NULL, NULL, 2, 2, 4, 'sungold-sunflower-oil-20l', NULL, NULL, 0, 0, 0, 'Sunflower Oil 20L', 0),
(14, 'I002', 'AgroPure Sunflower Oil 5L', 2, 20000.0000, 25000.0000, 50.0000, 'assets/uploads/agropure_sunflower_oil_5l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'High-quality sunflower oil from AgroPure for daily use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 20000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP014', NULL, NULL, NULL, NULL, 2, 2, 5, 'agropure-sunflower-oil-5l', NULL, NULL, 0, 0, 0, 'Sunflower Oil 5L', 0),
(15, 'I003', 'OilMasters Sunflower Cake 10Kg', 1, 24000.0000, 30000.0000, 50.0000, 'assets/uploads/oilmasters_sunflower_cake_10kg.png', 15, 22, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Nutritious sunflower cake from OilMasters for animal feed', 1, 'code128', NULL, NULL, 0, 'standard', 4, 24000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP015', NULL, NULL, NULL, NULL, 1, 1, 6, 'oilmasters-sunflower-cake-10kg', NULL, NULL, 0, 0, 0, 'Sunflower Cake 10Kg', 0),
(16, 'I004', 'SunGold Soybean Oil 5L', 2, 22400.0000, 28000.0000, 50.0000, 'assets/uploads/sungold_soybean_oil_5l.png', 15, 23, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Premium soybean oil from SunGold for cooking', 1, 'code128', NULL, NULL, 0, 'standard', 4, 22400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP016', NULL, NULL, NULL, NULL, 2, 2, 4, 'sungold-soybean-oil-5l', NULL, NULL, 0, 0, 0, 'Soybean Oil 5L', 0),
(17, 'I005', 'AgroPure Sesame Oil 1L', 2, 12000.0000, 15000.0000, 50.0000, 'assets/uploads/agropure_sesame_oil_1l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Pure sesame oil from AgroPure, great for flavoring', 1, 'code128', NULL, NULL, 0, 'standard', 4, 12000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP017', NULL, NULL, NULL, NULL, 2, 2, 5, 'agropure-sesame-oil-1l', NULL, NULL, 0, 0, 0, 'Sesame Oil 1L', 0),
(18, 'I006', 'OilMasters Groundnut Oil 5L', 2, 24000.0000, 30000.0000, 50.0000, 'assets/uploads/oilmasters_groundnut_oil_5l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Rich groundnut oil from OilMasters for frying', 1, 'code128', NULL, NULL, 0, 'standard', 4, 24000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP018', NULL, NULL, NULL, NULL, 2, 2, 6, 'oilmasters-groundnut-oil-5l', NULL, NULL, 0, 0, 0, 'Groundnut Oil 5L', 0),
(19, 'I007', 'SunGold Sunflower Oil 1L', 2, 4800.0000, 6000.0000, 50.0000, 'assets/uploads/sungold_sunflower_oil_1l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Convenient 1L sunflower oil from SunGold for home use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP019', NULL, NULL, NULL, NULL, 2, 2, 4, 'sungold-sunflower-oil-1l', NULL, NULL, 0, 0, 0, 'Sunflower Oil 1L', 0),
(20, 'I008', 'AgroPure Sunflower Cake 5Kg', 1, 12000.0000, 15000.0000, 50.0000, 'assets/uploads/agropure_sunflower_cake_5kg.png', 15, 22, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Sunflower cake from AgroPure for livestock feed', 1, 'code128', NULL, NULL, 0, 'standard', 4, 12000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP020', NULL, NULL, NULL, NULL, 1, 1, 5, 'agropure-sunflower-cake-5kg', NULL, NULL, 0, 0, 0, 'Sunflower Cake 5Kg', 0),
(21, 'I009', 'OilMasters Sesame Oil 500mL', 2, 6400.0000, 8000.0000, 50.0000, 'assets/uploads/oilmasters_sesame_oil_500ml.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Premium sesame oil from OilMasters for culinary use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 6400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP021', NULL, NULL, NULL, NULL, 2, 2, 6, 'oilmasters-sesame-oil-500ml', NULL, NULL, 0, 0, 0, 'Sesame Oil 500mL', 0),
(22, 'I010', 'SunGold Soybean Oil 20L', 2, 76000.0000, 95000.0000, 50.0000, 'assets/uploads/sungold_soybean_oil_20l.png', 15, 23, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Bulk soybean oil from SunGold for industrial use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 76000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP022', NULL, NULL, NULL, NULL, 2, 2, 4, 'sungold-soybean-oil-20l', NULL, NULL, 0, 0, 0, 'Soybean Oil 20L', 0),
(23, 'I011', 'AgroPure Refined Sunflower Oil 5L', 2, 21600.0000, 27000.0000, 50.0000, 'assets/uploads/agropure_refined_sunflower_oil_5l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Purely refined sunflower oil from AgroPure', 1, 'code128', NULL, NULL, 0, 'standard', 4, 21600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP023', NULL, NULL, NULL, NULL, 2, 2, 5, 'agropure-refined-sunflower-oil-5l', NULL, NULL, 0, 0, 0, 'Refined Oil 5L', 0),
(24, 'I012', 'OilMasters Groundnut Oil 1L', 2, 5600.0000, 7000.0000, 50.0000, 'assets/uploads/oilmasters_groundnut_oil_1l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Groundnut oil from OilMasters for small-scale cooking', 1, 'code128', NULL, NULL, 0, 'standard', 4, 5600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP024', NULL, NULL, NULL, NULL, 2, 2, 6, 'oilmasters-groundnut-oil-1l', NULL, NULL, 0, 0, 0, 'Groundnut Oil 1L', 0),
(25, 'I013', 'SunGold Sesame Oil 2L', 2, 16000.0000, 20000.0000, 50.0000, 'assets/uploads/sungold_sesame_oil_2l.png', 15, 21, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Sesame oil from SunGold for enhanced flavor', 1, 'code128', NULL, NULL, 0, 'standard', 4, 16000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP025', NULL, NULL, NULL, NULL, 2, 2, 4, 'sungold-sesame-oil-2l', NULL, NULL, 0, 0, 0, 'Sesame Oil 2L', 0),
(26, 'D001', 'HomeEase Rice 5Kg', 1, 9600.0000, 12000.0000, 35.0000, 'assets/uploads/homeease_rice_5kg.png', 16, 24, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Premium rice from HomeEase for daily meals', 1, 'code128', NULL, NULL, 0, 'standard', 4, 9600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP026', NULL, NULL, NULL, NULL, 1, 1, 7, 'homeease-rice-5kg', NULL, NULL, 0, 0, 0, 'Rice 5Kg', 0),
(27, 'D002', 'DailyMart Sugar 2Kg', 1, 4800.0000, 6000.0000, 35.0000, 'assets/uploads/dailymart_sugar_2kg.png', 16, 25, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Refined sugar from DailyMart for sweetening', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP027', NULL, NULL, NULL, NULL, 1, 1, 8, 'dailymart-sugar-2kg', NULL, NULL, 0, 0, 0, 'Sugar 2Kg', 0),
(28, 'D003', 'KitchenJoy Cooking Salt 1Kg', 1, 2400.0000, 3000.0000, 35.0000, 'assets/uploads/kitchenjoy_cooking_salt_1kg.png', 16, 26, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Pure cooking salt from KitchenJoy for seasoning', 1, 'code128', NULL, NULL, 0, 'standard', 4, 2400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP028', NULL, NULL, NULL, NULL, 1, 1, 9, 'kitchenjoy-cooking-salt-1kg', NULL, NULL, 0, 0, 0, 'Salt 1Kg', 0),
(29, 'D004', 'HomeEase Soap Bar 200g', 3, 1600.0000, 2000.0000, 35.0000, 'assets/uploads/homeease_soap_bar_200g.png', 16, 27, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Gentle soap bar from HomeEase for daily use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 1600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP029', NULL, NULL, NULL, NULL, 3, 3, 7, 'homeease-soap-bar-200g', NULL, NULL, 0, 0, 0, 'Soap 200g', 0),
(30, 'D005', 'DailyMart Maize Flour 2Kg', 1, 4000.0000, 5000.0000, 35.0000, 'assets/uploads/dailymart_maize_flour_2kg.png', 16, 24, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'High-quality maize flour from DailyMart for ugali', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP030', NULL, NULL, NULL, NULL, 1, 1, 8, 'dailymart-maize-flour-2kg', NULL, NULL, 0, 0, 0, 'Maize Flour 2Kg', 0),
(31, 'D006', 'KitchenJoy Milk 1L', 2, 3200.0000, 4000.0000, 35.0000, 'assets/uploads/kitchenjoy_milk_1l.png', 16, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Fresh milk from KitchenJoy, pasteurized and rich', 1, 'code128', NULL, NULL, 0, 'standard', 4, 3200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP031', NULL, NULL, NULL, NULL, 2, 2, 9, 'kitchenjoy-milk-1l', NULL, NULL, 0, 0, 0, 'Milk 1L', 0),
(32, 'D007', 'HomeEase Cheese 500g', 1, 8000.0000, 10000.0000, 35.0000, 'assets/uploads/homeease_cheese_500g.png', 16, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Creamy cheese from HomeEase for sandwiches', 1, 'code128', NULL, NULL, 0, 'standard', 4, 8000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP032', NULL, NULL, NULL, NULL, 1, 1, 7, 'homeease-cheese-500g', NULL, NULL, 0, 0, 0, 'Cheese 500g', 0),
(33, 'D008', 'DailyMart Rice 10Kg', 1, 17600.0000, 22000.0000, 35.0000, 'assets/uploads/dailymart_rice_10kg.png', 16, 24, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Bulk rice from DailyMart for large families', 1, 'code128', NULL, NULL, 0, 'standard', 4, 17600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP033', NULL, NULL, NULL, NULL, 1, 1, 8, 'dailymart-rice-10kg', NULL, NULL, 0, 0, 0, 'Rice 10Kg', 0),
(34, 'D009', 'KitchenJoy Sugar 5Kg', 1, 11200.0000, 14000.0000, 35.0000, 'assets/uploads/kitchenjoy_sugar_5kg.png', 16, 25, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Granulated sugar from KitchenJoy for baking', 1, 'code128', NULL, NULL, 0, 'standard', 4, 11200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP034', NULL, NULL, NULL, NULL, 1, 1, 9, 'kitchenjoy-sugar-5kg', NULL, NULL, 0, 0, 0, 'Sugar 5Kg', 0),
(35, 'D010', 'HomeEase Maize Flour 5Kg', 1, 8800.0000, 11000.0000, 35.0000, 'assets/uploads/homeease_maize_flour_5kg.png', 16, 24, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Maize flour from HomeEase for traditional dishes', 1, 'code128', NULL, NULL, 0, 'standard', 4, 8800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP035', NULL, NULL, NULL, NULL, 1, 1, 7, 'homeease-maize-flour-5kg', NULL, NULL, 0, 0, 0, 'Maize Flour 5Kg', 0),
(36, 'D011', 'DailyMart Soap Pack 4-Piece', 5, 5600.0000, 7000.0000, 35.0000, 'assets/uploads/dailymart_soap_pack_4-piece.png', 16, 27, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Soap pack from DailyMart for household use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 5600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP036', NULL, NULL, NULL, NULL, 5, 5, 8, 'dailymart-soap-pack-4-piece', NULL, NULL, 0, 0, 0, 'Soap 4-Pack', 0),
(37, 'D012', 'KitchenJoy Yogurt 500mL', 2, 4000.0000, 5000.0000, 35.0000, 'assets/uploads/kitchenjoy_yogurt_500ml.png', 16, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Natural yogurt from KitchenJoy, probiotic-rich', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP037', NULL, NULL, NULL, NULL, 2, 2, 9, 'kitchenjoy-yogurt-500ml', NULL, NULL, 0, 0, 0, 'Yogurt 500mL', 0),
(38, 'A001', 'AgroHarvest Cashew Nuts 1Kg', 1, 16000.0000, 20000.0000, 35.0000, 'd95dde663b8e53acb35650508db757b9.jpg', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>Premium cashew nuts from AgroHarvest, roasted</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 16000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP038', NULL, NULL, NULL, NULL, 1, 1, 10, 'agroharvest-cashew-nuts-1kg', 1, 0.0000, NULL, 7, 0, 'Cashew 1Kg', 0),
(39, 'A002', 'GreenField Groundnuts 2Kg', 1, 8000.0000, 10000.0000, 35.0000, 'af0f3e4c943418e6dbbd56693362e6f4.png', 17, 29, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>Fresh groundnuts from GreenField, raw or roasted</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 8000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP039', NULL, NULL, NULL, NULL, 1, 1, 11, 'greenfield-groundnuts-2kg', NULL, 0.0000, NULL, 1, 0, 'Groundnuts 2Kg', 0),
(40, 'A003', 'CropKing Maize 10Kg', 1, 12000.0000, 15000.0000, 35.0000, '82a515e1bbed18056a06bc480a219ccf.jpg', 17, 30, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>High-yield maize from CropKing for milling</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 12000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP040', NULL, NULL, NULL, NULL, 1, 1, 12, 'cropking-maize-10kg', NULL, 0.0000, NULL, 0, 0, 'Maize 10Kg', 0),
(41, 'A004', 'AgroHarvest Wheat 5Kg', 1, 9600.0000, 12000.0000, 35.0000, '31d13567aa968f07a6d5fc523f177667.png', 17, 31, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>Quality wheat from AgroHarvest for baking</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 9600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP041', NULL, NULL, NULL, NULL, 1, 1, 10, 'agroharvest-wheat-5kg', NULL, 0.0000, NULL, 1, 0, 'Wheat 5Kg', 0),
(42, 'A005', 'GreenField Agricultural Seeds 1Kg', 1, 6400.0000, 8000.0000, 35.0000, '85ecdade8fd684636bb19b242a9bd1b1.jpg', 17, NULL, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>Certified agricultural seeds from GreenField</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 6400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP042', NULL, NULL, NULL, NULL, 1, 1, 11, 'greenfield-agricultural-seeds-1kg', NULL, 0.0000, NULL, 1, 0, 'Seeds 1Kg', 0),
(43, 'A006', 'CropKing Raw Cashew 5Kg', 1, 20000.0000, 25000.0000, 35.0000, 'assets/uploads/cropking_raw_cashew_5kg.png', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Raw cashew nuts from CropKing for processing', 1, 'code128', NULL, NULL, 0, 'standard', 4, 20000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP043', NULL, NULL, NULL, NULL, 1, 1, 12, 'cropking-raw-cashew-5kg', NULL, NULL, 0, 0, 0, 'Raw Cashew 5Kg', 0),
(44, 'A007', 'AgroHarvest Sesame Seeds 1Kg', 1, 7200.0000, 9000.0000, 35.0000, 'c5ec963713c0b1c0c97746d421b3bd7e.jpg', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 300.0000, 0, 1, '<p>Pure sesame seeds from AgroHarvest for oil or snacks</p>', 1, 'code128', NULL, '', 0, 'standard', 4, 7200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP044', NULL, NULL, NULL, NULL, 1, 1, 10, 'agroharvest-sesame-seeds-1kg', NULL, 0.0000, NULL, 1, 0, 'Sesame 1Kg', 0),
(45, 'A008', 'GreenField Peas 2Kg', 1, 5600.0000, 7000.0000, 35.0000, 'db1583f04ef1487ab8f7b4bd71a1b989.jpg', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 0.0000, 0, 1, '<p>Fresh peas from GreenField for cooking</p>', 1, 'ean8', NULL, '', 0, 'standard', 4, 5600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SP045', NULL, NULL, NULL, NULL, 1, 1, 11, 'greenfield-peas-2kg', 1, 5.0000, NULL, 9, 0, 'Peas 2Kg', 0),
(46, 'A009', 'CropKing Cashew Nuts 500g', 1, 8800.0000, 11000.0000, 35.0000, 'assets/uploads/cropking_cashew_nuts_500g.png', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Roasted cashew nuts from CropKing, snack-ready', 1, 'code128', NULL, NULL, 0, 'standard', 4, 8800.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP046', NULL, NULL, NULL, NULL, 1, 1, 12, 'cropking-cashew-nuts-500g', NULL, NULL, 0, 0, 0, 'Cashew 500g', 0),
(47, 'A010', 'AgroHarvest Groundnuts 5Kg', 1, 17600.0000, 22000.0000, 35.0000, 'assets/uploads/agroharvest_groundnuts_5kg.png', 17, 29, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Bulk groundnuts from AgroHarvest for roasting', 1, 'code128', NULL, NULL, 0, 'standard', 4, 17600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP047', NULL, NULL, NULL, NULL, 1, 1, 10, 'agroharvest-groundnuts-5kg', NULL, NULL, 0, 1, 0, 'Groundnuts 5Kg', 0),
(48, 'A011', 'GreenField Maize 5Kg', 1, 6400.0000, 8000.0000, 35.0000, 'assets/uploads/greenfield_maize_5kg.png', 17, 30, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Maize grains from GreenField for milling', 1, 'code128', NULL, NULL, 0, 'standard', 4, 6400.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP048', NULL, NULL, NULL, NULL, 1, 1, 11, 'greenfield-maize-5kg', NULL, NULL, 0, 5, 0, 'Maize 5Kg', 0),
(49, 'A012', 'CropKing Sesame Seeds 500g', 1, 4000.0000, 5000.0000, 35.0000, 'assets/uploads/cropking_sesame_seeds_500g.png', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Sesame seeds from CropKing for culinary use', 1, 'code128', NULL, NULL, 0, 'standard', 4, 4000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP049', NULL, NULL, NULL, NULL, 1, 1, 12, 'cropking-sesame-seeds-500g', NULL, NULL, 0, 0, 0, 'Sesame 500g', 0),
(50, 'A013', 'AgroHarvest Peas 1Kg', 1, 3200.0000, 4000.0000, 35.0000, 'assets/uploads/agroharvest_peas_1kg.png', 17, 28, 'CF1', 'CF2', 'CF3', 'CF4', 'CF5', 'CF6', 100.0000, NULL, 1, 'Green peas from AgroHarvest for soups and stews', 1, 'code128', NULL, NULL, 0, 'standard', 4, 3200.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'SP050', NULL, NULL, NULL, NULL, 1, 1, 10, 'agroharvest-peas-1kg', NULL, NULL, 0, 1, 0, 'Peas 1Kg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 44, '174bea897cfa291808e58da28ac0504d.jpg'),
(2, 45, '7d067b5e721058c48dde3132b2957aee.jpg'),
(3, 38, '3037603870433b821c2cefdea4009c36.png'),
(4, 39, '704f92e4becf4a960d8e0cbcce14080a.png'),
(5, 40, '9b877205297c5c1f6738860203b18aab.png'),
(6, 41, 'f1abe5471f6ca20d0d041697693aa3af.jpg'),
(7, 42, 'f7f3c6c1518ec737ddf92d79943f88d8.png');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 1, 'Whole', 12000.0000, 15000.0000, 50.0000),
(2, 1, 'Cut', 12000.0000, 15000.0000, 50.0000),
(3, 2, 'Whole', 14400.0000, 18000.0000, 50.0000),
(4, 2, 'Cut', 14400.0000, 18000.0000, 50.0000),
(5, 3, 'White', 8000.0000, 10000.0000, 50.0000),
(6, 3, 'Brown', 8000.0000, 10000.0000, 50.0000),
(7, 4, 'Spicy', 6400.0000, 8000.0000, 50.0000),
(8, 4, 'Mild', 6400.0000, 8000.0000, 50.0000),
(9, 5, 'Bone-In', 12800.0000, 16000.0000, 50.0000),
(10, 5, 'Boneless', 12800.0000, 16000.0000, 50.0000),
(11, 6, 'Organic', 4000.0000, 5000.0000, 50.0000),
(12, 6, 'Regular', 4000.0000, 5000.0000, 50.0000),
(13, 7, 'Lean', 20000.0000, 25000.0000, 50.0000),
(14, 7, 'Fatty', 20000.0000, 25000.0000, 50.0000),
(15, 8, 'Small', 40000.0000, 50000.0000, 50.0000),
(16, 8, 'Medium', 40000.0000, 50000.0000, 50.0000),
(17, 9, 'Boneless', 13600.0000, 17000.0000, 50.0000),
(18, 9, 'Skinless', 13600.0000, 17000.0000, 50.0000),
(19, 10, 'White', 16000.0000, 20000.0000, 50.0000),
(20, 10, 'Brown', 16000.0000, 20000.0000, 50.0000),
(21, 11, 'Regular', 11200.0000, 14000.0000, 50.0000),
(22, 11, 'Spicy', 11200.0000, 14000.0000, 50.0000),
(23, 12, 'Lean', 17600.0000, 22000.0000, 50.0000),
(24, 12, 'Fatty', 17600.0000, 22000.0000, 50.0000),
(25, 13, 'Refined', 72000.0000, 90000.0000, 50.0000),
(26, 13, 'Semi-Refined', 72000.0000, 90000.0000, 50.0000),
(27, 14, 'Refined', 20000.0000, 25000.0000, 50.0000),
(28, 14, 'Semi-Refined', 20000.0000, 25000.0000, 50.0000),
(29, 15, 'Regular', 24000.0000, 30000.0000, 50.0000),
(30, 15, 'Pellet', 24000.0000, 30000.0000, 50.0000),
(31, 16, 'Refined', 22400.0000, 28000.0000, 50.0000),
(32, 16, 'Unrefined', 22400.0000, 28000.0000, 50.0000),
(33, 17, 'Pure', 12000.0000, 15000.0000, 50.0000),
(34, 17, 'Blended', 12000.0000, 15000.0000, 50.0000),
(35, 18, 'Refined', 24000.0000, 30000.0000, 50.0000),
(36, 18, 'Unrefined', 24000.0000, 30000.0000, 50.0000),
(37, 19, 'Refined', 4800.0000, 6000.0000, 50.0000),
(38, 19, 'Semi-Refined', 4800.0000, 6000.0000, 50.0000),
(39, 20, 'Regular', 12000.0000, 15000.0000, 50.0000),
(40, 20, 'Pellet', 12000.0000, 15000.0000, 50.0000),
(41, 21, 'Pure', 6400.0000, 8000.0000, 50.0000),
(42, 21, 'Blended', 6400.0000, 8000.0000, 50.0000),
(43, 22, 'Refined', 76000.0000, 95000.0000, 50.0000),
(44, 22, 'Unrefined', 76000.0000, 95000.0000, 50.0000),
(45, 23, 'Refined', 21600.0000, 27000.0000, 50.0000),
(46, 23, 'Pure', 21600.0000, 27000.0000, 50.0000),
(47, 24, 'Refined', 5600.0000, 7000.0000, 50.0000),
(48, 24, 'Unrefined', 5600.0000, 7000.0000, 50.0000),
(49, 25, 'Pure', 16000.0000, 20000.0000, 50.0000),
(50, 25, 'Blended', 16000.0000, 20000.0000, 50.0000),
(51, 26, 'White', 9600.0000, 12000.0000, 35.0000),
(52, 26, 'Brown', 9600.0000, 12000.0000, 35.0000),
(53, 27, 'Granulated', 4800.0000, 6000.0000, 35.0000),
(54, 27, 'Brown', 4800.0000, 6000.0000, 35.0000),
(55, 28, 'Iodized', 2400.0000, 3000.0000, 35.0000),
(56, 28, 'Non-Iodized', 2400.0000, 3000.0000, 35.0000),
(57, 29, 'Lavender', 1600.0000, 2000.0000, 35.0000),
(58, 29, 'Unscented', 1600.0000, 2000.0000, 35.0000),
(59, 30, 'Fine', 4000.0000, 5000.0000, 35.0000),
(60, 30, 'Coarse', 4000.0000, 5000.0000, 35.0000),
(61, 31, 'Whole', 3200.0000, 4000.0000, 35.0000),
(62, 31, 'Skimmed', 3200.0000, 4000.0000, 35.0000),
(63, 32, 'Cheddar', 8000.0000, 10000.0000, 35.0000),
(64, 32, 'Mozzarella', 8000.0000, 10000.0000, 35.0000),
(65, 33, 'White', 17600.0000, 22000.0000, 35.0000),
(66, 33, 'Brown', 17600.0000, 22000.0000, 35.0000),
(67, 34, 'Granulated', 11200.0000, 14000.0000, 35.0000),
(68, 34, 'Brown', 11200.0000, 14000.0000, 35.0000),
(69, 35, 'Fine', 8800.0000, 11000.0000, 35.0000),
(70, 35, 'Coarse', 8800.0000, 11000.0000, 35.0000),
(71, 36, 'Lavender', 5600.0000, 7000.0000, 35.0000),
(72, 36, 'Unscented', 5600.0000, 7000.0000, 35.0000),
(73, 37, 'Plain', 4000.0000, 5000.0000, 35.0000),
(74, 37, 'Flavored', 4000.0000, 5000.0000, 35.0000),
(75, 38, 'Roasted', NULL, 20000.0000, 0.0000),
(76, 38, 'Salted', NULL, 20000.0000, 0.0000),
(77, 39, 'Raw', NULL, 10000.0000, 0.0000),
(78, 39, 'Roasted', NULL, 10000.0000, 0.0000),
(79, 40, 'Yellow', NULL, 15000.0000, 0.0000),
(80, 40, 'White', NULL, 15000.0000, 0.0000),
(81, 41, 'Whole', NULL, 12000.0000, 0.0000),
(82, 41, 'Refined', NULL, 12000.0000, 0.0000),
(83, 42, 'Maize', NULL, 8000.0000, 0.0000),
(84, 42, 'Sunflower', NULL, 8000.0000, 0.0000),
(85, 43, 'Raw', 20000.0000, 25000.0000, 35.0000),
(86, 43, 'Processed', 20000.0000, 25000.0000, 35.0000),
(87, 44, 'White', NULL, 9000.0000, 0.0000),
(88, 44, 'Black', NULL, 9000.0000, 300.0000),
(89, 45, 'Green', NULL, 7000.0000, 0.0000),
(90, 45, 'Yellow', NULL, 7000.0000, 0.0000),
(91, 46, 'Roasted', 8800.0000, 11000.0000, 35.0000),
(92, 46, 'Salted', 8800.0000, 11000.0000, 35.0000),
(93, 47, 'Raw', 17600.0000, 22000.0000, 35.0000),
(94, 47, 'Roasted', 17600.0000, 22000.0000, 35.0000),
(95, 48, 'Yellow', 6400.0000, 8000.0000, 35.0000),
(96, 48, 'White', 6400.0000, 8000.0000, 35.0000),
(97, 49, 'White', 4000.0000, 5000.0000, 35.0000),
(98, 49, 'Black', 4000.0000, 5000.0000, 35.0000),
(99, 50, 'Green', 3200.0000, 4000.0000, 35.0000),
(100, 50, 'Yellow', 3200.0000, 4000.0000, 35.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES
(1, 'PO2025/08/0001', '2025-08-18 17:21:00', 4, 'AgroSupplier Ltd', 1, '&lt;p&gt;received total products&lt;&sol;p&gt;', 2160000.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 2160000.0000, 2160000.0000, 'ordered', 'paid', 1, NULL, NULL, '1', 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`, `base_unit_cost`) VALUES
(1, 1, NULL, 44, 'A007', 'AgroHarvest Sesame Seeds 1Kg', 88, 7200.0000, 300.0000, 1, 0.0000, 0, '0', '0', 0.0000, NULL, 2160000.0000, 300.0000, '2025-08-18', 'received', 7200.0000, 7200.0000, 300.0000, 'SP044', NULL, 1, 'KG', 300.0000, NULL, NULL, NULL, NULL, 7200.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('gjsjer4cn8ajeb29eorjde19gl1gh0jv', '::1', 1755573124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537333132343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d6c6173745f61637469766974797c693a313735353537323731353b),
('14lv1trevfoak39m6kvp17qf5ocm9mmj', '::1', 1755572978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537323934313b),
('3u0tjbhnsjfvfiud55s0cc5ps8iernbp', '::1', 1755573454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537333435343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d6c6173745f61637469766974797c693a313735353537333339383b),
('i25g2evlk8vh17gr8vrif6i1p43h82uk', '::1', 1755574209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537343230393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d6c6173745f61637469766974797c693a313735353537333339383b),
('ff8069h8len62p2pab2s4emt225g97k0', '::1', 1755574379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537343230393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d6c6173745f61637469766974797c693a313735353537333339383b),
('1pooqb2a3cpr1ate4uflkmt6vd78n4d8', '::1', 1755572586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537323538363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('2far0kgp90p3opnr680femk1rccot2ks', '::1', 1755571837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537313833373b),
('pt1rcbc7tns4hiua36r7imrade2kggtl', '::1', 1755571166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537313133353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('olafv94jlvf446d4fapd0q1d8ad121i6', '::1', 1755572941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537323934313b),
('lj9a2u4e2lo98il8e9hqavmuvj3324h0', '::1', 1755572236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537323233363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('n6vihab78v9v9jjmk6ak24pfqretmn4v', '::1', 1755570545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537303534353b),
('q7knhmgrul4f72nnqm5fhntugpku1p4n', '::1', 1755571927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537313932373b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('9obqqlmu4mlrf4asorld5fcvkmvq8sbg', '::1', 1755571078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537313037383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('bv1cv1575176rgpmovdq0dgbv5hhsgsp', '::1', 1755568924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353536383932343b),
('mcfb57f8ecnvgslj81lfncceciqqs9un', '::1', 1755523006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532333030363b7265717565737465645f706167657c733a353a2261646d696e223b),
('46rpsrak5g26f7jc3k97n1uh0p3dqra8', '::1', 1755523353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532333335333b7265717565737465645f706167657c733a353a2261646d696e223b),
('ul3mkqfar40n2b2rvatojuosbnl44k2a', '::1', 1755525714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532353731343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('nia86e21g85e0fv42h8qb1icu368std1', '::1', 1755526276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532363237363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('oufsg9t3b1fl6udrbu1ok4kfqcadkiem', '::1', 1755526228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532363232383b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('845fe0sf94hmbgkscofja8decs3k5l89', '::1', 1755526538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532363533383b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5tlqv9poj04i2g4kgg46g1cbca3o3tl0', '::1', 1755531883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533313838333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('g3hdep4l3lbgqud94g1vfgdqbnt7hn2j', '::1', 1755529061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532393036313b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('r55s87326ai27e9evfnns27taigsahro', '::1', 1755529367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532393336373b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bo4jst7rga5e6b2eietc6g71844ldmkr', '::1', 1755529734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353532393733343b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('itft66okd354l1d6vhjldc1iq1al5g8l', '::1', 1755530907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533303930373b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eo9gdrp4o5pjfesvuqu3j4ianccujgh9', '::1', 1755531211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533313231313b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('647pn1k3kv9b7lren46co9hhrdqi5a93', '::1', 1755536852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533363835323b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b8pdb8l7526tki18cc52250cfseeuddn', '::1', 1755534086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533343038363b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('6s6ns9alcd3fuvisfu0lqk0f4ld64rj5', '::1', 1755535126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533353132363b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('bvilmtlfhi1euvh2rlopiguunj049m48', '::1', 1755535453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533353435333b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('462ftm9iet3eoj5gphn3bpasdp5p095i', '::1', 1755535848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533353834383b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('1b05oterh4b4n5u3ehlptun2p2jenmjq', '::1', 1755536285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533363238353b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('33oojq52opo1c33t4bd55tij5nt3qb1i', '::1', 1755536671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533363637313b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('ta26avfqhtro6v49ffl97g8ts7pfi7pv', '::1', 1755537312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373331323b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('5ruhg3b3kgp252tk790o2b0tv173l02s', '::1', 1755537178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373137383b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('rvpth9kla0fckr1m755n08eki8ttigsv', '::1', 1755537488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373438383b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('n9sn7gbpgqfn95m3j5r1i390mp8ra8vh', '::1', 1755537339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373331323b7265717565737465645f706167657c733a35313a2263617465676f72792f696e647573747269616c2d70726f63657373696e672d70726f64756374732f736f796265616e2d6f696c223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535313733303030223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('4f9bf2e6miireis9u490etthuvroh3q0', '::1', 1755537794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373739343b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22705537316257524c49364a4f41794d7843776e59223b),
('1ulj66fcaartm1igq1lhjo21vj6ls7jn', '::1', 1755537794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373739343b),
('rmbg4sg5jcij69susj630tu5b2n5ta3f', '::1', 1755537794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373739343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('g9qn8qbc2plnhjhfhi9cg5bhlafjc1cr', '::1', 1755537794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533373739343b),
('pbr1mnugr10nbhg6lr61lf8gdna0t5sa', '::1', 1755539461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533393436313b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22705537316257524c49364a4f41794d7843776e59223b),
('0aoe8afchgt6c997pdfjhb2sqc274luk', '::1', 1755539945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353533393934353b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22705537316257524c49364a4f41794d7843776e59223b),
('tnqm1as5np0ddj1t0pv1kn6m54f3k2fm', '::1', 1755540286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353534303238363b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22705537316257524c49364a4f41794d7843776e59223b),
('q4vks2ttfr2jtl9t2phmdpltsp4g7rod', '::1', 1755540545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353534303238363b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353233333731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22705537316257524c49364a4f41794d7843776e59223b),
('cilcfse7p90r6l3pnpeh604htof13ito', '::1', 1755570480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537303438303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353235393234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('f78df0d7fa992cdb24a820df2cc21954715aa0cf', '41.59.13.202', 1755576015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537353834323b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353638363937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ba3085f9811e559dcde067be516a1ab406ea35a9', '161.97.131.194', 1755575918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537353931383b),
('f70dfd750611b3a20a05f26c2d5dfb08ee00bf78', '161.97.131.194', 1755575918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537353931383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b612434fa22bde1963d9c2be853b2d67bba37c63', '161.97.131.194', 1755575919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537353931393b),
('70447366b53bcac6ef7a11f4e24e2395d4a2659f', '41.59.13.202', 1755576686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363638363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('94d610510562d1b4c771cb3b453928d45acc938e', '41.222.179.224', 1755579287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537393238373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9aeede2f3e7e79cd2e049c7e6f90d23220da3cca', '41.59.13.202', 1755576380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363338303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('cb8e3e308dc3610475fe21a929b4df8a8acf0d82', '41.59.13.202', 1755576504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363430303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4afc112c5a39c1384a2f4f25c0e24159262e79d8', '66.249.93.72', 1755576425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363432353b),
('5c9d93f93c252f3f747fc65a08f01f38f6eac921', '66.249.93.72', 1755576426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363432363b),
('eeb04f389832e74342df02f5486d8a01a79cb456', '66.249.93.73', 1755576426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363432363b),
('9a65607e33b326f276a9bd71bd5b94918e724dba', '66.249.93.74', 1755576429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363432393b),
('d4633f2925b682cd9d885399e427caf8b9b36b59', '66.249.93.73', 1755576430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363433303b),
('3084867eb1aecde8f867a10d3ecb32cf2727c994', '66.249.93.72', 1755576430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363433303b),
('49a0ab02dca5a8a96604665e107ba74bc903868d', '41.59.13.202', 1755576684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363638343b),
('62de7ad6de28e8c4ec6579048a9748728f3dcf1d', '41.59.13.202', 1755576686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363638363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7593ae3fca6d88af023faf9a6c3716c249699082', '50.6.197.32', 1755576719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537363731393b),
('d3663e4695c3b7e96a89d346d331ab1dcc8250ac', '50.6.197.32', 1755578525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537383532353b),
('c3de6139bddb011c3edc5177469a5f45dfef1420', '41.222.179.224', 1755579368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353537393238373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1ee4490f7f95bb817b1bfccb67827efe7e233078', '50.6.197.32', 1755580328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538303332383b),
('78f62aa1f659017943e001fa4cf528c950ef82ce', '50.6.197.32', 1755582120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538323132303b),
('3c3470be88a9afbe77665a0fc3e2eaa7a1cbc723', '50.6.197.32', 1755583931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538333933313b),
('66cdd7adb9689f2e21e72e80f9fe270678e7646a', '50.6.197.32', 1755585722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538353732323b),
('f32591bb961691365f91cff1a94bf89f10154103', '196.216.247.42', 1755586296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538363238383b),
('d11ee41a3a71092b80d2b253d60d5bfff9bd7f5c', '50.6.197.32', 1755587531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538373533303b),
('89660a0038426602262a84bc26f5befbe1927aaa', '50.6.197.32', 1755589321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353538393332313b),
('6467c2ecaa3c52da9c2c3b83ec75c1807586cf3b', '50.6.197.32', 1755591131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539313133313b),
('b8940064e9985a88b17e1f728042673a44601e3a', '41.59.13.202', 1755595783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539353738333b),
('6fa0227e5b746137e4f37bf86746c7bcf2c39fc5', '50.6.197.32', 1755592922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539323932323b),
('8523ea99e1278c2f44cfd9b4970b4c7ceca56023', '50.6.197.32', 1755594731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539343733303b),
('cab7b4c5b75270a75a05b69d8783725a71fc12c7', '41.59.13.202', 1755597184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539373138343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353735383832223b6c6173745f69707c733a31323a2234312e35392e31332e323032223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('233739209c82d693a6c22af35a80809dbcc813bb', '5.175.234.59', 1755596467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539363436373b),
('8809a90a803c1cb268728da9b2d884a3a567b0d0', '50.6.197.32', 1755596523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539363532333b),
('45809f7a1beb0e36af5dbcdf5c25361be0135138', '41.59.13.202', 1755597514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539373531343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353735383832223b6c6173745f69707c733a31323a2234312e35392e31332e323032223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('73aac508a719e3a6813b8eace9388f0695ad4d74', '41.59.13.202', 1755598090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539383039303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353735383832223b6c6173745f69707c733a31323a2234312e35392e31332e323032223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a333a7b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a22673978315a57324e223b6373726676616c75657c733a32303a226b59554f477654494a6a456d71484c585773754d223b),
('939ad884b254e93092eabeb83076599156c4a939', '41.59.13.202', 1755598278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539383231323b6964656e746974797c733a32313a226a616e656265746875656c40676d61696c2e636f6d223b757365726e616d657c733a32313a226a616e656265746875656c40676d61696c2e636f6d223b656d61696c7c733a32313a226a616e656265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2233223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353938303930223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2231223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2231223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('c779065da0530df4e82cc3defcefb4a18fcbe963', '50.6.197.32', 1755598324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353539383332343b),
('f3806c855af20b1195d5bcd85e206d44b8ca3b31', '50.6.197.32', 1755600125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630303132353b),
('e709504ffd95375b5e19048113ffebe9631af7eb', '50.6.197.32', 1755601933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630313933323b),
('62098bb9bf8be106a3013ef22765c6fd6dbe71ef', '50.6.197.32', 1755603726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630333732363b),
('9494868ccd5b18ddd330568be695abbbb50648e8', '50.6.197.32', 1755605536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630353533363b),
('056d39b1cb55a7d8d4968185551ee52c953a65b9', '50.6.197.32', 1755607327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630373332373b),
('0f16a973c4ef834124bab31020cfb5afbe4a2413', '50.6.197.32', 1755609136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353630393133363b),
('4a61498ace6e5ef724681db882bd8ef329150ee7', '50.6.197.32', 1755610928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631303932373b),
('f4d2ce0e085d81c937b4aef8845ad47277378dc0', '5.175.234.59', 1755611818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313831383b),
('34457ddc87aeada542e3d644877fd20fe4bd515d', '5.175.234.59', 1755611819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313831393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4025cf63ef18e58180337c4097eb753f1824e900', '5.175.234.59', 1755611820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832303b),
('339925fbbf3e8b985f0cac3406a26e353a3b502d', '5.175.234.59', 1755611820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ddc28fed9f5e61e4e3d8959e96536680f937aa21', '5.175.234.59', 1755611821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832313b),
('0be8d62f7faec814db2449610fbc321b471bb078', '5.175.234.59', 1755611821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('858803e94f390c5c4efc176f52d4bfda23a87b30', '5.175.234.59', 1755611822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832323b),
('7a1ea499656198cbe42b3ebbedd9fb9f739b92f8', '5.175.234.59', 1755611823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e6e04bffcea7f82ed5971e59462b01f40bc66731', '5.175.234.59', 1755611824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832333b),
('7ae9709903ae0a249e682bdbfaea1416fcc0b26f', '5.175.234.59', 1755611825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e38387d4e218769c3c019cb02d4b540dbe610d29', '5.175.234.59', 1755611827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832363b),
('e2dcf0dafd5cbe5ea0df154d0648299f18bd0a86', '5.175.234.59', 1755611828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6515af3e2236c0776eb9675420d155fff1604111', '5.175.234.59', 1755611829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832383b),
('69422867162568ef5d29af36f53eee68026ede3e', '5.175.234.59', 1755611829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313832393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('aa7b01b8a272d7c1f7cacb956bc08da6ce94f341', '5.175.234.59', 1755611830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833303b),
('9f20d066fe4970fe54989b09eb600f3c759087f6', '5.175.234.59', 1755611830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('90a48b1e8467628afc0b5b7a811d4be3c7cff9f5', '5.175.234.59', 1755611831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833313b),
('d9397dba830b0c12f20d708e3d8e1d92aa9ae62c', '5.175.234.59', 1755611832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b3274a4dc17e0de3d45c5268ff485c5fe12c52b', '5.175.234.59', 1755611832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833323b),
('c1a82a855aa96351c4f87339f381f1bda21fb1de', '5.175.234.59', 1755611832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c04ab006964b612ed31ce7a9b3e91355f9b2df90', '5.175.234.59', 1755611833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833333b),
('ee08c7acb471de631b3fb56f4c5b2cb52eb7088d', '5.175.234.59', 1755611834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833333b),
('379d2f7d107a9143a3d84ee4b3a7d6a83ba32273', '5.175.234.59', 1755611834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c00cf36c69770803873de73f689bd563b9c3298c', '5.175.234.59', 1755611834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833343b),
('63f4972569e41414b6f268849cc978099cfb44ad', '5.175.234.59', 1755611835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3ad2d7173cd9ae447243c319a401b0bdef096e2e', '5.175.234.59', 1755611835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833353b),
('64882d29666fe274c6a1bfc70a45ff7c937c2366', '5.175.234.59', 1755611836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8ca4823fd0a4e09a4246509dea4dd6a11e3c3f2a', '5.175.234.59', 1755611837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833373b),
('56616fe927ebb74edef97267b6c7bed469b5f517', '5.175.234.59', 1755611837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0b56e96edae9b699afa8b0fe61f3cfb01185372f', '5.175.234.59', 1755611838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833383b),
('40de3389e0e5925fa6d3367a89721c81a396d170', '5.175.234.59', 1755611838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a9f3228f45e28973f50edd10974da8f9c77bc8b7', '5.175.234.59', 1755611839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833393b),
('bd96accab509f3c40de80c89858411f4924a1b5a', '5.175.234.59', 1755611839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313833393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4e6c069a730d848529cde129e9dd9467e453b15a', '5.175.234.59', 1755611840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834303b),
('6150f2ef36ff2b1bed39dc2d800077b0c25c215b', '5.175.234.59', 1755611841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('531fd4ec403d70cff774eac04cff7adb73eac174', '5.175.234.59', 1755611842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834323b),
('ec6b49dfdf2491073c427d67c85370911f4f6956', '5.175.234.59', 1755611842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('37b7a85844dda2f180533241908d213afa5577ed', '5.175.234.59', 1755611843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834333b),
('227118c6469215c7890770ed7bbeb14445e4d034', '5.175.234.59', 1755611844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('abf0a92e8622c783f32774cf9b041bf8aa382013', '5.175.234.59', 1755611845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834343b),
('2733798ef2b1b4329fe1d7458e1600bc0dc15ab1', '5.175.234.59', 1755611845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834353b7265717565737465645f706167657c733a353a2261646d696e223b),
('247e4e8c4cc04632597b430bb3b4cf8def62301c', '5.175.234.59', 1755611846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631313834363b),
('7178fae99c18fc9fa6766b6bd26e59ac08fa7400', '50.6.197.32', 1755612736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631323733353b),
('f0fef89f88bb6dfbfb3bd63c34ef68ac9ac75ad5', '50.6.197.32', 1755614527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631343532373b),
('510b37124ab92d9b84e9981fa1df29f202cb73aa', '185.177.72.210', 1755614874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631343837343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0857d51028adc7d5ee3216cc3f0121eb379081ee', '185.177.72.210', 1755614874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631343837343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6248be4fd020f6bc4e0e83838918634849902939', '50.6.197.32', 1755616336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631363333363b),
('f818c639f02640ca6ddd254555471ecf536f48c1', '194.50.16.252', 1755617044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631373034343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('67b5bdb430352a7d4f6442190659c2822c0599a8', '50.6.197.32', 1755618129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631383132393b),
('41335812df287a4a05eda69db03113aabe2319aa', '50.6.197.32', 1755619939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353631393933393b),
('0ec1ad53d61f462e729ebec4e3ded822d62f2edf', '50.6.197.32', 1755621729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353632313732393b),
('1ea1585aabdbc167ccab3c6a974df1638907460d', '50.6.197.32', 1755623539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353632333533393b),
('0777d6ff302026fa0a1b6d846a4bc30587dcc1b1', '50.6.197.32', 1755625328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353632353332373b),
('a394571695a6586ec3cd82fa92910c585bb13a0d', '50.6.197.32', 1755627137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353632373133373b),
('aee4cf1848cb5128ccfa43c8557b475d07dcaa34', '50.6.197.32', 1755628930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353632383933303b),
('a726361b7c941d70abe12c5e01546d0077bc7d43', '50.6.197.32', 1755630738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633303733383b),
('7548ed4abaeb458bf85efbca45ef101cf84fe115', '41.59.13.64', 1755631449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633313339383b),
('4ccc2d947e2da4b9a87be156a457730b0cf790cd', '50.6.197.32', 1755632530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633323533303b),
('4e3b626340bbac0ddb3dfc4b458eda5ffe0492a0', '50.6.197.32', 1755634339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633343333393b),
('3864e324c85019bd1e77aa38a1d6b877a6d5494f', '50.6.197.32', 1755636130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633363133303b),
('6c118cd06ee76f9cd67045c48a96bfb55025a702', '41.59.13.64', 1755637743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633373734323b),
('38f7fc360fb660306cac7d7d6696b07498b185f8', '50.6.197.32', 1755637930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633373933303b),
('b9cd1f3f5f7e3d5d0908f76c891550a0baea9180', '50.6.197.32', 1755639730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353633393733303b),
('3fade4888975a59568c7395cfd90b4ac098d5080', '50.6.197.32', 1755641540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634313533393b),
('c68daf2cbf5d18246741dc690dec97dc06773686', '50.6.197.32', 1755643332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634333333323b),
('f285716539f862212713ba2b43f91e07c4d415b4', '50.6.197.32', 1755645140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634353133393b),
('6fb4b3e3f5f57c3540b452afdf3fb18f56f56cb1', '5.175.234.59', 1755646738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634363733383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('391a27fc1722002d69b0576f1ef9939be7f6286f', '5.175.234.59', 1755646739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634363733393b),
('5183ca9606e57922584fa55baa093b9162c9be94', '5.175.234.59', 1755646740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634363734303b),
('b957848d1451a3208172307286c9b7a78e95f35b', '50.6.197.32', 1755646931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634363933313b),
('ccf260411a62d30ea9868c6fda6b31f61cba93b4', '41.59.13.64', 1755648590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634383538393b),
('513f1739f891fae9b36a5e62f83f2ff23473f040', '41.59.13.64', 1755648610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634383539313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535353935373838223b6c6173745f69707c733a31323a2234312e35392e31332e323032223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('790fc127a3accfad885055e3aa1c2206dd653cb6', '185.38.241.4', 1755648604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634383630333b7265717565737465645f706167657c733a353a2261646d696e223b),
('ba7a597222486daa5e9f23582c6070fa3a08c922', '50.6.197.32', 1755648730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353634383733303b),
('37be4877a8cdb404e469363e5a6c822bdd4111cf', '50.6.197.32', 1755650531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635303533313b),
('40317f26e378ddd63ea6c42ab75a7e9df48e42ed', '50.6.197.32', 1755652339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635323333383b),
('b980ef7246571ab887f4fa3716ede0036813b73f', '50.6.197.32', 1755654130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635343133303b),
('fdb12fab8a18c43bc50b88de43e65dad322f7ca2', '5.175.234.59', 1755655920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635353932303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('81397838a20f46e551336fd14a5b60f11744fc92', '5.175.234.59', 1755655920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635353931393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('30ee2130867a6e9066da4471b6f52f60ab091510', '5.175.234.59', 1755655921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635353932313b),
('69535e9e8fbe1f719b910196c92be4b595080b29', '5.175.234.59', 1755655922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635353932323b),
('1a7c8c9deeb6246721457a9db4ae7d790eded0b0', '50.6.197.32', 1755655932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635353933323b),
('48dbeeb87b52e190857a7bf31f5ee1772387cbe4', '45.131.155.100', 1755656182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635363138313b),
('7fa2deb11505ce31fd7f989b14e3b46d83e465fd', '50.6.197.32', 1755657731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635373733313b),
('0c16dd88dbc8ec543b80a1a972eabece072dc6b8', '5.175.234.59', 1755658974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635383937343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d1e50e5f7244e7867fe126941e9600aaee473ce0', '50.6.197.32', 1755659533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353635393533333b),
('98ed7de200ba7c2d3588809d469c4aa91962aacf', '50.6.197.32', 1755661331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636313333313b),
('1c3152a6de9f9927b2caed56626ef4babbbe3fc3', '50.6.197.32', 1755663141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636333134313b),
('576a15f6ce1970ecc2d74995d21db1794b8c70ff', '50.6.197.32', 1755664931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636343933313b),
('3f52aa9a75a290761e8788a224e682d502456de8', '50.6.197.32', 1755666740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636363734303b),
('fb71b576f15e48668dc8ca0997955aa7753ca1a4', '145.220.91.19', 1755668124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636383132343b),
('9104bed870d0e12b863f511b65689769ac91f0ed', '50.6.197.32', 1755668533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353636383533333b),
('91b0ef24856d4d3bc9c012a413a8ccb9454ca3d4', '50.6.197.32', 1755670342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637303334313b),
('8e6990a0c481bdc2888b3b8150d5d7b2c2703b9c', '50.6.197.32', 1755672134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637323133343b),
('db3563093ddee16f0aa3d8cd2a704e0e48afb62e', '50.6.197.32', 1755673942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637333934313b),
('66af97b9a89ee8844cf9baa2bd009c30910319f2', '50.6.197.32', 1755675732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637353733323b),
('365dd6c2c06edf3cabc1ab2441719e23f59f50cb', '50.6.197.32', 1755677541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637373534313b),
('72c6889186f6100fa02f3bebce6c8d6edef1c5dd', '50.6.197.32', 1755679333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353637393333333b),
('6f4b0d61fa148e17e2fc3444af0b36ce004b141d', '50.6.197.32', 1755681143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353638313134333b),
('7c7bef00a21d7bbcd9b70aa788f3076617571b3c', '50.6.197.32', 1755682933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353638323933333b),
('63d3e93cd2d1284e45f11bb58fb4c15e8cd1b865', '50.6.197.32', 1755684744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353638343734333b),
('d0d70c5f85063d40e32ae46f67c6edf546d58590', '50.6.197.32', 1755686536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353638363533363b),
('2c3d056bffdf57d63419a59f70fdecc98374623b', '50.6.197.32', 1755688344, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353638383334333b),
('308632b54ba8e90f9d6650e35cc8aaf5232744e8', '50.6.197.32', 1755690136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639303133363b),
('8af18e5d598ac04c1be298877012ba5fedf87f99', '50.6.197.32', 1755691946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639313934353b),
('1e33ff248f559366d0f0374feaa7a2e11b8ddc93', '179.43.149.114', 1755692566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323536363b),
('d3040a94f4d78283705d12865ab87b88000da2e1', '179.43.149.114', 1755692586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323538363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4f2e4f3931baae2217dbfcdbcdefdede0ac06832', '179.43.149.114', 1755692586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323538363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad0c8eeb3609e6e6b2177cfe55f0fac37fa8d1c3', '179.43.149.114', 1755692587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323538373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5f81effbc54e8fb21deb46ec82c24f633310698a', '179.43.149.114', 1755692669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323636393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6843f06115157ce8cb21214a4e551ddb4249e2ae', '179.43.149.114', 1755692671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323637313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('86bef32f506bfadda6c07c4ec36006f067d2c747', '179.43.149.114', 1755692674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323637343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7334c736ff01f5ce5e7325313a383b8f0ddb656d', '179.43.149.114', 1755692770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323737303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('08298615ecfc85357fc8fb848d84c45ae924da23', '179.43.149.114', 1755692771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323737303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2aefab069a4dabc1ee905847b5757656a00d3bfe', '179.43.149.114', 1755692774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323737343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('09c93172e1a137d2df2f6f1ffb52c48cacd6871e', '179.43.149.114', 1755692862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323836323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5971de560d10d2d94d82c793ca0248f0d6a69ae0', '179.43.149.114', 1755692862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323836323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fcdc3d1174c31348046ab14b8a7a808e4b0c1ec3', '179.43.149.114', 1755692863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323836333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b4e51cf301389141d88e0267f3ed066129a9c1d7', '179.43.149.114', 1755692945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('76477a4b49085634d95aa079e222cc21fa093093', '179.43.149.114', 1755692945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a520a0e47012d861ed9a76e35420e7acf543faab', '179.43.149.114', 1755692947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639323934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('24decb79e5949f4feef6aac140c6948a0c97e6ec', '179.43.149.114', 1755693037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333033373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('052eb1e7fd2e32458a53ddc38e6e823cb8b46735', '179.43.149.114', 1755693039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333033393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a6aa0f1f626210590afc33a1450db9a05b0704c3', '179.43.149.114', 1755693039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333033393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e97c6a6ce8942bab947daefcacfe2e7506e9ea13', '179.43.149.114', 1755693120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333132303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1303eb10d5950dd734e3dd8d2db63d07608fd897', '179.43.149.114', 1755693120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333132303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('028851fbe667db8aaaa0533da7c73802b067ef0f', '179.43.149.114', 1755693121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333132313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ff8e2ca25a5f983238f3989218b52d369d9c67f9', '50.6.197.32', 1755693737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639333733373b),
('f0defad08c505f237857a6504c510cb5d60a3c23', '50.6.197.32', 1755695546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639353534363b),
('4c2e3e07dcde97414961399cd6d326718bd0f7a6', '50.6.197.32', 1755697338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639373333373b),
('3c3e814b97501d28d442e972783b6820cf32101b', '50.6.197.32', 1755699146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639393134363b),
('d0a5e215991b3be43c4ad13af2d84e957013b751', '34.85.152.123', 1755699851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639393835313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('899e67dad722c6914d15effe0bc3a52f108a4d3f', '34.85.152.123', 1755699855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639393835353b),
('8d350eabbe3f54678c64dd5364d1a6b9b707c40b', '34.85.152.123', 1755699858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639393835383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('35c8d8c27e6597ead52241aa1dc4f38dd0303840', '34.85.152.123', 1755699862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353639393836323b),
('48393bbbfafc9ae4c4812a6b884c554628aa7387', '50.6.197.32', 1755700940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730303934303b),
('fac557708529a2e765fb17b09a06fa6b6cc98cc5', '50.6.197.32', 1755702747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730323734373b),
('24a3ece9f3ee512092a617a52d470bd9022360b6', '50.6.197.32', 1755704540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730343534303b),
('15ec10d4fad3555244f9215343c577278c0895d8', '50.6.197.32', 1755706348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730363334383b),
('753f7fb52abdc593e389b56d5b66a4e6eb5637f9', '50.6.197.32', 1755708140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730383134303b),
('48ea40ac0262100b1ebfd9d4604ae78472df183e', '50.6.197.32', 1755709949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353730393934393b),
('91fbdd83b6a4c319ffc67145ae5d6322be0b48e7', '50.6.197.32', 1755711740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353731313734303b),
('bf434759cdc1274db867c39c5a765f6fbe11dd26', '50.6.197.32', 1755713550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353731333535303b),
('8a7564937b4e02265ecb050dcd90754e8cb35264', '50.6.197.32', 1755715343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353731353334323b),
('93423df9236b34085c6d7dff612494cf1db03c2e', '50.6.197.32', 1755717151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353731373135303b),
('7a142675898f9c558f06048b133ba36d8524160c', '50.6.197.32', 1755718941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353731383934313b),
('aa266d88e05ea54dd4c9b47d1b48eca0ae1cc8f2', '50.6.197.32', 1755720750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732303734393b),
('79c0a8c6a55e3e5798aeb03d63f552aff422ba79', '50.6.197.32', 1755722541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732323534303b),
('9b0e0cb3d0db5c54fe53e3bf889f0789fcf0c820', '4.227.36.16', 1755722583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732323538333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d9487a15364989c9ed3a5d6d8f0057fd4e2473b2', '4.227.36.16', 1755722584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732323538343b),
('b9a0b406478e88b0234d1890662cc1ae7dac3304', '20.171.207.216', 1755722682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732323538353b7265717565737465645f706167657c733a33393a2263617465676f72792f706f756c7472792d70726f64756374732f6c617965722d636869636b656e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('cb29c103881cce543608b39bf0c9c205894c0513', '50.6.197.32', 1755724351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732343335313b),
('e377759c5fa4337a62cd8247b0db69eed8cc47d3', '50.6.197.32', 1755726144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732363134343b),
('aa821fc82577488106af30df2d8928f1a0de0ea2', '50.6.197.32', 1755727949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732373934393b),
('8925d919ea738353c9ef023d0ec1628d6c798d85', '50.6.197.32', 1755729744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353732393734343b),
('52324a8fd90dbb52ea2a7c1307b3822d142c0a6e', '50.6.197.32', 1755731551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733313535303b),
('5a19dfcf0b7e47114d811f4e21147c6db70ff218', '50.6.197.32', 1755733342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733333334323b),
('2bdd3112dff04319afb8da3374cf4cd3b01d4c40', '50.6.197.32', 1755735151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733353135313b),
('abbaeeacf61b08664ceceef3c6f2cf9a713fef41', '50.6.197.32', 1755736948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733363934383b),
('166d9027996a8f7b5f69bbb775b5a0c6388ef23a', '50.6.197.32', 1755738751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733383735313b),
('d5a58d624eee71e82fc99f94fa7b9faaa94e273d', '4.227.36.87', 1755739079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733393037393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dce26628d8320a4d8a730912b642ebc6a14c899f', '4.227.36.87', 1755739081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353733393038313b),
('db99f80560bfd99277131317beb99e0c20c757d2', '50.6.197.32', 1755740543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734303534333b),
('44c67e061bff66e3ad8af3a2af7404b269691695', '50.6.197.32', 1755742352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734323335313b),
('78fa6d30d5c5d9744b1f27043a574307b92722b9', '50.6.197.32', 1755744143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734343134333b),
('72f9cd204b0e9cb790c881b8e0b6757c80cb8ab9', '50.6.197.32', 1755745954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734353935333b),
('60baa8efe4aadcb580df167d81354080723a2600', '50.6.197.32', 1755747747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734373734373b),
('39af03e8528735bd0ce6423675f249da162f7010', '50.6.197.32', 1755749553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353734393535333b),
('cf83fc8ed7a662de3de8af077ba4035364ea8ca9', '50.6.197.32', 1755751346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735313334363b),
('7208328efa3466ee23db363d0a7927afa9050d2b', '50.6.197.32', 1755753154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735333135343b),
('415044971cadc34b6dcfb6574eedfc32cb00c8e8', '4.227.36.87', 1755754436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735343433363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b0df3326997b1733f558d0daabb2e6558f62cf15', '4.227.36.87', 1755754437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735343433373b),
('a29cc615c0ea198bb993bcf97a6e95d9c453e4da', '4.227.36.87', 1755754873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735343837333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a50dbd6f3749a250a66c13679803ab571cca35ce', '4.227.36.87', 1755754873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735343837333b),
('c8949aa2fecb1e45fe6d5c6e19072f1040b5f01b', '50.6.197.32', 1755754945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735343934353b),
('7d9f163303a98238d82bcd79eeb7100089c7892b', '50.6.197.32', 1755756754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735363735343b),
('1f23c5d812eeb36d645afc38ef16aea8065f117c', '50.6.197.32', 1755758546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353735383534363b),
('f3a561cbb531a46975de47ffee178f2108f12acd', '50.6.197.32', 1755760355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736303335343b),
('86f3ba5391a65cb2e01dae289912d2801a98409f', '50.6.197.32', 1755762146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736323134363b),
('24f757eeb3f9ede7ae2cfb66cab4509b63d3b1ae', '3.146.111.124', 1755762702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736323730323b),
('bec686b2702012fd9ca7781aca9b18f81b97d0a0', '3.146.111.124', 1755762702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736323730323b),
('872647e8ceb16dddeb3809d31276e26a3eb115cb', '50.6.197.32', 1755763956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736333935353b),
('e8399235bcff970cd7a9be788ea0ea7854051521', '50.6.197.32', 1755765746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736353734363b),
('fc7f36656d99b8a544d068b220dad62a30d4b972', '18.224.192.118', 1755765755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736353735353b),
('70d7abce8459ac97e40601e0969704c7fbc6b85b', '18.224.192.118', 1755765755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736353735353b),
('a6da9e5dbc4551dce7c4d68fcc17a36f34fee81f', '50.6.197.32', 1755767555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736373535353b),
('93f9c9ee25348a8eb7fef3bf93d4d6340910cfef', '197.250.60.10', 1755775628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353632383b),
('8044b951f4dbb930ccdb02880329e55261c7e2dc', '50.6.197.32', 1755769347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353736393334373b),
('9eec6dc15f5c38bbaa90346f0abc3651aa5b5144', '50.6.197.32', 1755771157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737313135373b),
('55a60a2bebe12134684b12a3d8d418c870886e56', '50.6.197.32', 1755772948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737323934383b),
('2d52c9277229bbac7eee859666bed26916ea792f', '41.59.178.64', 1755775068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353036383b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373733393931223b6c6173745f69707c733a31323a2234312e35392e3137382e3634223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d1521f297a1e109539b130157722d12e43ce715f', '41.59.178.64', 1755774362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737343336323b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535363438363039223b6c6173745f69707c733a31313a2234312e35392e31332e3634223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a333a7b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a226446314a6b6d6675223b6373726676616c75657c733a32303a226a615658506f35596d4d487668415a7175674e32223b),
('f708d605496a1ec8ef1ee57d078f06df95047455', '50.6.197.32', 1755774753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737343735333b),
('f330453fde790a862171af159ef4e34b9509c4a2', '4.227.36.87', 1755774926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737343932363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('507a2dbcccbe65037c42d428980f754069d7c4ab', '4.227.36.87', 1755774926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737343932363b),
('f2ddc85a3cc44430f3d067a2464782e3484c16f2', '41.59.178.64', 1755775629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353632383b),
('35eee373e6208ed01ccb8d288543a53cc4c5f083', '196.216.247.42', 1755775970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353937303b5f5f63695f766172737c613a343a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373735333332223b6c6173745f69707c733a31323a2234312e35392e3137382e3634223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2274344c7767586439223b6373726676616c75657c733a32303a223058446e76644f754a626f7161686a515a326b67223b),
('d88ed69ef855467ad0a778257e101f8994b2ec35', '41.59.178.64', 1755775337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353333373b),
('5b265146fdc078bba898c8d2073491dcb74d1270', '41.59.178.64', 1755775572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353537323b),
('15e11d4615408a8ac420a6f6677caebffa7b2df2', '41.59.178.64', 1755775573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353537333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d76ec3f2fc597f9b13e7b0667a995868c2d36282', '41.59.178.64', 1755775573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353537333b),
('43c333771fd2e3deedca021ccebb0492859a48b7', '41.222.180.56', 1755775892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353839323b),
('58998207a8ea8bd92175ae35a5ba98eb2b74b7ec', '41.222.180.56', 1755775893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737353839333b),
('2b42c6eab9b1b719d546d540ad092da12a8d4f59', '196.216.247.42', 1755776345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737363334353b6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373735373532223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a333a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b733a383a2272656d696e646572223b733a333a226f6c64223b7d7265717565737465645f706167657c733a31333a2273686f702f70726f6475637473223b),
('ca0fa27afae0445f4ff7104f2f499c578a0e0b59', '196.216.247.42', 1755776260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737363236303b),
('62436a4713af29df31aff37b7796001303ed31d1', '196.216.247.42', 1755776494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737363439343b),
('969384bcb8757edba2a01e985e6898edf177428e', '50.6.197.32', 1755776547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737363534373b),
('8865c6c14f478b78330972af77bfc77674b8fa27', '50.6.197.32', 1755778362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353737383336323b),
('239f8e08c351f66f39b4694be93bf645247bab65', '50.6.197.32', 1755780150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738303135303b),
('493f3d8899004cab04402818498107ced7d5b08d', '50.6.197.32', 1755781961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738313936303b),
('243095e93262b2131cdaa30ec7cff16803e41166', '197.250.102.95', 1755783723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333732333b7265717565737465645f706167657c733a33353a2263617465676f72792f6167726963756c747572652d70726f64756374732f6d61697a65223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('74f2b3a07b3c11d5258fdad9d171bc39b3cc1db3', '66.249.93.73', 1755783177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333137363b),
('14c8b887110ef8f929999cd8eac892b46c124f82', '66.102.8.131', 1755783178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333137383b),
('257cf96041891a4219b4d68c7c4968c06ae621d2', '66.102.8.131', 1755783178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333137383b),
('4537f51f483a761885c26f34127687c3c1228a9c', '66.249.93.73', 1755783251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333235313b7265717565737465645f706167657c733a33353a2263617465676f72792f6167726963756c747572652d70726f64756374732f6d61697a65223b),
('3cf4b82647b8ba320814c137adee15803c0a2ed1', '66.249.88.229', 1755783252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333235323b7265717565737465645f706167657c733a33353a2263617465676f72792f6167726963756c747572652d70726f64756374732f6d61697a65223b),
('7c178317b0722687a53e793afee56f5c42c1a396', '66.102.8.132', 1755783254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333235323b7265717565737465645f706167657c733a33353a2263617465676f72792f6167726963756c747572652d70726f64756374732f6d61697a65223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ad1b043e35155f990e3279f596296259ff02afab', '197.250.102.95', 1755783731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333732333b7265717565737465645f706167657c733a33353a2263617465676f72792f6167726963756c747572652d70726f64756374732f6d61697a65223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6d6573736167657c733a35393a223c703e456d61696c20686173206265656e2073656e7420776974682072657365742070617373776f726420696e737472756374696f6e733c2f703e223b),
('b23f60e57aa2d16d8ee130690d6a81da800c78ba', '50.6.197.32', 1755783751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738333735313b),
('6ba7efeb64a53f15a63b064a44e57b3a1d886c62', '45.139.104.199', 1755784368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738343336383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fee8ecb162afc10249f65b3b2a9914f6e0ceef12', '50.6.197.32', 1755785559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738353535393b),
('494803b0aedeaf65392d7220634a8f5fc9c94a8a', '50.6.197.32', 1755787350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738373335303b),
('1cce637993a71b0b2abf5f26aa8dfa03a903744a', '50.6.197.32', 1755789159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353738393135383b),
('da52f552623220fda3f641a94a8e8fb0fad5cffe', '50.6.197.32', 1755790267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739303236373b),
('138ff79a2d2e13b32f66fc2c4d29d5ac06a07c6a', '50.6.197.32', 1755792060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739323036303b),
('bc676f869b39797162de62fc2e43dfcdf59bad0f', '4.227.36.87', 1755792963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739323936333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5eb7dcdc57a76fdfdff5163c46f2be85e6683c34', '50.6.197.32', 1755793859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739333835393b),
('fdf8ae2bc03a2b9241729bf97bd2c100bdb1c56b', '50.6.197.32', 1755795659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739353635393b),
('6c0337b32b97e906a21008fd2f2201fe88bb2805', '50.6.197.32', 1755797469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739373436383b),
('85cfcc08e9633cf88d47c28a24a0504d204ad65c', '50.6.197.32', 1755799261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353739393236313b),
('1ec2866791c7406134aa977b57d6075ca3e97163', '50.6.197.32', 1755801068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830313036383b),
('dbc23595b877f1a041c628979e840c592a820a1f', '45.141.233.208', 1755802598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830323539383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1ff407cff04dbd43b90a05352db001d79e1c0ad7', '45.141.233.208', 1755802599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830323539393b),
('0310c80b4344a3fb42e891e671001dc3b0d0f18c', '50.6.197.32', 1755802861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830323836313b),
('5faf4fa6fdf7bddc8cfc278eb1cd250afd707c0c', '5.175.234.59', 1755803382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830333338313b),
('d2b08b919aade61348d5bff558a4075d386030da', '5.175.234.59', 1755803382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830333338313b),
('05406b00c7e21b8437b671964927ca2bf3ef372c', '50.6.197.32', 1755804659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830343635393b),
('3384d288e59e1247c4fa4f4d8efe9d62a7bb0f75', '50.6.197.32', 1755806461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830363436313b),
('ad2246609aa3bce12de1c1e192cfee63d551dfc3', '185.177.72.54', 1755807152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373135313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('299aab47b3360615eb96e417c4797c8202b6108e', '185.177.72.54', 1755807152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373135313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3469173f008b0c44419ae9a9d41300f56564c5fe', '185.177.72.54', 1755807153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373135313b),
('b90a1b39218d65a1add468e7eae782ad65b94db7', '185.177.72.54', 1755807160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373135393b),
('66e1a979cd8aed16d51d3a28c674a3dc5545dec9', '185.177.72.54', 1755807160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373136303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c1ea7b5cc6f592ec72ec8a6c998c244d5d0ed06b', '185.177.72.54', 1755807167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373136373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('59b15d21ae7ca4d6a0871b9f5c936ca03965eaaf', '185.177.72.54', 1755807167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373136373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b504f02ff71aeb2a2fb33ec7003b0d6eab792b25', '185.177.72.54', 1755807168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373136373b),
('597561631dfec3a9aac0a300253e2336ddcb40c3', '185.177.72.54', 1755807174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830373137333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6367e94e9bfc928eff3bc48651085eca758fdb42', '50.6.197.32', 1755808261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830383236313b),
('74059d0da25170e971ea17130b83c176c88f9081', '194.50.16.252', 1755809375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353830393337353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b1faf7a00f8255a364305e663337492be422e21f', '50.6.197.32', 1755810062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831303036323b),
('e06552b4f072e4f7de2e154451175724e473506b', '50.6.197.32', 1755811863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831313836333b),
('d34366949f4c03c4df9bd1780fdd780f059ec668', '134.122.133.31', 1755813263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831333236333b),
('6d9c17ec6d672b97036790fc680ad1f47ba6e78d', '50.6.197.32', 1755813661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831333636313b),
('51048a2ec2e1a0a6988893479603b991da0c29ec', '50.6.197.32', 1755815471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831353437303b),
('23880a6b5e316cf6ace4bc612985bf5b99d40034', '50.6.197.32', 1755817312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831373331313b),
('d8444ac08360215d98632222314df6293561f443', '4.227.36.106', 1755818945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831383934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a8e8f80f2a5b27017b2aecd1fe293dc92814acb6', '4.227.36.106', 1755818946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831383934363b),
('fb197d9a4641bd54ab30efd70d3eadbf73d06db2', '50.6.197.32', 1755819062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353831393036323b),
('a70521c7c479e38a19d41fe6169b6f75a3bc10a2', '50.6.197.32', 1755820923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832303932323b),
('d1ae05c86a8f230080ad64af63ad839c1374da3a', '50.6.197.32', 1755822662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832323636323b),
('3d5b053eaf71d291a2d5ee9cf8ece499b6c9cada', '45.139.104.199', 1755824506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343530363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8cce2cc0178c5d2182158ff0ef9e99a08179831e', '185.177.72.106', 1755824506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343530363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e0508ddd1882fb6fdef9a4ff6f1dcd789d5753bf', '185.177.72.106', 1755824506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343530363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b969e5b807ddbaa2f76e10b8b3ce8f085d594047', '50.6.197.32', 1755824506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343530363b),
('a88ab594fa472b40d50bdd52854e3ac41d93d990', '185.177.72.11', 1755824639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343633393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f5136f069d1cbab8f2c738d495e57737d0306675', '185.177.72.11', 1755824640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343633393b),
('69b5dd8d0e58ff39446e90247d0965a359f3fad2', '185.177.72.11', 1755824641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832343634313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1da75708abe90b17a8c3fd28369c7852d061706e', '50.6.197.32', 1755826265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832363236353b),
('23f3fc47574389a0b1281a4f98d6cab42a4395fd', '50.6.197.32', 1755828130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832383133303b),
('2345eb3b5531d2a60d6de1b1cdb15b4159dd2ccd', '50.6.197.32', 1755829863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353832393836333b),
('69bfd1b583d590ca4d12158a58a3492e483faebc', '50.6.197.32', 1755831729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833313732393b),
('8b0cfafbb6736ece703b8ef84f22945e0cef866e', '50.6.197.32', 1755833463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833333436333b),
('a20094257bd105723ba7f0de668a6748b2e0c616', '4.227.36.106', 1755833716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833333731363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c9902c09e944502ac1570cf35f7a741f5bdd1366', '4.227.36.106', 1755833717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833333731373b),
('a317be9eccffe1ade77119519d81cd56c7fb11e3', '50.6.197.32', 1755835317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833353331363b),
('231d8f060efd64c97de43d139b7b53a2b1aef182', '50.6.197.32', 1755837066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833373036363b),
('bf6ffa000ae3a1423e7994a7174b8b0c036dadde', '50.6.197.32', 1755838920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353833383932303b),
('9d2e261c5f9cb3545d5f468f8b2828eeb3940a7d', '5.175.234.59', 1755840361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('afd5579db2428937515a507cca5eea5c214a6db0', '5.175.234.59', 1755840361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336313b),
('9cde520324e271365d1398965f6fc22a1eada8c4', '5.175.234.59', 1755840362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fcaac09d50ca7108a0c0b14d7d968de61f1de197', '5.175.234.59', 1755840362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336323b),
('cf3f9c4b93357857474641eecdd57d2e6b1a1b8a', '5.175.234.59', 1755840363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336333b),
('cceb02da7ab137a6da80cd8acf9d70d63862a8ef', '5.175.234.59', 1755840363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336333b),
('0026908bf262e40c1f789528a26e749857fe09b4', '5.175.234.59', 1755840364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('35f17c2c406e9a424723e6d9d118290f91c5978c', '5.175.234.59', 1755840365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336353b),
('f348a8d3bd6086384d037801c7d75bd51b9e49d0', '5.175.234.59', 1755840366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e0ff08de49b409e58189a8efc70765b6aae933e7', '5.175.234.59', 1755840367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336363b),
('266ada484b323adb2140d9d00d548c3a6be4060b', '5.175.234.59', 1755840367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f5d2450874cce28614cae0ffa86c9315bdb5e91f', '5.175.234.59', 1755840368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336383b),
('1a69aa42286cc74e2b10aa99bffb28e905c5070a', '5.175.234.59', 1755840368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72c984b3dd011448af0cae11b5ffccfb3ee93117', '5.175.234.59', 1755840369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303336393b),
('240a5ed97a000585222ccf2205a3814bcc2ec8ac', '5.175.234.59', 1755840370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3d719fa62a8f669808de19ff7f8c6575db117873', '5.175.234.59', 1755840371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337313b),
('1b56832358573c2f145d2521aa6e9cfe7dda7546', '5.175.234.59', 1755840371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('87fb3a55b2c1c51f77505192ff1375e72affb683', '5.175.234.59', 1755840372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337323b),
('d54855edbedd5aa030e140cc8f6d836bd60d1600', '5.175.234.59', 1755840372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('445e50c093f75ddf6b091112ab56cad1127d51ae', '5.175.234.59', 1755840373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337333b),
('9f7ea74c83c98a13c748833ae6dcc376a6294e2c', '5.175.234.59', 1755840374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('452736b891770376878857b7c9e6d44552c4b994', '5.175.234.59', 1755840374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337343b),
('bfedf78e8d8501623f0fe491712b3346ffe87a19', '5.175.234.59', 1755840375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d2dd054b8ca16eb5f7d65bc3ff1d772c99aa8416', '5.175.234.59', 1755840376, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337363b),
('779497a6c7f69ad214c3694bcc049c0d9aad01b8', '5.175.234.59', 1755840376, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('56b80eb110ac4cc6813426601b2e17cff52df603', '5.175.234.59', 1755840377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337373b),
('e38c81c558b844cf5104efa7de69c47ff9a8e0c0', '5.175.234.59', 1755840378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337383b),
('033e3ffecd38f633ba938d5a9dd50266ba7466b3', '5.175.234.59', 1755840378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3fca3475260ec62b2f077a3199aaac33f5c4e6c3', '5.175.234.59', 1755840379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337393b),
('b144360e9faae7c3f9a5a2653d2a8fcd8210af7e', '5.175.234.59', 1755840379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303337393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c4f7eeeab9d143c1e88df72a457f8f6ac7e23a2f', '5.175.234.59', 1755840380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338303b),
('39a79fce10e6d8547b62afbc92fdbb015d823e46', '5.175.234.59', 1755840381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d1b827437743e429556d75ea524198ce1aec2810', '5.175.234.59', 1755840381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338313b),
('01e5b5c356d9ff0f11af8635adbf39afda4fd5dd', '5.175.234.59', 1755840382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f92ed2c5f990cf1e080337d8ef7677713950905e', '5.175.234.59', 1755840382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338323b),
('3dd0c09347cb51ff1be3f58495426289f6146196', '5.175.234.59', 1755840383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f39aa25d588b249a80a39b65a1fbea6ad4ae11a2', '5.175.234.59', 1755840384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338333b),
('aa11731afc8c05e37a0577b3a090d7285fcaae0e', '5.175.234.59', 1755840384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b8fb6b855ca76c4ae1f54658d7acc1822b626e5', '5.175.234.59', 1755840385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338353b),
('53a859ab4312b36b120dd3af00f9e236d7e611ea', '5.175.234.59', 1755840385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('76277ed03225fdcc10f95cba7f926796b0683d37', '5.175.234.59', 1755840386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338363b),
('643ba94407a2fd28cad56060f5feabc1629ae13d', '5.175.234.59', 1755840387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9c44aadae94652d6922b232b44d7cf36e1832397', '5.175.234.59', 1755840388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338383b),
('f4c99bc75155540a38029e03ad10bab470887cf1', '5.175.234.59', 1755840388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1955109328b69036a8698791826f7542166806a7', '5.175.234.59', 1755840389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338393b),
('fc5e9a7452642a88f948cd7e334faf99eac5bb9d', '5.175.234.59', 1755840389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303338393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45cfd71b70edb932b7e48f561eaa20bb57df6e8e', '5.175.234.59', 1755840390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339303b),
('ea0df62a538e98670b0055d33214f59ddd70a7ea', '5.175.234.59', 1755840391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ffb1ad30d11300143a4752474b7124b4de7889d3', '5.175.234.59', 1755840391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339313b),
('7524f8732718baf8d8a1bab26e32dce00a5f844a', '5.175.234.59', 1755840392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1c78ea7fa5c3d73f74cb5d04e31edbcfcd57f756', '5.175.234.59', 1755840392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339323b),
('1c2982b6dd254df299ef525cba267790297a1f00', '5.175.234.59', 1755840393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339333b7265717565737465645f706167657c733a353a2261646d696e223b),
('9b64644df76e16eb6c7d1cf738e7c7ce926b6f94', '5.175.234.59', 1755840393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339333b),
('eaafa149ecb81b946ff023fc7c12366115d6f93e', '5.175.234.59', 1755840394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c4d53d1cfe1d8255f6005ca09e12c79627c5ba36', '5.175.234.59', 1755840394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339343b),
('6e1740aef7fedfab90caaeea4582910606cfb91d', '5.175.234.59', 1755840395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('588a2df1e2e8c5792215629fa2d7b8a55749311b', '5.175.234.59', 1755840395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339353b),
('a56576a71bb838d849dfe0af4e780dfb2a5bae22', '5.175.234.59', 1755840396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4ada62d46b91975e6237e4ecc24571794ffe8f76', '5.175.234.59', 1755840396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339363b),
('c9841f2e90776f1d9df9a9738f86b1be306cffbd', '5.175.234.59', 1755840397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('227237aade9ae97d9298a2ead1e9a4060c22e8ba', '5.175.234.59', 1755840398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339383b),
('c71d827b621d810611b20f505481db30d623b275', '5.175.234.59', 1755840398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('af00f995d2468839843548b77aab33c16db33716', '5.175.234.59', 1755840399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303339393b),
('042adc5807d5c4cd4a89c9673e5b64efef70f646', '5.175.234.59', 1755840400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e561df777133d3b7170d89f088ca412fb38cace', '5.175.234.59', 1755840400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430303b),
('e44300a721fb49933203b210e868c163d66cfed5', '5.175.234.59', 1755840401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8207b3daeb2c3a857fd6790eb4192b53872abd9a', '5.175.234.59', 1755840401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430313b),
('75147f7e437e469c14001d969ddc7af540f28a8d', '5.175.234.59', 1755840402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21b6e36456fa24f15d80eb526e29fb2f8e98ec61', '5.175.234.59', 1755840402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430323b),
('d38855f053c5d8b11a06e88685f96670a1100fad', '5.175.234.59', 1755840403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('da0965127d295bd0f9107eaeee8744022e031529', '5.175.234.59', 1755840404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430343b),
('c10b3d26512965c3b442db10f79e5fd40714b1bd', '5.175.234.59', 1755840404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('914d960e35f13d45f1bcdf4b89edbcdbdcbe2bd7', '5.175.234.59', 1755840405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430353b),
('627233a0a894cdf34d9e6ba7f7ad7a3cbd9be590', '5.175.234.59', 1755840406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ef5761cf01a6fd9f54d93a7adaccfd0941cbd624', '5.175.234.59', 1755840406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430363b),
('a9516e6ad1f751e769c1671f6a5b27084cbf825d', '5.175.234.59', 1755840407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b995df2875ffa80f2e161db7a6e76021d3a46227', '5.175.234.59', 1755840407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430373b),
('e858b69332bd166302a49a3ed64b5a88e7659fca', '5.175.234.59', 1755840408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2e342fc6ccdc88069d78be0814754934e025b310', '5.175.234.59', 1755840409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303430393b),
('a051ebe18e7fe42a768d61c3853a5640e924bd1d', '5.175.234.59', 1755840410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('edd74297d98e9cb5ec304b3ec02cc0241e2a272d', '5.175.234.59', 1755840410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431303b),
('6b8557a22f0630e5115bee08e6aca889f3900e5a', '5.175.234.59', 1755840411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4c71bcc250f781f8c3bc8d5cb760e9f0cd99199d', '5.175.234.59', 1755840412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431323b),
('2dd6c8333236e69e2d31358e42979dd2c2b11c28', '5.175.234.59', 1755840413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('567b1692ee135d54c54e09cf1abc8369bd0f3606', '5.175.234.59', 1755840413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431333b),
('a852a9fff7b25b2ff0d9a11f59be50c06cff37ca', '5.175.234.59', 1755840414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('907e65eb118f8fd1a5dad2d68148a27c9be4e00e', '5.175.234.59', 1755840415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431353b),
('6031dde43a66162d4c4f6cf485038e2955c32dbf', '5.175.234.59', 1755840415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ae8e4dbf4355df1beecc3604764cab3644e73775', '5.175.234.59', 1755840416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431363b),
('896cada6ac16d3127f5b31342c9788716b18a210', '5.175.234.59', 1755840416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad6489a2fd7035d6d045fabd13526a2ff1840bf8', '5.175.234.59', 1755840417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431373b),
('f7062882c40c128ddb76f1fdba3e8aa5ea199fb9', '5.175.234.59', 1755840418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('662c6c4504f93ef9fb024898dafd2e2b6fdc6fe9', '5.175.234.59', 1755840418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431383b),
('c34c15ff01a887ec69c47d40ea266056ed748177', '5.175.234.59', 1755840419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303431393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b9a8ea4ba9aa3d16ec89c4f808c1489a0bba5c6d', '5.175.234.59', 1755840420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432303b),
('e152d5304fb12cd0fc8f0db17dd7d4c507c8e0f8', '5.175.234.59', 1755840421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('43079c59425bba88ab0d25682d8a651c9bb90b12', '5.175.234.59', 1755840423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432333b),
('dbb79bcf03336009a4669107fdfbc82b286d84a4', '5.175.234.59', 1755840424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb00340b70004b2992ebfab5b1ad0d6551c1a01f', '5.175.234.59', 1755840424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432343b),
('a5c6bfe37ec578b9fe97f5c785ae247ffc673bd3', '5.175.234.59', 1755840425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ad3e126eb2a81e99ced6ed4b48076183118864f', '5.175.234.59', 1755840426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432363b),
('d80e43761c3c898cfe64c641342416e0840205f8', '5.175.234.59', 1755840427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('433ce6188be0a7e57696e1dc1c2f9b447a351e83', '5.175.234.59', 1755840427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432373b),
('4d50b202b644b2fa4342ceef04a6d97d2bc00f49', '5.175.234.59', 1755840428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c85d4e56792d24ac1bf362b5a498b8da94405d1c', '5.175.234.59', 1755840429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432393b),
('bef70050c8e0fee1b0bd2023a88a1e0daa63ef6e', '5.175.234.59', 1755840429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303432393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bea32050b257d1bf6a131222b7f7252a28ba51fc', '5.175.234.59', 1755840430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433303b),
('b13ab88b00c6231f6b1b3a61c1d0e6d1c6e0c5ad', '5.175.234.59', 1755840430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('55a876ac608a3cd5048d14527ad1828f71dbfe61', '5.175.234.59', 1755840431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433313b),
('03cd9f5bf682549a1a9f6f011f2c93a0e77b26fe', '5.175.234.59', 1755840432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ab49f54218dfb89b61393f76cfc0992d1e0c7792', '5.175.234.59', 1755840433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433333b),
('4329c2801d15d7cbdf45dabcdacf90957b241f32', '5.175.234.59', 1755840433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('721b7fc36b9f14489ae6e7eca2c3370836cc43a9', '5.175.234.59', 1755840434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433343b),
('6cb47e0a2154c8dcc81c1b91e8503d0ba7e4bfc8', '5.175.234.59', 1755840436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8d4641dbbd72cef7e7c077be864432d298ea6ba2', '5.175.234.59', 1755840437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433363b),
('f818b605f43b50d14fd317cb76804c1ab1188f06', '5.175.234.59', 1755840437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('85594008e685164888d961c74cf615bb4a0fc3f9', '5.175.234.59', 1755840438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433383b),
('30169949bd3c95d80c743f0aab3fe490ef187a92', '5.175.234.59', 1755840440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303433393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1072d618eaf88c1c3d9f8409add3a8a377153313', '5.175.234.59', 1755840441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303434303b),
('18a6b66432dfa4de2ff1536810ced0cb83e61d5c', '5.175.234.59', 1755840441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303434313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('27d2d15c42335491b214884a68b1acec51861805', '5.175.234.59', 1755840442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303434323b),
('2fdfb1fec63b7091bf682e2dba22f345fa9867c3', '50.6.197.32', 1755840667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834303636373b),
('2cba591216c6e7d2738319e645149c0f159ef6a9', '4.227.36.106', 1755841673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834313637333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f71730a66f42cb9da098eeebe2629aa39a2d5532', '4.227.36.106', 1755841674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834313637333b),
('6395daca7ec83114ae30235bf98b96622ed62c4e', '50.6.197.32', 1755842523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834323532333b),
('1a423e68a33cf898202d4543a0902b36774d13ad', '4.227.36.106', 1755843655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834333635343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('061e279524e752af49344b4591696f0b400d0699', '4.227.36.106', 1755843656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834333635363b),
('957d42ad1d848162c00ba742734c3c609d01b343', '50.6.197.32', 1755844266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834343236363b),
('f59b2a2b4b8bcf761fc179409b741544103a879f', '50.6.197.32', 1755846123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363132333b),
('1868804838b12e665c70ccf519625bd26dfb0620', '195.178.110.68', 1755846326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363332363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a0898c84e41893da9ee5a38538e420a17530afe3', '195.178.110.68', 1755846327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('be04ba26ef11cb77ebb74099258c084df0517751', '195.178.110.68', 1755846327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8856a95b6510e468387c57a349da46e8592dc279', '195.178.110.68', 1755846328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363332383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('631254485adac7178c6dc064e7a2b8b3ff0de7ea', '195.178.110.68', 1755846329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363332393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('302927d6c4aa6458021136277bfd71722998a9bd', '195.178.110.68', 1755846330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('61a10357a480d54dad72a6350e506b2958aed351', '195.178.110.68', 1755846331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e2ee5391258ed4e4827a11b320ff3a970b75d831', '195.178.110.68', 1755846332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('edbbff138f2680d2fd5e2b8f788ce2db7ea09e76', '195.178.110.68', 1755846333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('884f6357112d5d61b1ca52c67c656ba17308cf5c', '195.178.110.68', 1755846333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c724559d45bb3dcab04001d39d10d61e7ec8f179', '195.178.110.68', 1755846336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7efaa6be166d621caed7537072bacde1df18b78d', '195.178.110.68', 1755846337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0987909b3e61646babd66d6bbc375286cc17d03c', '195.178.110.68', 1755846337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ed5605494f7607ecbc15dc516225cf80ef9679f3', '195.178.110.68', 1755846338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834363333383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('674b5d61fd92e39ec1d0f58a8bbe99196689d117', '50.6.197.32', 1755847866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834373836363b),
('b4d925582b12b5a9be0dc9e6632da5c10844093e', '4.227.36.106', 1755848144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834383134343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('847912ed8b317a576b7e55ef327b07c641b7e21e', '4.227.36.106', 1755848144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834383134343b),
('e0f438e70e3e1b20b374f2238fa4ebbf43685817', '87.251.78.131', 1755849469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834393436393b),
('cde2b1e5e49c4e282db31cf25ee56379fe60df1e', '41.59.8.94', 1755849625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834393632353b),
('8ec1cd08ee71fba1e08ee81ede4913475c7b53ef', '50.6.197.32', 1755849720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353834393732303b),
('d1114289b79ff41df8dd4db28d7bc438413cc619', '45.139.104.199', 1755851300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835313330303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6e971ca4467839d0532d7ba435fe91f16f38b3c4', '50.6.197.32', 1755851468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835313436383b),
('6702549a1cb72bb6ca96192591b7381039ded912', '50.6.197.32', 1755853309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835333330383b),
('f15b44de43bb7eca92137c6e8956781837cde923', '4.227.36.106', 1755853945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835333934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dea69c9abdb5eb56210871e31eeba3eaf870088b', '4.227.36.106', 1755853945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835333934353b),
('0969595e499ad2d9dec9b5ad73b41c883c98f782', '50.6.197.32', 1755855067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835353036373b),
('b909deebd90a80f6a1bc15e4a340db4010555c69', '50.6.197.32', 1755856925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835363932353b),
('672f776a5dc2483010dc608c0ddba596c99a32d6', '4.227.36.106', 1755858410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835383431303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d4723c4d647108f6fdd8dbba274f92b79ae52ccc', '4.227.36.106', 1755858411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835383431303b),
('7e9c3d8e5c9bf194fd9d00d557306796820e87e9', '50.6.197.32', 1755858668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835383636383b),
('eefc226340a15840716a4411c16a166474a84fbb', '147.185.132.118', 1755859660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353835393636303b),
('f1f8b4d42929f76c435bcd89a0448761f8c84539', '41.59.159.143', 1755860416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303431363b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373734373131223b6c6173745f69707c733a31323a2234312e35392e3137382e3634223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3fdafea702d405d709b043d77fdf7a9faf232430', '161.97.131.194', 1755860419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303431393b),
('e47b1da3e90d319dec3cc6adbb34cd9d4ef7d28b', '161.97.131.194', 1755860420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303432303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bfb61feb0336b55867e9a99c17d87e870ff949e9', '161.97.131.194', 1755860421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303432313b),
('adcc55e91841863ec6042c5fd1b6c01492295164', '41.59.159.143', 1755860425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303431363b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373734373131223b6c6173745f69707c733a31323a2234312e35392e3137382e3634223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('421fb4e6a6b0a389df7935d06d07480ae870b362', '50.6.197.32', 1755860525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836303532353b),
('3f95ee8450c347a06d251d9ec7b8b0c6c6ccf17c', '50.6.197.32', 1755862270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836323236393b),
('73e5f6821c111c24b5bedc022531715e3011ae3e', '50.6.197.32', 1755864120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836343132303b),
('a89d8f288b5a43f165bcf1c3b4f1848d022803db', '50.6.197.32', 1755865871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836353837313b),
('8482e2e3f9874fe0809280a14e1b39d10dba2157', '50.6.197.32', 1755867721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836373732313b),
('85169a09254cb39f2f3111d8c15f2fae80310923', '50.6.197.32', 1755869470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353836393437303b),
('ceb68a32a8ec1a6d70c303d5275faf6e5b681c96', '50.6.197.32', 1755871309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837313330393b),
('2d1b9cd14909e45567dbedd50e1a9b76537b523c', '50.6.197.32', 1755873072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837333037323b),
('e427290c932b1c6f4bcbf61b86fff15ba1bcfa95', '64.225.59.26', 1755874116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837343131363b),
('7b82159d9c18ac27f5e376179af2889d1f213b44', '64.225.59.26', 1755874117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837343131373b),
('bb598d43122b3217305959a3d0e20289f131a280', '50.6.197.32', 1755874923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837343932333b),
('b69a0cd78dd8b5f669d87568c62982c760e8ddeb', '45.148.10.80', 1755875447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353434363b),
('e047a0432170d187797ce6b35fec5d5732753858', '205.210.31.109', 1755875477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353437373b),
('b36bf228d952fd8a187080f813ffd6e7bfd51488', '45.148.10.80', 1755875739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353733393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a950ef72e89f2ddeeaa69f03fa204d07361d5d78', '45.148.10.80', 1755875741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353734313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d68f0785354a349673fff323432065c223e3c906', '45.148.10.80', 1755875743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353734333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('205ba8c83db84581f09adcbbeec20a19ab089d7d', '45.148.10.80', 1755875743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837353734333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7e689bab662f9afd0bc9fe7078d8547fb647daf8', '50.6.197.32', 1755876672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837363637323b),
('c563925c096b266fcc47e99c3f963d9bccb3834c', '50.6.197.32', 1755878515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353837383531353b),
('310267c1c2f28cf389e4985cb3df0c8656afe8d3', '50.6.197.32', 1755880272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838303237323b),
('8928e5ea19890828f4185362748ba52852c7fcd5', '50.6.197.32', 1755882122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838323132323b),
('c4fb305fc1074cc17a63f0b1a50298d485197b09', '4.227.36.106', 1755882329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838323332393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a1dbc46c9d7d69463458ac7c84698d395f2a9049', '4.227.36.106', 1755882330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838323333303b),
('93852898f0f8cf443a22ffba5faa8fa21d280035', '50.6.197.32', 1755883873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838333837323b),
('c8b2c8b659e3d6d66aebfb169cbcdf701601f4c0', '50.6.197.32', 1755885723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838353732323b),
('6f08cd8cee87e366c1b409a186a3525a5f007478', '4.227.36.106', 1755886223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838363232333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e9261d7c5a7d07f1498327f470e22ebeba36fc7c', '4.227.36.106', 1755886224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838363232343b),
('d586767cfb126a626699d6166d2e0f154b04b9b0', '50.6.197.32', 1755887473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838373437333b),
('3b9980c04b56b540561d0ad550631e96721f5992', '50.6.197.32', 1755889318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353838393331383b),
('68abc102802830bfe1947ec84cc1ce4657880025', '198.235.24.130', 1755890642, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839303634323b),
('fd22395da0c1d41641cb27c28d516861e6e5087e', '50.6.197.32', 1755891073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839313037333b),
('00cccf074520fa85b6af97a984776f370c888acb', '41.59.133.236', 1755891367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839313336373b),
('4ce4a983500a644015bcf69b4298c5127b21a219', '50.6.197.32', 1755892939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839323933383b),
('b636cc8cc98095c18cf51ffae1c94f4272ad1a07', '50.6.197.32', 1755894675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839343637343b),
('df53c11b9275c7a7f17d67e9ca6db514fd68a8eb', '50.6.197.32', 1755896513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839363531323b),
('7c62390add5a462e81218b9f56529c6c8d228733', '50.6.197.32', 1755898276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839383237363b),
('8a6bf6adcdd9e1f091c1084cf322442872f4d220', '194.50.16.252', 1755899782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353839393738323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('97305d5445c234010a2ffc0cea496bb29d50a2fe', '50.6.197.32', 1755900117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930303131363b),
('cc117068d340a8e0abe3ad8ee9812a97a406f2d1', '50.6.197.32', 1755901875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930313837353b),
('17051728c97b61f05cd23224f3d2008cad407238', '5.175.234.59', 1755902759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323735393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad94262327cfbeed6e46948b9b97fa1cf012c8ee', '5.175.234.59', 1755902760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736303b),
('3be0f18648fdae5b536e83b5dc76141ed6b5bb48', '5.175.234.59', 1755902761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('610e695afe141cd4fa70713371a90cd899b682d4', '5.175.234.59', 1755902761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736313b),
('1fcaf254b613e2ff8d53e513282fe3f9e73ed49a', '5.175.234.59', 1755902762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('36375c074c560f2cd5d290d2e577970ef6caa15e', '5.175.234.59', 1755902763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736323b),
('fc02f2d591871957864ffce265ce6b3b8d3610a4', '5.175.234.59', 1755902764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e4664f1b4fdb98b62c0bfe91bbe2e7cdb7990542', '5.175.234.59', 1755902765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736343b),
('6478b0d03eb0f6e50cd123699285e1fdfb10e91c', '5.175.234.59', 1755902765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('011eabbf0039ee773567e465035d4083815466a7', '5.175.234.59', 1755902765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736353b),
('43c15ec763fffb6007d2104dd81486c682d6f8b5', '5.175.234.59', 1755902766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ef347ed8e6bbee952a2211d6eeafcc403060ee9f', '5.175.234.59', 1755902767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736373b),
('235198a2fcdaff85513bf9a86a69c98fa4464646', '5.175.234.59', 1755902767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('16ddda9c2ac6c4e89a89a83e289c64d9ea5e294a', '5.175.234.59', 1755902768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736373b),
('4a4179dd46cbca90eff3eb7496bc075c1efe2718', '5.175.234.59', 1755902768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('22a4702d7d0db48fa1d37df541eea81d7ba5074f', '5.175.234.59', 1755902769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323736393b),
('177efb65dd2e93eabce054184f7a94efa597c9aa', '5.175.234.59', 1755902770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a1f9322846add05bc477897319516e548eb6ef30', '5.175.234.59', 1755902770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737303b),
('927f9abbfb6151e2ad81d0eb5ac29d417cc142eb', '5.175.234.59', 1755902771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('299c8e1e9db75614948784116919e896568be8d2', '5.175.234.59', 1755902772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737323b),
('2474ff9d5641b635c6d64b96755088b0380662a7', '5.175.234.59', 1755902773, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a97dbcd2b6a5195f33ca26c8f132e103c41982d5', '5.175.234.59', 1755902773, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737333b),
('e3ef1d85705c36875f19ac92bf1eee366ac66c03', '5.175.234.59', 1755902774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('de42c740346c7ad5615d3929105c747e4e711d27', '5.175.234.59', 1755902774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737343b),
('dae1f1162a0068eb9281ae6596df40ee2e4ce3ac', '5.175.234.59', 1755902775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c7298ebdd0e7168dc9d9b71857a8175e7f8ce9d9', '5.175.234.59', 1755902775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737353b),
('542d8b17dca1b85374ba936e74bba8ba373d53ce', '5.175.234.59', 1755902776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fa438b464dd9333d0ea020be7c874a75b828e921', '5.175.234.59', 1755902776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737363b),
('613d50d9c7319190bce3c5ea5a9a518dbd3007c5', '5.175.234.59', 1755902777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1c5411987216d9ba5fed26f52c192be50c44f014', '5.175.234.59', 1755902777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737373b),
('f786814f046bfcf817db34d8ffbaeb2dd6138b5e', '5.175.234.59', 1755902778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b42d4044f70fc95b2207b85814fb8fa474401a05', '5.175.234.59', 1755902779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930323737383b),
('9b0592251810dd6f48a1d2aab0cdc646529d2050', '50.6.197.32', 1755903726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930333732353b),
('c31d16f5c9ea3eeb53cf4865578c483f08c40d8c', '50.6.197.32', 1755905481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930353438303b),
('5c039e431d561b09c18855f569eda8ef2162bc69', '5.175.234.59', 1755906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363337303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6b18ffb2cda0f777db92c44f72cf0664788eacdf', '5.175.234.59', 1755906371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363337313b),
('ffc177cac1c328169818c0749cb754d1deee0b48', '5.175.234.59', 1755906372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363337323b),
('ed51b9d12ab1db29b665761779d3b67002f659c4', '4.227.36.1', 1755906504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363530343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8b42533fbe7589d939e1e7d4ee78ac52da9210ff', '4.227.36.1', 1755906505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363530353b),
('cd3893ee47e5da2476bcd07f7d9e839e1f097e3d', '20.171.207.234', 1755906506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930363530363b),
('29a47853d6789ce89e7c71cd31899ad735e9792c', '50.6.197.32', 1755907328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930373332383b),
('b82522f745203a825531e9d768d2a3691621dd85', '50.6.197.32', 1755909076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353930393037363b),
('710a08afe70b74379a39df76006aa0104f8cb167', '50.6.197.32', 1755910920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931303931393b),
('57ef66ba16b0a3cf694645e85a3497e86109f7d9', '50.6.197.32', 1755912676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931323637363b),
('2b87cce7040e31c08fd71752ad72ee09b6ca8f8f', '50.6.197.32', 1755914518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931343531383b),
('65d9d79660444f153ed03729c15d85f5049e52c6', '50.6.197.32', 1755916277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931363237363b),
('3906dcef18285c358b34cb56c70d7e9fb0a3bc9f', '50.6.197.32', 1755918124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931383132333b),
('66d672ac3ec54c0158e48e5d15e0cc06ce55a060', '50.6.197.32', 1755919877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353931393837363b),
('d1c37e21318cad67618e559acd74d6f8fa8b5844', '50.6.197.32', 1755921718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932313731383b),
('65877cd2bdfc6cc20c4a9e5c736b013627ca2089', '50.6.197.32', 1755923478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932333437373b),
('ce4cb1ae14b3ad8ed72022fcbcb8adf6b5b440db', '50.6.197.32', 1755925321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932353332303b),
('b5c03cc29d473c14d51d9334f854fa939a0e51f8', '50.6.197.32', 1755927078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932373037383b),
('c43c9d92a7d704b18336cd7ab433887f0e201564', '50.6.197.32', 1755928920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932383932303b),
('efbe6c8d57a9f0ab4d3410a59c3cd0ba15deff5e', '45.141.233.208', 1755929253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932393235333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0237b144885f536bcfb7798d2e55bfe66cc6b9f4', '45.141.233.208', 1755929254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353932393235343b),
('29e4d7993cdfe52d56aa74022e6decbde95fa698', '50.6.197.32', 1755930679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933303637393b),
('ee865d2758c4e6c1c9794acb57377529b66ffbd7', '50.6.197.32', 1755932517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933323531373b),
('c163232471b4a1feb5ccf0f660251016ea819fd1', '50.6.197.32', 1755934280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933343238303b),
('8b089036db1188dd419d6a19c59166da5a8767e4', '50.6.197.32', 1755936130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933363132393b),
('3e3f16eead19687e2cb8f2c79d5948ffb0842ab3', '50.6.197.32', 1755937882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933373838323b),
('0049e2472aa2663feb9044518e3dcef7c7096a90', '50.6.197.32', 1755939725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933393732353b),
('843c1abeab6ed7fa014486621d498d6004387b30', '45.139.104.199', 1755939934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353933393933343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e2e2682798fca4b8c8156e04604ea744e519b41', '50.6.197.32', 1755941481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934313438303b),
('ad3414f7f5bb600ac0687974fdc8456e6d4f2df9', '50.6.197.32', 1755943338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934333333383b),
('a7ddb914f66dd809bd8869b9d0f4afdcd647922c', '197.250.136.217', 1755944526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934343532363b),
('b2bb6eef775d84ce937c5e94ac19347e75a81387', '50.6.197.32', 1755945082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934353038323b),
('60999dafd566f56aa517e23e5ca655f7d76e54bc', '50.6.197.32', 1755946931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934363933303b),
('ed45ef46482402e1c2347810d0b50e018c580907', '50.6.197.32', 1755948681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353934383638313b),
('fc84c986f0e50b6aebb5c48e764503795fc7289c', '50.6.197.32', 1755950536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935303533353b),
('0a9c8f2ca9992221b77a0f5dc46fc17576582323', '197.250.136.217', 1755952105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935323130343b),
('e5f4afdf9a56f5c9e565625d75c1736a686bdeaa', '66.249.93.72', 1755952109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935323130393b),
('13328e08647b6223ccefa9728dcc39c3288b8ab3', '66.102.8.132', 1755952111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935323131303b),
('7bdad2886dacad7b9ce441ae04eb73d138139421', '66.249.88.229', 1755952111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935323131303b),
('17d6b409744935a8480148e16721f78c3539f490', '50.6.197.32', 1755952282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935323238323b),
('4f1489de6714c05a24f2d6d6e6116bf10ed800e0', '50.6.197.32', 1755954140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935343133393b),
('f6d7d73d341d8ee3cac1ee031f12f214509cc012', '50.6.197.32', 1755955884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935353838343b),
('ffc95025e855c56265d1f90d416631f069333171', '45.139.104.199', 1755957226, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935373232363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e0e31432f9bc35057206935bfbd8620d9a39caeb', '50.6.197.32', 1755957727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935373732373b),
('0d807f621ce1f24ef1907c163fb399d2b37f50a7', '50.6.197.32', 1755959484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353935393438343b),
('5127cfcd357237d577bd6f397a14751bd44111de', '50.6.197.32', 1755961332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936313333313b),
('814f6f2553da7a72e5abda06478603e5210b36a3', '192.64.113.146', 1755961982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936313938313b),
('5886d906aa98c9fc1c7663cd4f3068e8f5c29ddf', '192.64.113.146', 1755961984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936313938343b),
('e2a25b3d95e4a94d70e595d825a0083018d4e111', '50.6.197.32', 1755963083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936333038333b),
('5f6bbc4eb9a1637586327b5e208e936cc4549fe8', '50.6.197.32', 1755964923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936343932333b),
('10a4b79709f0d595f8c99bafd315e3e779d9332d', '50.6.197.32', 1755966686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936363638353b),
('cdc467eccd762bb15711d97b02690039d1fbe377', '50.6.197.32', 1755968527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353936383532373b),
('ecc9675ff6703737892cfdbb18a9712d7a08e480', '50.6.197.32', 1755970285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937303238353b),
('b846a9ca4d6565ca3337f003e2c8ec81eac0bd07', '50.6.197.32', 1755972131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937323133303b),
('526c49d13a452876e6b8d4ee99b6a25616080958', '196.251.69.222', 1755973850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937333835303b),
('415d804195f4926cdfe81599133e629918238e98', '196.251.69.222', 1755973851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937333835313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4c4f6f4e0c492b4a3c5f7bdf56606054f33a153f', '196.251.69.222', 1755973851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937333835313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4c413179c839c3eca374b63ec6132bcf0cf11bbc', '50.6.197.32', 1755973886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937333838363b),
('5536dd4cf486ff484ed4b01d4a2d22b1025083cc', '50.6.197.32', 1755975731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937353733313b),
('6965b7acbc554388657f25c6e6ea57524b5dea13', '50.6.197.32', 1755977484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937373438343b),
('c102ee5e2a8188809cdbd702de94c74514d83553', '206.168.34.112', 1755978166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383136363b),
('3ceb57d9308d024ffbc58596b914325edd1cda22', '206.168.34.112', 1755978176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383137363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4ca508998e32f6e6aa9e29ac9a021183d7de9d2d', '206.168.34.112', 1755978179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383137383b),
('3a7fce82266a81052ebbec22b5f96cadaf338196', '206.168.34.112', 1755978192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383139323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('968c0252a1515f2a7b0589852e5904b475f65e4a', '206.168.34.112', 1755978196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383139353b),
('d62bb09e621ddaa3071987d4e13820eb2b33d674', '206.168.34.112', 1755978210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937383231303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('356c450321d4eb6fe0588c9cc910657e37e62a9e', '50.6.197.32', 1755979345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353937393334353b),
('4a6cd97d789ddb646c34f26680ea43235d7297e1', '50.6.197.32', 1755981085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938313038353b),
('442efdea7de61b443d1b95070bc022c2d3d906ed', '50.6.197.32', 1755982921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938323932313b),
('e28bad153327a9fa4065e5616abe4bc8a9590a45', '50.6.197.32', 1755984686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938343638363b),
('071849cf39efc7677145aa3e8c1ed0862a8103d2', '50.6.197.32', 1755986541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938363534303b),
('57a577642d8b57b8622af62e445d748342c9c784', '50.6.197.32', 1755988289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938383238383b),
('211631547498db419942cf982721bcc1daaa56c5', '106.54.4.79', 1755988781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938383738313b),
('c0ec63fb38b8229776d75812126c5b0de58ebab9', '45.139.104.199', 1755989581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353938393538313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ce96e6c065a6517e3da41d6388a4fbfbdb9c2e0d', '50.6.197.32', 1755990146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939303134363b),
('c77ca0086bfa41230d809e7ef1887e5c3af48a78', '50.6.197.32', 1755991887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939313838373b),
('cf8409a2c9de665f8847a1b8cc71e1dd5359f0fd', '50.6.197.32', 1755993744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939333734343b),
('42ab857e216cf1b869b9869eb24b24b1c6e4d716', '50.6.197.32', 1755995487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939353438373b),
('96bc072ec3ebee52e72101fda27b253d2b2ae381', '50.6.197.32', 1755997345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939373334343b),
('c92b502429af93fbaaa1db28d1f1b661ddd80932', '50.6.197.32', 1755999089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735353939393038383b),
('50528a47b22ede3d3a93cd70f5bd617b5646670d', '50.6.197.32', 1756000944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030303934343b),
('6b1fa169cfedf45d3b98abd03a8fbdff2c2765a3', '198.235.24.68', 1756002683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030323638333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3138a4ee7aacc5a593f680edbb05a345fc562a6c', '198.235.24.68', 1756002684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030323638333b),
('42c762fcae7f72e9f8001458ab920f60c5bd9f84', '50.6.197.32', 1756002689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030323638393b),
('fa596533d259b8f08bc5162aa3bfdaf412537a17', '50.6.197.32', 1756004526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030343532363b),
('bf96e2e3bdfebef07fd2e84d5dc461e435d24752', '50.6.197.32', 1756006289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363238393b),
('425047e80060bf898adfdb417314e0f3be4d73e5', '54.169.175.155', 1756006943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c07145d356da5d4c9294a3cd5a3a33f19ac119c5', '54.169.175.155', 1756006943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('67fa005dc3140a6842e37555726ca03240f00d06', '54.169.175.155', 1756006943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a87137e743974e9d25757d6bc1730aa64e530d0b', '54.169.175.155', 1756006943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d3492ecd3aa950a1bb30d2a68b35f7d1c8b117a4', '54.169.175.155', 1756006943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58766f6da5687ffd834d95e2b0aa5f3ccf05e7fb', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f500664b4e6caa8433ab5de139c91906be8f1f1d', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('84fa0ba2c0c44ab325be7a799a3f57559da38d05', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('db695beb632de209eff59eaf5f3ec31a2e9784f0', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a148b6f83a505d42c95bcb9721736f250923b709', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('10458aba6635758c70036edd91188cf707948827', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3108cfc033c9a0cb6822c96cb54b36baa835cb43', '54.169.175.155', 1756006944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d4a0e6f892d7998a067368c92af7f78270cef3fb', '54.169.175.155', 1756006946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45ca78bee36b42a20ac241775e94f951693649eb', '54.169.175.155', 1756006947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('33689ed3b89be4703048dd8525b13d15f92c5aaf', '54.169.175.155', 1756006947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b850b7186c5d2a9e1c03d5c8d157c68ae3dcc916', '54.169.175.155', 1756006947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b8eeb13e0a2b5de8394cb159fd387a8bd02442ce', '54.169.175.155', 1756006947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('87a1a22b20baf2eaf9c5e70ed21f56fcc5828904', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2bd4d4ed59b5fd579cea73b728f3ec47e3a64fdf', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4a8642988998196f67e9456a1a5daca353bb3385', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('068afa05711301f17ee579ec0b654dbf21950970', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5b918cf4f0ab3f0326a75f9f6b396c3580db582a', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('020df09b71418c9d9a19a942503ac293850c222a', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ca918331ab4b789236c6c9fde0221906d675ad4', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('061e3c72d003d5f341ad87a3b9f56694a46f40f1', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b9f7042d0532a209c2c23d1d74821cf93d3d3b25', '54.169.175.155', 1756006948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('499021136cb4314b62f25f45db78bcc63b0a1bf7', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('26cd1b48636020d1405c389f1dd6758a39873c49', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d6d171d53a8941ffc4e69e9cc6ce735cc8ac7fb5', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('08c70ed17412afa2cc7cfce84f0bc810c3ebe23b', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('93b5d5f53fa41a3a310661b425bb184c2f0474dc', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f8e10f1cc259e9dacf1239408208bbb8b44e7c7a', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e1945fe7f7c0f0d9086e0661f19346a55e060b1f', '54.169.175.155', 1756006949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030363934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7f2384fcfa698db3c73d010036d3343fadedaf7b', '205.210.31.132', 1756007584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030373538343b),
('4fdc2ccd0b210bc2848f186e88d77fe22cd01757', '50.6.197.32', 1756008123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030383132333b),
('b84256f5d9108ed05a27a6b1f117e90e4fde19de', '50.6.197.32', 1756009890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363030393839303b),
('0eae8d8de477ad0e104e33396dc17c0987014789', '34.72.33.163', 1756011739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031313733333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b),
('3438baca3f72708def0c473a7ffee268677ad32f', '50.6.197.32', 1756011733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031313733333b),
('a11e5962d2aad3becc93a4afcc101298841bb7fe', '35.204.16.32', 1756011913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031313931333b),
('6bc879fb2b2bd092401f9e975d92adec5b80baef', '4.227.36.67', 1756012648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031323634383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('499e4f67ebf7567cba33d9ee7657fa16bc073160', '4.227.36.67', 1756012648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031323634383b),
('078ea24e8f423bda373c15c23cf4d31e0281cd1c', '4.227.36.67', 1756013319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031333331393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c23805ffd0dc365959d7fb27830d5ebbb70c3b7c', '4.227.36.67', 1756013321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031333332303b),
('19196093015fb63ed06bc0448cc86880240d3b5a', '50.6.197.32', 1756013491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031333439313b),
('7a8af2a927ab103ac8e090ac31c22d0d50fae1fa', '50.6.197.32', 1756015339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031353333383b),
('7253a6e03af5a4efc952812f75ce781de2ebc1da', '4.227.36.67', 1756015450, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031353435303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cba4cedde2279bb52ad066e9aceb9ba3e9dacc11', '4.227.36.67', 1756015451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031353435303b),
('2e068c0dd4b7506dc14dba36733e362b45ca0198', '50.6.197.32', 1756017090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031373039303b),
('cf3f70441becb2efa8b99e2a9ad798421178d736', '50.6.197.32', 1756018928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031383932383b),
('2611de81d1223a5a96fa01055082a40881ccc90d', '198.235.24.162', 1756019184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031393138343b),
('e8e2196a9c400fc3011c1bf3ac3c0250d836b5b3', '4.227.36.67', 1756019483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031393438333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d4e694e0add3b60f6521149c16fc27a4b19d58d', '4.227.36.67', 1756019484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363031393438333b),
('79c06af46b16594a86e0915f5cb619f33ba699f8', '50.6.197.32', 1756020691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032303639313b),
('206568dc0b1cd8d365efd82b594421b9e2b112a9', '50.6.197.32', 1756022548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032323534383b),
('f520039165a99ba07a8755109b4731e9a84fce7a', '198.235.24.6', 1756023486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032333438363b),
('731e9e1fd27c3c6d5e2872fc3384517744929005', '50.6.197.32', 1756024292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032343239323b),
('1842a0250790272a63dacb474806b849e8ab1201', '4.227.36.67', 1756024578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032343537383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5206ed14d27d29a1d8b07cf024b7869746f66ff7', '4.227.36.67', 1756024578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032343537383b),
('592d9afcd7431b7c71fb32546a8c54a2410afbf5', '50.6.197.32', 1756026133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032363133333b),
('08271eac74bca486ac4182dc6fb921982521e100', '50.6.197.32', 1756027891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032373839313b),
('c7b1c34cc3830f676afb3ea223a499bf9bf392ca', '50.6.197.32', 1756029749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363032393734383b),
('10ebe4a7ac57f793679f6185ca41af6d61f3364c', '50.6.197.32', 1756031493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033313439333b),
('59b476ca970a117cf642caa9793fbdf4df81c6fc', '50.6.197.32', 1756033330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033333333303b),
('1531245deab5731c13ee1bd1afb8a76b23bfea32', '4.227.36.67', 1756033488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033333438383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('66aab2cc188784ccfa61740ea9ee9c464b096493', '4.227.36.67', 1756033489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033333438393b),
('c1f97e0973b6b3eb210575c1f9dc218e664c2ecc', '198.235.24.31', 1756033607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033333630373b),
('269cd965bceca04d03c045b15b69cafa0f5ccb96', '50.6.197.32', 1756035094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033353039343b),
('10b76dc116a9188722a89ea653bca9f0616dfea4', '54.169.175.155', 1756036327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a0c85634001663143da41e354f28e4a7fbbfe149', '54.169.175.155', 1756036327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('35cd7e8273f05ed78fe2186bdce3929ce9b7dde3', '54.169.175.155', 1756036327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('566d23829665a01b76741315f32ef1a184ecedc1', '54.169.175.155', 1756036327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2f3ef7471dbfb9c04350d6dac593d194cfa62e48', '54.169.175.155', 1756036327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d05f08cc6de6bf14f2791e6200e4092391f3995f', '54.169.175.155', 1756036328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3fe4add55d95492c08851416b79beb2892d356f6', '54.169.175.155', 1756036328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c5dadae6953f4a38766f34f2f4434e5bca3b0ebe', '54.169.175.155', 1756036328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9796fc37923066d1e1b72dc96d530df226335b63', '54.169.175.155', 1756036328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('078d99956d77cc18f36823a984a7075856a77839', '54.169.175.155', 1756036328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('926c21f5ffa344859c333e18bef5c7437dc698cc', '54.169.175.155', 1756036329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('005ae591dcb0b6d698282c4e004f719c705b9ef2', '54.169.175.155', 1756036330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f7dee27b89ad23ff4c5c2b186b1ac4c38ae63069', '54.169.175.155', 1756036330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363332393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9b6a8afa94c32803551f73aab529778c5b150e7a', '54.169.175.155', 1756036331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('108c2587dc19087d0a7a09480250091a11deb8ba', '54.169.175.155', 1756036331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8c49c8a755924caba10699c6ff8eed576f85a5ea', '54.169.175.155', 1756036331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4e712b61c1b886c8c7da09862b7531465d529b56', '54.169.175.155', 1756036332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ea171c091a5eb17202bd1751a9f4fdd3a416962f', '54.169.175.155', 1756036332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('460dec455a6efbf1cc0adce9e0cd455f153c227a', '54.169.175.155', 1756036332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e1d9e67169d7e310747e4cfb334cd8d4cdce29f2', '54.169.175.155', 1756036332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('909cfffaf2e0b4ebb379dfbfa03573a7369f0bfd', '54.169.175.155', 1756036332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7e26d37fa54627fd267fd2719738fb219f7bba34', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('06bd39bc77f94112427bf303959499c1d32af310', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ac064a2cd266cae2cda1c9c4145b62f111f47ca6', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('73a9249d7b34258c66163a3f8d34cf50c7abe312', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ce418a7a44b8a3bb41e7f5353c4bd1cbe62da70', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3fe7e18aeed55915afbf208c9f78162402015672', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6210e03d284d6857dbb2991ceeae926661e067dd', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7074529592871e6d9268450669234ab9cb023736', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec7c09808b5df9b4d436661770681eca27f2747e', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ab59eac477fe52fade304c8563e75b8b32e224d4', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c58c25d45aa2232253deaa6e567cc5dc4c1c5c3b', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45bc85ea4cfa76ca17068bcfb2792da9391c5514', '54.169.175.155', 1756036333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363333333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('09a50805019b3db65754192b60faa7383f2073c0', '50.6.197.32', 1756036937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033363933373b),
('b6c3bb368b956510f1b8b07a89bc71ee7bcff896', '50.6.197.32', 1756038694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363033383639343b),
('1252514cc6a014da9dd5e3c0980e8e0ae463b22c', '50.6.197.32', 1756040533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034303533323b),
('12c4b842ec8e648b74d55370f9b4bf33de785fd1', '50.6.197.32', 1756042294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034323239343b),
('45b64ac60d5e6138b8e887619327d1e39c370c63', '50.6.197.32', 1756044142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034343134313b),
('8a2c35d7e90955af80e126bd8ab74a00bab96475', '50.6.197.32', 1756045900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034353839393b),
('8bec826effb56656f7b4eb99e1ea047febe23a3a', '89.46.107.133', 1756046156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034363135363b),
('e009db7eaadee76bce8c4e034885a13ca6ec51a1', '50.6.197.32', 1756047736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373733363b),
('ac251b3aef0915dce70cf618e25b7cda46a9765e', '146.70.112.172', 1756047906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a68fe3100403db85d579f73280aa63055bd32256', '146.70.112.172', 1756047906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bceb3f99a3afab862fd5595903422b5115fe28a3', '146.70.112.172', 1756047907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('da1b85f4cc430ea0b72796985a40941a1e114b75', '146.70.112.172', 1756047907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('37515d356b3097664df87e013ffa972a71deb927', '146.70.112.172', 1756047908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('68b77af9469e65f9aab8ba21ff4b9d145ee647e3', '146.70.112.172', 1756047909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373930393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5ae53d30f2c17233558d79402f54daa58cd74f0c', '146.70.112.172', 1756047910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('da685c80994e23c0a711ce03a4a10f7a80bc5ad2', '146.70.112.172', 1756047910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a549094a5b6ec487216cbba529fe227442c4bc86', '146.70.112.172', 1756047911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5d8f1cf28a653d8eb599b74ad958b6bc0bb880da', '146.70.112.172', 1756047912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('34d5a1c949cc0c4e9de41cdfbb5dbbd6ead8a204', '146.70.112.172', 1756047913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7b15a810b4b6c313be0568cfbf388a28f31dd923', '146.70.112.172', 1756047913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2cb4c69b9eb464d8f228057020c7e66568993aa5', '146.70.112.172', 1756047914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8d5e631879c7e63aca5282438e66e510d3c6edf1', '146.70.112.172', 1756047914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4ea9f7d23dd28a185c9fd832deaac1b4f0a9104e', '146.70.112.172', 1756047914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b293039879bb734c73de67c130deeb1ba7294e02', '146.70.112.172', 1756047915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cb5538409fa5b5d9b1713d54cf65e9f1f10c48b3', '146.70.112.172', 1756047916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f22c393c99669e96bfe5852d259d83569647cbcf', '146.70.112.172', 1756047916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a5cd61c3932ff9cf270f23284c39eb96853eb410', '146.70.112.172', 1756047916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('48180408abb2ca8e39e00e5fd05ffcba734cfa70', '146.70.112.172', 1756047917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c3e67bccd0702212689a561623f07a8bea2dbdea', '146.70.112.172', 1756047918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a3e098c7fab06c0e323e88361b2eb019801168b7', '146.70.112.172', 1756047918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a2b34601aeb40a7e9d37649c6f10a12e0aa79d9c', '146.70.112.172', 1756047919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d3a5eebcf8eedade04047e0d3b975bcede1ea33', '146.70.112.172', 1756047919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373931393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('49813c6b3ed34b9180dac4203b4f12cf22ffa087', '146.70.112.172', 1756047920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f7ffab556f1225e625e1f9a98e9bdd8f3142934d', '146.70.112.172', 1756047920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e1ad70856e30ad34d4b078ea19bdb73ba79c27b8', '146.70.112.172', 1756047921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8902a71b275ec2cf30906c1988d404404556e3bf', '146.70.112.172', 1756047922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5f98953d893c4b72afc49c0cedf628c7bd19e920', '146.70.112.172', 1756047922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('82feced5c9bb5f859c904e34349e6e0d472eb58c', '146.70.112.172', 1756047923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('084a1053037db9046230b6103c83604f86d6c271', '146.70.112.172', 1756047923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cabc722e3244e93b855e0e5cafcc99842e21f6dc', '146.70.112.172', 1756047924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('edb442672cd6e32c308417d7b09d696535983758', '146.70.112.172', 1756047925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a6cc0a3c4745cb7de91def07d928a81baa47653d', '146.70.112.172', 1756047925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e8781a14c2782f419e63626bfc53f0e5be1a54c0', '146.70.112.172', 1756047925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c4cfba9b31878aee70f031a4a6cea499f8db21ad', '146.70.112.172', 1756047926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('00f98151e02409bdd30b86822589d358431f0a4b', '146.70.112.172', 1756047926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ff6d24a49be4810e1aedb1f22964f700bcb08c03', '146.70.112.172', 1756047927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('25794307139f5a286c8fd51036d1daed4e67263c', '146.70.112.172', 1756047927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e94105a53eb197b81e743d00f25c1f4c4317505a', '146.70.112.172', 1756047928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('195ad2374c803ba73bf79dcdf870ea8966ae9a07', '146.70.112.172', 1756047929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7cf439e169ec4aace31f2ddb360492653b360aca', '146.70.112.172', 1756047929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373932393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ddd2fcb838c85939149831a98ac815e344c0ecc6', '146.70.112.172', 1756047930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e2d70bd717fb19e0961c6a6b5efa7d315f3d6913', '146.70.112.172', 1756047930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1a224b2a40382124ebc08d33070093e8bf60c916', '146.70.112.172', 1756047931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6da489274d18d77b55ff4b4510074742de98cf8c', '146.70.112.172', 1756047931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a8cbafca001b063371f84d165069185450bcf4b4', '146.70.112.172', 1756047932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2073071d6a40f486fd9419d160950bfbb5cce092', '146.70.112.172', 1756047932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8361269335db625d53abefba32726dac75d7053c', '146.70.112.172', 1756047933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('adce5f0397b3d88d67b8987827d867e6d057b8aa', '146.70.112.172', 1756047933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d2a9b1521f76d7d22ae7203e0655a29b79e4ddc', '146.70.112.172', 1756047934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('16ead97e6fa4973367ad1ee71641cc62155dbfd4', '146.70.112.172', 1756047934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b1dec6edc8289e696724475759cb7197782db3ca', '146.70.112.172', 1756047935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d08ed7c794b262e47eedd5239563ac818cc1ab7', '146.70.112.172', 1756047935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('94912bdfcf2b691139c8fbd1159656bc5747b52b', '146.70.112.172', 1756047936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a49f00654a7249cf4d6631d1628b7ac51f2d4bf0', '146.70.112.172', 1756047936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('31e40c2ac694afe662a23fe43652ac3776e371f7', '146.70.112.172', 1756047937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8bad2d6dd1730d5ffbee2e14894ab01334c56eb3', '146.70.112.172', 1756047937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('880ea4fbc873496d1d9c9d928b6d245b04ac6496', '146.70.112.172', 1756047938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1b0f89bafc63c5d2fe635c42941f1809d209d4ab', '146.70.112.172', 1756047938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b4ba62d47b176b2c9c19497c50e276d5ce16a706', '146.70.112.172', 1756047939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2214290e517e7d5c054c4ef971c4726b414c233d', '146.70.112.172', 1756047939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373933393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ab9c2954a05deb284943104fc1b36deb053b6a7f', '146.70.112.172', 1756047940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d8f802fe33ab47a06e92644629078e75617fcb26', '146.70.112.172', 1756047940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('be1c8c38fb9aa231526b8a01aad6b638eb15897d', '146.70.112.172', 1756047941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d8b7bcd8893f5b3b2854741c562bb28aa027cdff', '146.70.112.172', 1756047942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7d14cd5728eecffef7da2fe42e48a785001bf999', '146.70.112.172', 1756047942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cbb8efd89f5ca2cabf3822a3c1cb0402c7694db7', '146.70.112.172', 1756047943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e17c2a5c866b2b2b1049a456ec26aa7e1f24fd40', '146.70.112.172', 1756047943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6ba642d4f0e5be0035f9f30f37185d94fda2dd61', '146.70.112.172', 1756047943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('314db55b83eb3cb0841b07b0a7e59216d997ca5d', '146.70.112.172', 1756047944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0fd92ae89da4f5986b66bf823d842e56e81d1378', '146.70.112.172', 1756047945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5da1618cf15354dfa31b5e064a147f63c244afdb', '146.70.112.172', 1756047945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('211090ea5bdfd68e06153ffe6f38658f558c1d84', '146.70.112.172', 1756047946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ef6834c4bd76255ee782041655d6a9cd194bb801', '146.70.112.172', 1756047946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c49b05ba365161960d2540fa6d495ec4224ae7a5', '146.70.112.172', 1756047946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b08ce81df7d316092fb29439c3055a75251d99e9', '146.70.112.172', 1756047947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('84a95f270abba54a47b91a7da97d78a24ec81675', '146.70.112.172', 1756047947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e91d4bd40d3c35459161b52ca99e0d0aa239aca3', '146.70.112.172', 1756047948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a8506c7e6f183025e9afdee24827014be371673d', '146.70.112.172', 1756047948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7d4a030a0c89e868378252e5780373d6d20050c9', '146.70.112.172', 1756047949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3e092a7878286003b9f5296864819cb373bbb588', '146.70.112.172', 1756047949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373934393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('644104a3b174a88f86dcbc0b19dc5f880100c51e', '146.70.112.172', 1756047950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f1a4209abdc2cb365b98e6ad045cb0f419be1134', '146.70.112.172', 1756047950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('08e8d6649db805c053ca822b53b1d376184370f7', '146.70.112.172', 1756047951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('11675e8cdc02758cb76225de3cf2997596c51fe5', '146.70.112.172', 1756047951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('76da9e587177a016c488e54f8ab8d4a565d1ee9f', '146.70.112.172', 1756047952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('146b2d16335abc686e2abfc68804fb8c08509622', '146.70.112.172', 1756047952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('490a5162ddca35e940673ed924264ce0254f0f85', '146.70.112.172', 1756047953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45d11baa4a96148dfffe1b5b4b669f6e1edcc630', '146.70.112.172', 1756047953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9f4eecada74dfba487647c365eea0e9ef16eb5b2', '146.70.112.172', 1756047954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21e69d378394c9290b6c59b4b998e6124698c994', '146.70.112.172', 1756047954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d4651d8e9875d734ae2bb52131c4314879d7680e', '146.70.112.172', 1756047955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d7ea6f0bf01397234544b2ad7606a396c622a30', '146.70.112.172', 1756047955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b66adc21c040cf68318e1ee33f9e15b12a3a4282', '146.70.112.172', 1756047956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bc7acb45d7f0556b35c52f7cc00fbaf4c91d3a56', '146.70.112.172', 1756047956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('821e542c14e412f9f8231fcc2f14af81177fe6d0', '146.70.112.172', 1756047957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('589a49145cf4991cdfff99c92e7105b35d784f9e', '146.70.112.172', 1756047957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0c03260191d94d1269794b5783a298e94b1ea5bd', '146.70.112.172', 1756047958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ae005b1ec177b6bbbb318841609bfc7dab75538f', '146.70.112.172', 1756047958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0cbe7d0c09565cb0867e0772bd1d9abfcb700e70', '146.70.112.172', 1756047959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373935393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a75c096c869cfe6fe8a79e74b76fb1f07d225a89', '146.70.112.172', 1756047960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c25ed1b85311a1d20498cb909b32d469cb0b913a', '146.70.112.172', 1756047960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1b0dd939ee611f600eba03cf88bf00b84d3f11d5', '146.70.112.172', 1756047961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5d394eef4d97a4dd22e14de7731e885bf64aab1b', '146.70.112.172', 1756047961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4254e93c43cf465c77606f96e68d835b7c052e7c', '146.70.112.172', 1756047962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3befdfc380594f369d0359034a287f31ad45a69c', '146.70.112.172', 1756047963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1d4435f12745373ab16ad266acbbb79f6a185b4f', '146.70.112.172', 1756047963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2015ef4ab68a61a16cecc2cbf427b2cc7b853bd4', '146.70.112.172', 1756047964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8cef2b020d54c72535d3c634d32e1f6344ad1c64', '146.70.112.172', 1756047965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('83e5590a2dab72765f03c0860cfc86d42b7c1104', '146.70.112.172', 1756047965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('753a013cb5318ba2863b1752c2eb148b280aec97', '146.70.112.172', 1756047965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cef469e22a55ab37520d4d2689dccd0fc9f00208', '146.70.112.172', 1756047966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ed062dd7193fa63b7be56e0181628ee2e7b5df58', '146.70.112.172', 1756047966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c0b9c1968c9c3fe96434cc27d3e193de23d24445', '146.70.112.172', 1756047967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('41ac3033fbe22c8cd28b52a6600ad3c5f0a8fb6e', '146.70.112.172', 1756047968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2526d17563f96c8955852df01dc32471d5ec1aff', '146.70.112.172', 1756047968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('26f2566d712a8419142a1d3a545fd3318ba980db', '146.70.112.172', 1756047969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cd4ae33c63de4f57d940229108b4be54f0cb02af', '146.70.112.172', 1756047969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373936393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b2eedbcc55fbdd32588b9693427a26ce740d0661', '146.70.112.172', 1756047970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('48b3177114c86bfbf88ffdb10d5ddfb7915dbf84', '146.70.112.172', 1756047971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1fbffbce6b9c0f927a3697dbc933464f8c3bff48', '146.70.112.172', 1756047971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0df2334aeda5c67ee8e7e7f943fd38f07e8d95ec', '146.70.112.172', 1756047972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('773a186a5806678ecbfdca6cc421b9721064ba80', '146.70.112.172', 1756047972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('97d38924a9f98dcb24dc78c35b9a834438381081', '146.70.112.172', 1756047973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('875296c964f63055eaf3178c5cbe92f29be9b7ca', '146.70.112.172', 1756047973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('de9e74405337e559d814cdf1286536aa4e22f04e', '146.70.112.172', 1756047974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('60a89fe439119fe7b50094effcb162f30c4bb4f6', '146.70.112.172', 1756047974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('849aa46090e07b69d1fc501954c91ce158e8bfc9', '146.70.112.172', 1756047975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d6660135630099f820920487ff21b49a4170097', '146.70.112.172', 1756047975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bd8f29f6d758650f6efc52265bf0b462dea24182', '146.70.112.172', 1756047976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4cac1967d0cdde8135a67201a256ddf66218ea5a', '146.70.112.172', 1756047977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('68825b9b5592d6f711d0b5a42e79d68c5371559b', '146.70.112.172', 1756047978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('edffca926851d88272baa18f7178f9c80ab2088c', '146.70.112.172', 1756047978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('53ce851128f8f632949a0bd0cc19271601260138', '146.70.112.172', 1756047979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b62af3e5b6a56629efd3998aa2cb2bec2c6b0ff4', '146.70.112.172', 1756047979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373937393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d8d1fcdd7fc0a462f2d7c399d0e877e17566de5', '146.70.112.172', 1756047980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3630d7f950473beb0d89dbe264615c3e8d65db28', '146.70.112.172', 1756047980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('59873709484f5218d34f50ce55da63f029bbbc4b', '146.70.112.172', 1756047981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3616c8a8571c40aff8c10a8cd2de825cff6b0ffd', '146.70.112.172', 1756047981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b7631f9b074cff9502613c62a3e43d4a4204a7c9', '146.70.112.172', 1756047982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('88b6206e061eedc1c12de7fcc08273b4254cdd6a', '146.70.112.172', 1756047982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e65ab841d55eedc1892d848689d4b139e5506743', '146.70.112.172', 1756047983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a07286c174a7530c40b9933d3ba638837973e5be', '146.70.112.172', 1756047984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e23f47b4f6fcead7946ade4ff1bc6e00c04017b9', '146.70.112.172', 1756047985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb395575104222c602d5da147a6f047d229ae762', '146.70.112.172', 1756047985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('20e978a7bfba7171901b5069f54ca347b10077b7', '146.70.112.172', 1756047986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('08dffddb0c1f38ebf715415b50ed07b0283396c8', '146.70.112.172', 1756047986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0a90a6e5a0636dd0a512aa45fd76e5aba5634f51', '146.70.112.172', 1756047987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('aef721b9012aadce634cc0fa4771e97a876929bb', '146.70.112.172', 1756047987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3d1f5f18b68330704405f11341fd8e6848117711', '146.70.112.172', 1756047987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fa12c438dbf0977d819f4c59dfc4e948cc65cd31', '146.70.112.172', 1756047988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('590d18bf47d9acf57db0f19bdb1b3611af66dbf7', '146.70.112.172', 1756047989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e0855e934347186622250ac0cd02f4d2972a5d66', '146.70.112.172', 1756047989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373938393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cf4eac9608cb6fee3f113cdfcbaedbed5a7e57a5', '146.70.112.172', 1756047990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f81d59e4a87434b767e02e6dbcb7a5afb898ea63', '146.70.112.172', 1756047990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('831b77905938f3af86bb64d95574e1b2d36d510c', '146.70.112.172', 1756047991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c1847b23fd292eabd5d53f8e233bc88f398aee66', '146.70.112.172', 1756047992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8dcc3041631241cce34a2c90c3018bd8eeb67b0e', '146.70.112.172', 1756047992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('35eaf6639f5a1b1e21d84476768ad5990d33a398', '146.70.112.172', 1756047993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ce4e0b88eed1c9675d2f9522aca755a4a7b4611d', '146.70.112.172', 1756047993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0051792ea6f5c9b834761e737e08ad172c698af7', '146.70.112.172', 1756047994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6be2c04e315a0a7f2fee39ab5e3cedefe65c9324', '146.70.112.172', 1756047995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fed014a5e03e663f7168a6c03314d89fd0e8c1af', '146.70.112.172', 1756047995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b18540dbe55522cd77abc5367df58faf305f1806', '146.70.112.172', 1756047995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('396fca134d408597506bd0ed96504be1f3fd30fd', '146.70.112.172', 1756047996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('844e9bc72aa7a7d5e0648dd8a0316a4a8536ce60', '146.70.112.172', 1756047996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('06a6c7211aa1534e6c71dbe45cd4d9f1379e6c5d', '146.70.112.172', 1756047997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9f0f06bc9da85a1de2aa032cbb0042922a51ae8e', '146.70.112.172', 1756047997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('65502b141e3d173929455243e2752bb9f5669235', '146.70.112.172', 1756047998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('199a3401e18ea197fd7c0ce68b79814219b51bba', '146.70.112.172', 1756047998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ee78c66bc4df6f5d1a51f80e6b82c80419e51835', '146.70.112.172', 1756047999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8b1fcb6e4cc9461cdd067b5257e19b960536aa30', '146.70.112.172', 1756047999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034373939393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('18e015d8dbb481336223a4cd87a95543399d911d', '146.70.112.172', 1756048000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('de9f1df97f115ccc996d07f0979cd135f51208e5', '146.70.112.172', 1756048000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8022d0a94d69f929fe70e7965ea213f2e050990b', '146.70.112.172', 1756048001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b54cd0a891a221a2db12d38a04f8893c1d737069', '146.70.112.172', 1756048001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0920ff5254f45dc892bd17b2c28d5566ddf6a28a', '146.70.112.172', 1756048002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9ce3f322ae1260d8a3a13161e3bd02b7f0c93bbb', '146.70.112.172', 1756048002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c7931d53dbcf64e9af1cf9233a176deaa1c48411', '146.70.112.172', 1756048002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('74f0366cc569a9721ab966c9b5f6e44784256ee3', '146.70.112.172', 1756048003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('83aa56c79e965e8c53e1c0dd626a41b137962ae5', '146.70.112.172', 1756048003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f10b1959e618583d5deaf741284d3ca6f2ae94bf', '146.70.112.172', 1756048004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6acae3118e866cc3363d5a837ffb1e6b383061bd', '146.70.112.172', 1756048005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d20ce7bc178cc2dc99890ba240a03967057283d', '146.70.112.172', 1756048005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('adcb83220f5048204a238581d937ec02744343cb', '146.70.112.172', 1756048006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fdfa02ec2e298d20bd010543cb0e2015eab31c16', '146.70.112.172', 1756048006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5afbbf83319bb377a5c15333e23c3f2fcb0baff4', '146.70.112.172', 1756048007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e55ddb4cda0c4c8767009d5d3836eba60b7b34bb', '146.70.112.172', 1756048007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1162eb651f6f5e4cc4f59734bec9d78d15e3ed0c', '146.70.112.172', 1756048008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fd9c47df74bc3c6652c8ec600ab50a2fd674e5bf', '146.70.112.172', 1756048009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b0d974d17371a036c62dadff3cf069b7e34ab3f7', '146.70.112.172', 1756048009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d1512fb2d8fd1f00f118d3b59dac1afc0caebd3d', '146.70.112.172', 1756048009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383030393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('20f379dc84d5af85f675b4c8cf3df3a0a1d64cb2', '146.70.112.172', 1756048010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('258fdee74f3e83796d1254f6d6f72b1bde87df88', '146.70.112.172', 1756048010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ef081ee30401a1e193d53ea605f5287e933a1a78', '146.70.112.172', 1756048011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dac411757689bf76a5ff20d58cf5203d7e3b812a', '146.70.112.172', 1756048011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('076e2e7378059542cfc5ba4470ee7d2fe3d7c8c1', '146.70.112.172', 1756048012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dfc59055d37682cdf65f1c4bd09a1f9133a3b20c', '146.70.112.172', 1756048012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('74cc08821b4f9f5697a3020cc194019ed5835be4', '146.70.112.172', 1756048012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f8b81bbe48acd0d6277f25888337763951d6aede', '146.70.112.172', 1756048013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1f00317921c2e5381bcffcfcc3735198bcc42059', '146.70.112.172', 1756048013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e21e5912d48e9c9f6cc77937967a145e5cdad6f', '146.70.112.172', 1756048014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2db6cd6b00d74ad683efc383892df9188fe7cd6a', '146.70.112.172', 1756048014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0daefa2e7bd9f6a28236f8c9f0740d3c49366b33', '146.70.112.172', 1756048015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cdf59350400a66ae5549a0dcfce08e152ec84e3b', '146.70.112.172', 1756048015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('346b8fc5b64320cdc1ccb082ab5cc71818dc4180', '146.70.112.172', 1756048016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec6832cae821b78b89ce3e4d104fa21eb96540a2', '146.70.112.172', 1756048016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f19a783ce3227f5c8543d70796ea9d6e88f790e2', '146.70.112.172', 1756048016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d2309cc4c158c34eafcff2decdef3b2d10b57b6', '146.70.112.172', 1756048017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ffcc0ef05aa42b735d1286c05699d54b5ad47696', '146.70.112.172', 1756048018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('581f8c5b7152ec2e88ef62bcabc049672d9be6ac', '146.70.112.172', 1756048018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('67d5057fb3d9b6cf29f81a1300e1f4130e4366b3', '146.70.112.172', 1756048019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0db2f38d26cc1d9720435d5261b0e2962384bb69', '146.70.112.172', 1756048019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383031393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('15b07441a586108238121c2d3c7b08215a9b109c', '146.70.112.172', 1756048020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6a42ca23bb9f67126d2c81c536b921704adf9dac', '146.70.112.172', 1756048021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('06a5b59d0cf2aa353b4669161b586dff4fabbd11', '146.70.112.172', 1756048021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('02d65ed1885d62403bb03be1728983816ef812ac', '62.93.167.89', 1756048022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4f6573181264906512a834bad64c371a391dc26f', '62.93.167.89', 1756048022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d5cbf10f6b5406fc153285f3e594442c79edba9d', '62.93.167.89', 1756048023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7f1cce74575c0e04eb655f43213b18099da27f5a', '62.93.167.89', 1756048024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ae7d2d784da04d781acd8248e48907895e706aed', '62.93.167.89', 1756048024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5c1c26c861fdb02ed523e7eb7069d733cd432709', '62.93.167.89', 1756048025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('da9d7a24db2c65a6ecb1c13ad0d703e84cfa6f2e', '62.93.167.89', 1756048025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d7abeb6fd3e72f27bcde8485bf03a2003d58d57a', '62.93.167.89', 1756048026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ca862b4622eea7fc93c77cedc8e35add312e0ba', '62.93.167.89', 1756048027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a5c840163c84475299b6d86f12637c7a9a08ded4', '62.93.167.89', 1756048028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('163e15b437c75a72e60b25a7e296bda39e6aaf55', '62.93.167.89', 1756048028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7025b156485219034b231ef3dfe2623b50195ec4', '62.93.167.89', 1756048029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8dd2897d5c81dbec2c390ec7f818485d4ee78487', '62.93.167.89', 1756048029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383032393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d650ecbf1ca024f17f68ecee88a2496b7e42e0e5', '62.93.167.89', 1756048030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3f6b2daf0d1acc5405e6c23d9d2513f9778df895', '62.93.167.89', 1756048030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1df0c54f264de27554d849ecc1a5698feb65cc87', '62.93.167.89', 1756048030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('32b196d362298b1a6a36ec77636160efc43e3303', '62.93.167.89', 1756048031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1afeda6cee322bd491d63ed929ea9548c73738b1', '62.93.167.89', 1756048032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91d2144e1db2b8669fd9338b34849f5741bc12c9', '62.93.167.89', 1756048032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3fe5c4de32b0239a7328edb72c783f325c36f1f4', '62.93.167.89', 1756048033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('31b0b5d2d4d1abb78f08ceb78cd1fd0c155b1d7e', '62.93.167.89', 1756048033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('18351c3cc2b8fd0ebcaa2c5c2e4faa9dbdb5bfed', '62.93.167.89', 1756048034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d9e30a8c3d026f3ab577984375c275d04ecca79c', '62.93.167.89', 1756048034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2f58e8b03d006685b834496b6d5d21019833ce6f', '62.93.167.89', 1756048035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec50b84f0b6b9e1b5bee43efb56fe60459aba8ec', '62.93.167.89', 1756048035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('05864303335ec4ecd11274f7ca753a710ceb8aef', '62.93.167.89', 1756048036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c2588e3fee2167eabbb036b39f8fbb10d78ee858', '62.93.167.89', 1756048036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5698f9639605142a210b579aa0be4dd3af66b4c2', '62.93.167.89', 1756048037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('97ade38479fb90c8e0b67e3bd6e75756ab1592e8', '62.93.167.89', 1756048037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb1dc745b15cbeded694d82a002cff5d2f3911f1', '62.93.167.89', 1756048038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1a38cc7fdf03d9313607fd7d14868c208831dfa3', '62.93.167.89', 1756048038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c444f549fada757fffbed8240fc6b7aa319985a5', '62.93.167.89', 1756048039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fa57a9e3a2d6f885d363e38332cbf964a2162342', '62.93.167.89', 1756048039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383033393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('81bde85cbcf0dcd6ee951e04ffe8f9c24e7417d8', '62.93.167.89', 1756048040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5d1ab165038c002ebb0d64dd1418aca6804ca83b', '62.93.167.89', 1756048040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9041d5c0110164021192346beceeb8995ed8aa82', '62.93.167.89', 1756048041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d49a2fb8f2fc16a071ec9dabbda5d90c6add6aa', '62.93.167.89', 1756048041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a2dd2fc0d6192c05f7568403fedee10d74b83f39', '62.93.167.89', 1756048042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('37529274db230430771a64126be3310978330c31', '62.93.167.89', 1756048042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c465a70cbba89e46ca19792d946c4a59f2479546', '62.93.167.89', 1756048043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ba7fdf95bf88374e2a37a8dd130e7c9448ef9f8', '62.93.167.89', 1756048043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb67c5919c75dfe64c91e8031a8d48f5fbdb8242', '62.93.167.89', 1756048044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a4adcfedbf2a6d9a891f56761425281ba8870a8b', '62.93.167.89', 1756048044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7b2947abd8757368ad9d5a3faa41e05c7691f2a5', '62.93.167.89', 1756048046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91c7c3b18c52d31c0508e5dedd4d8f2d9ae3b185', '62.93.167.89', 1756048046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('61e2149156171a783d8417081fdf5cf2516b944a', '62.93.167.89', 1756048047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3ea592f98878178c9f58f6172d1fe12e77181b7d', '62.93.167.89', 1756048047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e134701a000685c29d0cb03c46e4b9dc310db88b', '62.93.167.89', 1756048048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1fb82e7053031cd17fa87e4f08150568dda5b992', '62.93.167.89', 1756048049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bf6d336da6e3db4ff20e6f191b8bdd179d968fb7', '62.93.167.89', 1756048049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cc2c1e09c125dbfbb295b57b720af6d3c84a480b', '62.93.167.89', 1756048049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383034393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fe81a8432bf6b1d7d0bd5b64f4a590b5b83a35bc', '62.93.167.89', 1756048050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('be5167b238a23575d2b4478ce1d179e750d858fd', '62.93.167.89', 1756048051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec0b5dc4e508c3508f2a1828da3fcb17cf97768b', '62.93.167.89', 1756048051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e6051fe77e874c2d873064f4de2d7e313b46583', '62.93.167.89', 1756048052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c278eaaea682c1c156cfda902250b911d4659b50', '62.93.167.89', 1756048052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7615e727bc75182565ec5ab13357e86d8915e240', '62.93.167.89', 1756048053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9752163abf886f2329ec064526c5fef0896401f9', '62.93.167.89', 1756048053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f222a6c5d7f938bd52b70e5e87591639ffffab69', '62.93.167.89', 1756048054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('93cb97220bfba28162ae333f651b225e864127d8', '62.93.167.89', 1756048054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d17775c7764374bbd50574a690926714ce0eb80', '62.93.167.89', 1756048055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8baa071dfd5a9739e7e16c301ffea10ec00a7086', '62.93.167.89', 1756048055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e58a8bbae2990b2300a965ffd3db95b2e316157b', '62.93.167.89', 1756048056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9cf31e4c7fb1a473e5616a2616cb7d0698aec1df', '62.93.167.89', 1756048056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3d52a2f1a69e84f3a86f7dc035e2a1c767ec8f96', '62.93.167.89', 1756048056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f8d91673f519bfa8d84227bc3405bcaffea219ae', '62.93.167.89', 1756048057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fd877220bff4fc115f95f27af75135175db325b5', '62.93.167.89', 1756048057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e8f9b8190cc8fe5b7dd481b7cfeb4871979721fc', '62.93.167.89', 1756048058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e48a4c308aa0d67d66c0698a56e8ff784307a482', '62.93.167.89', 1756048058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2269d0f102ddb6272fe41713ec81f0f710a0bf64', '62.93.167.89', 1756048059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f9d65df1b1995f4e405b9124ae26fac146e056bb', '62.93.167.89', 1756048059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383035393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f7e50c30c32f07d58a99b04342b51dcb885eb75e', '62.93.167.89', 1756048060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('01001c606fa991b81878f70baa9f10bcf250868d', '62.93.167.89', 1756048060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c5ec443e58594c1817571b9edcf6596f9f7edf4f', '62.93.167.89', 1756048061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('54c1008df37c65c632560ccb3ad2f7e2f7fd7739', '62.93.167.89', 1756048061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8c211bbf5035d22febd2d0b78f5834bd3275f9cb', '62.93.167.89', 1756048061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('33e08f169b76fa6a6e2397408e1104287c4204b5', '62.93.167.89', 1756048062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e6048f87b013220221a45ad740248d695962fc50', '62.93.167.89', 1756048062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b8fd96307913fb7854f6be3e186f3ced7cdbc741', '62.93.167.89', 1756048063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('acf1f7c66d25b200fbc92cbc96cf5f8b735d792e', '62.93.167.89', 1756048063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e6fd51f9d05c35c28d4a05f25d11d2674800270e', '62.93.167.89', 1756048064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('be17c873dee4adfd91e80f2edd60bc067e34042b', '62.93.167.89', 1756048064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('073fbd28ec0007891091fef500f31aedf601d6ca', '62.93.167.89', 1756048065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('452a3ea42c9af2f19d49c26c7edcfbd1b9f1f8fb', '62.93.167.89', 1756048065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9035f2b24e40e4a78197696a317ca58a8dc3dc38', '62.93.167.89', 1756048066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4f7e23a48e657dd70a2ea1b1cec1437cd0191924', '62.93.167.89', 1756048066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ee6f7344a9185360c88c04e442661a43daf75e96', '62.93.167.89', 1756048066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8029a75c51c04def703f7ea5e33b0e73b19b8247', '62.93.167.89', 1756048067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('108f9a4b434b42a1e6b7406a5712a278964f6416', '62.93.167.89', 1756048068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1e7f410f19ad3ff2d20b5a546e9d4008e5fd4857', '62.93.167.89', 1756048069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('300cf21ea98442e6cec90440e1a4dc8d584a0690', '62.93.167.89', 1756048069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383036393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a59cfab2175e4512437d10c5e2990c8f94e35d51', '62.93.167.89', 1756048070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3001f952bbf49a54ecb7587df7026c2d1cf5dca9', '62.93.167.89', 1756048070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b1d845e0f53773434b9c42102d2a98dbdd427124', '62.93.167.89', 1756048071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e13c28e271c190597fed0dacf0581833c3a523a8', '62.93.167.89', 1756048071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4e86f00a3d1d8b5e8042cf49918b6a791728fe10', '62.93.167.89', 1756048072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b69a0c702497be4200209e27233de4f6b50b5374', '62.93.167.89', 1756048072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0c1d34efc2e100265e75bf4700757cfed6fbba3a', '62.93.167.89', 1756048073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('10f5edeb654365b98e2b929b0f8617fdd52ab855', '62.93.167.89', 1756048073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad688921e1ee78ec9239b57aceb965d270f7e8d8', '62.93.167.89', 1756048074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4efa20a18976da60d4b125f3e6a3a08f539e128b', '62.93.167.89', 1756048074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('12492d6efb2e3dea7bf797a898b266ec94e49b87', '62.93.167.89', 1756048075, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4d071004a62bed7c1746bca02fe059b59049b579', '62.93.167.89', 1756048075, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2bb73a62237a389e666ca9bbb09811dbd89f15d8', '62.93.167.89', 1756048076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d6c14177a38989387221b27cb0012014c063da9e', '62.93.167.89', 1756048077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5305cdbeded7c55a4be4fefe033b5c161978718a', '62.93.167.89', 1756048077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1808a7224a8664b17783c74a5ff750734f8c6091', '62.93.167.89', 1756048079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('38487400b99b81395e4c7660c52fb93d68bb709b', '62.93.167.89', 1756048079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('68b2be3b3e8547b6572c397a348409de18a76df8', '62.93.167.89', 1756048079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383037393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dd4ceb2423b0e3a2eb54aac95f2213d484e23940', '62.93.167.89', 1756048080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('01cf869b2df34714475b155f73cc4e702de370ed', '62.93.167.89', 1756048080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('669272ac90c06e16addb80bf71ef5b0f1a0a179a', '62.93.167.89', 1756048081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cb718f45ae4d1b8816baced44bfaa4f3fd614a9b', '62.93.167.89', 1756048081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a67af407fd615681de83fd53917ec1c75ac7398f', '62.93.167.89', 1756048082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('317a917af76a1fcd271923c27b25cb335df051ec', '62.93.167.89', 1756048082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('daa91d53788a315b765367500c55b38b7d6dcd7d', '62.93.167.89', 1756048083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('97c3ce8c65b5119da21bb7906bcd4c0aed68c439', '62.93.167.89', 1756048083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f8413f77d3f145575a9e2f69411d6d9c882cc2b6', '62.93.167.89', 1756048084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ae537005b68d3e3b83bb057423b1aff431fd4608', '62.93.167.89', 1756048084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6e82cb157f3e3b7baf42cd0b6db3a3c93fca3525', '62.93.167.89', 1756048085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5f659994a7e142ed028f42b6bd8785ac9d66e07a', '62.93.167.89', 1756048085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('096368d3bede482b1bf83bcfa832ccc6f56f0c3f', '62.93.167.89', 1756048086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c8b766032f78313a07523a87c699ca56b3af0fa7', '62.93.167.89', 1756048086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d4912ca76232d2ece8ba72bb054f640935cc504', '62.93.167.89', 1756048087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c19db661ffefb81b493b501a38f017d5d818020b', '62.93.167.89', 1756048087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bcdb43e52d271c550230289bd113c3e04e65f6d3', '62.93.167.89', 1756048088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d86e5e3f6fb36b0c0b1e3da1895277a456320e08', '62.93.167.89', 1756048088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('311bf1b569cc241c4ce44d00d1211a10233a110e', '62.93.167.89', 1756048089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4c5cc7ea65bea1c188bdb3eba2f0883b4a303f61', '62.93.167.89', 1756048089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383038393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('65a50278797f7e6561bdf0bac5e19dda4e96ce15', '62.93.167.89', 1756048090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('33fc7221f4b0fcc4c5d39686c974202822e1f362', '62.93.167.89', 1756048090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('565f12090b335a5b96a190aad882abc1f1d3bd43', '62.93.167.89', 1756048091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0501c1a39a70f32659286bdf1493af42bd571489', '62.93.167.89', 1756048091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('83c670569be55d5d868dde79790e45b11c38997e', '62.93.167.89', 1756048092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('614dcb608d8f7ce883c3ab898e72c587ea0855aa', '62.93.167.89', 1756048092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb67979eb4405358ac417c0a16f10f88ef23401d', '62.93.167.89', 1756048093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('aaff61013a326d3152d1cd9a23494c7156447c0f', '62.93.167.89', 1756048093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('08106260d6407e6104e3dbd599a6825de6796222', '62.93.167.89', 1756048094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d1922cebd09de4a505e9375c1b4bfff1825a50ef', '62.93.167.89', 1756048094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('418a3842e4876eb8355ee0b91d0e247395426e41', '62.93.167.89', 1756048095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7056d231509de128bd3704cffb3f170ecaae032c', '62.93.167.89', 1756048095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f1c048f95893856557a0f68b1648b22ae952fe5d', '62.93.167.89', 1756048096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('82fcae40c8897f539419d97739191cf802533ab5', '62.93.167.89', 1756048096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d68e2deca0423f1814f1c736150f63755637af49', '62.93.167.89', 1756048096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c6ecafbdecfe0f4001b7cdcb310d3ce028554d64', '62.93.167.89', 1756048097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('143479258348109b532f87bed360b9666cd27462', '62.93.167.89', 1756048097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d90f26afbb77892a857cf4a05754cd5ff153eb77', '62.93.167.89', 1756048098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('616ba859836e4178574db62a74c9eb3bd72f8e57', '62.93.167.89', 1756048098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f761727662be9c3c221630791c3a09b416714a98', '62.93.167.89', 1756048099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e4a34db6bc704f7b44198e5cf2963d23c2fa24e', '62.93.167.89', 1756048099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383039393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('085f954c1d2a20562b0a0f8f88c91496adb3b443', '62.93.167.89', 1756048100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8c9689a732048717bc112709013aa9fcf6e05e2b', '62.93.167.89', 1756048100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f41074304fe301847731f8b3c7684056b9b6b844', '62.93.167.89', 1756048101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cf86f16aec3b79cd7859f9dfc99d5ebe6a48dbe2', '62.93.167.89', 1756048101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d932df5203b968b05e0eb6b1c5edecb646bca4d7', '62.93.167.89', 1756048102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b2103f0570ca68b55135877b36e9318d5ef8571c', '62.93.167.89', 1756048102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9c05daaadbefbf941645e20dd78f7ec27d7baff6', '62.93.167.89', 1756048103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6b4ca7b5efc46e5f67ea1ad96dd1c3397f7a89be', '62.93.167.89', 1756048103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8044858b03d2cec87edd657d6bc6bc2ea6ff8e05', '62.93.167.89', 1756048104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21eb331a89d9923b2ad3e926d85943d4cb904821', '62.93.167.89', 1756048104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ee9afb5362bccba0e48fdcad3a49ca5ab5fc73b1', '62.93.167.89', 1756048105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b857101547c64990a535d28553d58f41e2cf692a', '62.93.167.89', 1756048105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('64e6969ccfa774200cf85a234567bcf183a2f2df', '62.93.167.89', 1756048105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('81f445c4537dfa4d04947693bf509684c83ce437', '62.93.167.89', 1756048106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b349e3a4a4d94b98cbecdfe253f1684df925f161', '62.93.167.89', 1756048106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ffe3d80b7a9c74a7c3a9e8f711ac71aac4eba1ce', '62.93.167.89', 1756048107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f568d42c3bd6dc546cd75e61349718f78479bb13', '62.93.167.89', 1756048107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('682f12f4fc1339505eccf1ff860e92a8a8ecd3c8', '62.93.167.89', 1756048108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('878bbf23735ca89e0b61fccfc1961176ba82d6cd', '62.93.167.89', 1756048108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('68ba870f358d2e8afb62f4ff01205980ec068822', '62.93.167.89', 1756048108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('749b2fffbef85c3fd60d58e2190025dea457527a', '62.93.167.89', 1756048109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383130393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2cff0ed4aa6a79cafecc70cf44845cfff21447cc', '62.93.167.89', 1756048110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fd65fa975dc49cda1172440901c2f2e202628035', '62.93.167.89', 1756048110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('69c92efa2152e9a6f8bc580b0e0a136f74780e9e', '62.93.167.89', 1756048111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('120f5f8ef8e1f2b0b3505643e892c05d6ee5d9ff', '62.93.167.89', 1756048111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4cd2405872c10dc1778282591bce362d254fd4ff', '62.93.167.89', 1756048111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('09368411acc1c717b5ac33f49bd86166414f5db0', '62.93.167.89', 1756048112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2e4758608f070745398b70c8d67a783430a393d8', '62.93.167.89', 1756048112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5db8fd624d0bdac4fd9f13cac0cc17781fbfa485', '62.93.167.89', 1756048113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('643154ee853a034c1e6bb6309ab3fb1b9ef7dbad', '62.93.167.89', 1756048113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bc1a7da0102fe076ef521489a4b4a7db7f04f00c', '62.93.167.89', 1756048113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3a171704a3834c3a132b0d3c740ae092383a34cc', '62.93.167.89', 1756048114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('40736163e7b4bbf20d4428d50de07a8c38f04aca', '62.93.167.89', 1756048114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('263a0985ebabe8b8b00b9a0747b0bc8998bdb2f2', '62.93.167.89', 1756048115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d42f882da268df526f81dab19156fd97cea1e452', '62.93.167.89', 1756048115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('92ea5d90cb9e7df44279ae4539880f6f9e1ac5b3', '62.93.167.89', 1756048115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dbaec9998e6de1039aa0878f190a98ccadcd54ed', '62.93.167.89', 1756048116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('71fa79194795a6d0247c835a06b216298918edeb', '62.93.167.89', 1756048117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('16a416b454208f2fc465dddac797b96da9a5eff3', '62.93.167.89', 1756048117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7eec19ab29f30a32359007a911eab425e094135c', '62.93.167.89', 1756048118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1678292b577dede3f85330c9caefa7c44fbc85e0', '62.93.167.89', 1756048119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9919a83614d9217fc7f03ff2d08b7751391750e4', '62.93.167.89', 1756048119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383131393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('775e146c59758dcca5790ddcbed19ed26a261e28', '62.93.167.89', 1756048120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ea725458365862c4a63ffd2b42c8fd63576cf6f6', '62.93.167.89', 1756048120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('af156ad951352e42631f01fa19e32d5373600230', '62.93.167.89', 1756048121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1fbc2e63ffe91fef148e0d6bf1f6fc572cdf151c', '62.93.167.89', 1756048121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d993e33b0b38df3bc51e785a77452bf2146e81db', '62.93.167.89', 1756048122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('063c5eb7659f7416cb99561a90bb7af5eeee2dda', '62.93.167.89', 1756048122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1a981118f87ca2bfb5767977bdb2a46e0129a6e8', '62.93.167.89', 1756048122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('433242a3ec4ef8b936e7a3b0e0e2784320aa3106', '62.93.167.89', 1756048123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a0f926aebf7201005f68871f72dd6bde8ea44e10', '62.93.167.89', 1756048123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('694dc8d791cd8e736c620a40c8a5929ce0b60fe9', '62.93.167.89', 1756048124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8091dfc0f33ff1d3dd1cd79afd6fb634c5edca2e', '62.93.167.89', 1756048124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ca213930e3eb31f09abe7bc6986825520443ac18', '62.93.167.89', 1756048124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e1303600adf5b2678b1e0e40743b97cf7bb287e', '62.93.167.89', 1756048125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bc44106da68bca2e74dba4b30e7d0ab1e07fb23a', '62.93.167.89', 1756048125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5d872d21e67f899a2c8c8fb97f21f2479b3caefc', '62.93.167.89', 1756048126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6c41763fda51f834e7e62bbad329884caf1be98c', '62.93.167.89', 1756048126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('294d1769c4ae8d96455251f60442bdcc32be10d8', '62.93.167.89', 1756048126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7fbcef2c2a929291f4d282d46e48e42ffe4dfb7b', '62.93.167.89', 1756048127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e6bf7a76348b1541a986620775a7113cfa29de3d', '62.93.167.89', 1756048127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d836b4a847627cd37ba4452ae7638ff48936a25', '62.93.167.89', 1756048128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('492ff5e2e68a831fce627cc0306bf580147497e0', '62.93.167.89', 1756048128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e7a151e5b9ce35aa68833d434f81689bc352fc30', '62.93.167.89', 1756048128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('7a1283077a3b4045ab0b985c7c8fecf49e57031c', '62.93.167.89', 1756048129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('368bc5c1257f79f495ab8c5fbe131a84e1ecc57e', '62.93.167.89', 1756048129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383132393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ba9bf148f638b3d12dfcae402853d7ef6ae7953e', '62.93.167.89', 1756048130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ccf6776f711495045807c7c0699f20443ed51661', '62.93.167.89', 1756048130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6c3b34fda295ce4260fb021fa401762caea1aede', '62.93.167.89', 1756048131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('63d82cf5bcccdc5e9c8e690d444df3699e8c7e1c', '62.93.167.89', 1756048131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('422431e783aa13a11257121d66f6b18193eac5f3', '62.93.167.89', 1756048131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e2ba5df37c86683e5b91483974531405c95c4d59', '62.93.167.89', 1756048132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f41c05b51412b610b7a03d82bfb86c1fc8ee64a6', '62.93.167.89', 1756048132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cdb29ede2277ea55b5f2bf2975ce2710eb11d03f', '62.93.167.89', 1756048133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5cbe4291d4aedf58edf1a4331e8d4986b41ff8a7', '62.93.167.89', 1756048133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4ef1515c6cdceaa79e1d6dca1450df67d5184f4e', '62.93.167.89', 1756048134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b61f290ed4517fc3a570b5312219dbd029bff91a', '62.93.167.89', 1756048134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5cfc67db6f6aff1203b42f5eb83db8e40786b724', '62.93.167.89', 1756048135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8addcfb06d70e0d2970bcd2ad4b67b57938ea01b', '62.93.167.89', 1756048135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('42310830408fd30f507882be836b9373df6be5be', '62.93.167.89', 1756048135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fac5429002f12da607501e9c413e8b7928d8d774', '62.93.167.89', 1756048136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6e026c238dbde8d892807cb4df7e523b2480041c', '62.93.167.89', 1756048136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c6f0ae7396d84ffdbb129628dab1b30ca96e492d', '62.93.167.89', 1756048137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b4a3a31ecd2d637987ab20acbab0b71a87b54ecc', '62.93.167.89', 1756048137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('62e68c302e35a15a94d3337598505d45403ebd7f', '62.93.167.89', 1756048137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ffc127813188bb8b46cd3c605fd0e5037fd87e1a', '62.93.167.89', 1756048138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('37bd47d8b750d169cbae11bf371f06d12dd40177', '62.93.167.89', 1756048138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5ee44c9ef1329f52fe398d3a1293ba1b21ceea93', '62.93.167.89', 1756048138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f2b1ce7e3432af3f7d4252e6e08ff6e7683e7ada', '62.93.167.89', 1756048139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('60444672555f12c3c84f4b70accf48e944547ba7', '62.93.167.89', 1756048139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383133393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('511ce8d91cc9680bd54ae312be2ee1ad1930c1a2', '62.93.167.89', 1756048140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1d470c6b0b165d60919350bc5c402118acb36870', '62.93.167.89', 1756048140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('39ee1a5a3e96fe78e165fbc7202d2f21b243fd11', '62.93.167.89', 1756048140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6ac363e8c0455517582d6f5aa5d81195c663fda9', '62.93.167.89', 1756048141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58f6246430c7238dad21d07e2082584596c3483d', '62.93.167.89', 1756048141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('918ec0e327e4dffccc6a79f4d2ddd2ceb84f78d7', '62.93.167.89', 1756048142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('12fff97c4a50323ed0622726a3a1e7e9cbaef5be', '62.93.167.89', 1756048143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4e1d24fe62334f580c14242f8fe4bdcd5b2b062e', '62.93.167.89', 1756048144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('98ade5f2bda125083a308858dc604b235ab02d20', '62.93.167.89', 1756048144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2d7dfb180d61e086a27c9fe9a62e6ea51122aec1', '62.93.167.89', 1756048145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bd661e111c43f66457ad943dbf667e4af18b2080', '62.93.167.89', 1756048145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('54e3a879a66ad68dbd0130c5387d6077fa567807', '62.93.167.89', 1756048146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('665a058a1b090ae5768bbb9bd0efbc9c2fc09c2f', '62.93.167.89', 1756048146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('96caede305bee6d397c3c3b9955d086e7f817333', '62.93.167.89', 1756048147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dba4ea14aa3ec2b7aa6b154c84f9df30a3fe73bd', '62.93.167.89', 1756048147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b3b0c5d4f3d38c6e227d588fd8ac9ccf15578205', '62.93.167.89', 1756048148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('28041e20d80a78b5dd43ee0d3761862481887559', '62.93.167.89', 1756048148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a015cc4d3fa468e4dd82a9478af3273d8cc059c8', '62.93.167.89', 1756048148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8bd3a43cb11617095e4a651e5dae62b3d5d91bdf', '62.93.167.89', 1756048149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1f20edb1ff37bbb42cac0013cf06d500bd061642', '62.93.167.89', 1756048149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('33f74f2e3bf780270fc34c01cacb50049cbe923b', '62.93.167.89', 1756048149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383134393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1a6b541f4ea4ebacaad8e1f6df9bbb789a60ade0', '62.93.167.89', 1756048150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('159ecf0ad8c046ba18c8e0c4ee86d20ddf88e1ad', '62.93.167.89', 1756048150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7b4c57b10879a213dcc39df131883de6889c8d0e', '62.93.167.89', 1756048151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7efd65178ba6bd5b44b9f3ae180eb295c4e65610', '62.93.167.89', 1756048151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec89d8034734bd15abaf2900502187bc5a4f794c', '62.93.167.89', 1756048152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c9cccf1b331df9817e72d3e9d170f61e1f3d46e1', '62.93.167.89', 1756048152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a06564221c1c4f1c8bad1750d783e769e90aac91', '62.93.167.89', 1756048152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2c116c719405ea03f0966b1c463da02b6d02b5af', '62.93.167.89', 1756048153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8546d50c1d1ba33370c4b615716d344e154a6452', '62.93.167.89', 1756048153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('575eadf28ce050ca8cb2e8755076f90cccb6cd3d', '62.93.167.89', 1756048154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('36cc2d2de8a5fcfcb7e5177a2739611358b4d11a', '62.93.167.89', 1756048155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('506695ee9989ffb6e8690ce97cae6cf919b0db9c', '62.93.167.89', 1756048155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4dce6b15681c4e3cba815d4e4d8a71665e0bba16', '62.93.167.89', 1756048156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e241ba080e9c20d485d0b68aa7e27dd90e87ac4a', '62.93.167.89', 1756048156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ea5660ec7a871791c1d2294386557f7b9348655f', '62.93.167.89', 1756048157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ded45203a655f33b77cd2c6441bea8c83e48a55d', '62.93.167.89', 1756048157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dba55acae18de434587263581f8f6264beabde81', '62.93.167.89', 1756048157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ce13d8fec47743996807fced235bba278425b3d1', '62.93.167.89', 1756048158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('16722778f1fc4c0275f59e41ca97475efcdae2f2', '62.93.167.89', 1756048158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c5f20817eba5c3cd920125e486b18f41a9bc53a8', '62.93.167.89', 1756048159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72d972e6fa56be762f77d2b6e43b2e6b6a0fe220', '62.93.167.89', 1756048159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('26b12573d0a9d3683e090c0b88bfa7c596c9a26b', '62.93.167.89', 1756048159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383135393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d231f26f887273845813f00b722dbbdcb24ebfd6', '62.93.167.89', 1756048160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a4044fef04c76beef0de540603def7c960c4f67f', '62.93.167.89', 1756048160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a8f2fcd114f9728f4dd652581571df3c4d1cf2ff', '62.93.167.89', 1756048160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f637425900c2b06f8a5fd6924eecd8e0b230c587', '62.93.167.89', 1756048161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('73691b34896dcdac4e37fe90acde487ba91e41ef', '62.93.167.89', 1756048161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0ab9159b90a120bf3cb092eee5880018e0a0d762', '62.93.167.89', 1756048162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b6cf7ac8d6e4478e9209a399be34c9ee49fb7b55', '62.93.167.89', 1756048162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('baf3ac49b863a9698c3042bddb5d2ff4833f68f0', '62.93.167.89', 1756048162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c7434a2e690128821d481ce17a87b478cb550bea', '62.93.167.89', 1756048163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bad4c56fda6fd052b903d1e881612c4b549a5b44', '62.93.167.89', 1756048163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('06f93e45ef258e68deb2022c3feddea7aa74e476', '62.93.167.89', 1756048163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7dd9bf22a126b2675b6de3a13b26c52963456615', '62.93.167.89', 1756048164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a84477ea10ec1f755abe350ccc0d4e9c94aa5deb', '62.93.167.89', 1756048164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f4fd92ef0e498ebf60435a225d95df5d6ac5d4e9', '62.93.167.89', 1756048165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e791b43e5715eeed36e5ddf481aac5b84b6004ec', '62.93.167.89', 1756048165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9265f530cda31d003ae931e27250d446d77eae7f', '62.93.167.89', 1756048165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e89a8b1fbadff2b3e006e647b28ec56f174788a4', '62.93.167.89', 1756048166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dbb8e5663dc49ca2c270d979e87fe18b089dccc4', '62.93.167.89', 1756048166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cc4a7cc7cdbccf7c5e2e1cce125e85be271a87fc', '62.93.167.89', 1756048167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c81a83a00c082cabb1dd6c900ec3653f881a4ca0', '62.93.167.89', 1756048167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('61afc9b6ad415c669222e21dd88461d917e72088', '62.93.167.89', 1756048167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e281125e7c29017beaa24c2441e3449080a596c', '62.93.167.89', 1756048168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('68f91e38a36dd4ea06c6c4a54fcca15d219d40b2', '62.93.167.89', 1756048168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58bc51b687257f44bc5d108f1d2d0e8b29c7ba71', '62.93.167.89', 1756048169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21dbdf23b63bb421f73b63ff7395f7c8c2e92066', '62.93.167.89', 1756048169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383136393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b9fbe9c47af5feb5758d337cc7dd333dfa6a71e', '62.93.167.89', 1756048170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ccce131ae7f91fbed987176a314c385d96ad3c1e', '62.93.167.89', 1756048170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('209a72105fce5f7fe2c66ed11620d61b993ffa43', '62.93.167.89', 1756048171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('90c5a2d810f6d92c5eb7ebc1e2bc28d55a0a21ee', '62.93.167.89', 1756048171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4adbfd761088943f6b3ef82f50e17f8a99d6a5cc', '62.93.167.89', 1756048171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7a1934502401973d24b9d7685a8f79b4877a7110', '62.93.167.89', 1756048172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('13ef6ad90f70bd78daa3bd2a35443a732cfd4b7f', '62.93.167.89', 1756048172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a5ab013eb57627a3dcab7cacdd1e8bce806c45fc', '62.93.167.89', 1756048173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5cf1fa9d125edfc0ec5cd95f32685e249aea70ba', '62.93.167.89', 1756048173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c0d419674e6bf75aa96fc901b76dc9fe43c20ef8', '62.93.167.89', 1756048173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('780cd7998a6e058271efa8eb0bb49fc54f582a3b', '62.93.167.89', 1756048174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58808eb3eea8bb37b8f167d48db6f098ee68eec2', '62.93.167.89', 1756048174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3d4f74203c5443191a7803d15abf7732071e1566', '62.93.167.89', 1756048175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e2a30084c148609954a9d72fc63d80500d267ce3', '62.93.167.89', 1756048175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('273e07e35280d55b969ac9cd738962721ad0fccf', '62.93.167.89', 1756048175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('582591db4dfcf7056c37ccda58722442a93da311', '62.93.167.89', 1756048176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('644fc8209a487bd3890dfc382b00d77b0eea9edb', '62.93.167.89', 1756048176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('17b1ec8f4b38b10d1b50a8ab6fcfc5fe5c8e7615', '62.93.167.89', 1756048177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('84586c95243bff3ddb3438ccff8d33482c1d1205', '62.93.167.89', 1756048177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('df2ef759f304251341ab9925ab479968910a5b9d', '62.93.167.89', 1756048177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('36286a2f86cf009fac24cff71c92ae7c7f3d564b', '62.93.167.89', 1756048178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3ee602a70c6035edc2f24f2424c8bf75117784e5', '62.93.167.89', 1756048178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8f4918505b329e7436469a5c14f0069c4d66faff', '62.93.167.89', 1756048179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dd23c71677798ae925e7abffc82254eb1ba0073b', '62.93.167.89', 1756048179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a19bae0f995fc8b7c07573ae3dc937332ac0af7f', '62.93.167.89', 1756048179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383137393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4235d726ce615d3ef5fc49474088dc6551a5358d', '62.93.167.89', 1756048180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6a81319cea19d9ec76f60948959f8d1b5b4da74a', '62.93.167.89', 1756048180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b81dda905de2fbb755cd7fb1636b8dfa42908e6', '62.93.167.89', 1756048181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('412cbab0670babd1609b82107d5c1591f559b61d', '62.93.167.89', 1756048181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7e5655518aa2c9c5861a3d95e31e5028916efbdd', '62.93.167.89', 1756048181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('dc202be6ac1da5bc1f5a6d996dccc032682a85db', '62.93.167.89', 1756048182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6d599d0ec55379103d75c0cf02f4b246fe33bd10', '62.93.167.89', 1756048182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d19073b20ba7cf682643cee914090b9218276efe', '62.93.167.89', 1756048183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fd42e08ebfc9d05c5348821e031e3e7d8c46f831', '62.93.167.89', 1756048183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6e8efa85e67b08ab1c443a999076d841177a8ba0', '62.93.167.89', 1756048183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e7f9df650186bb50e7a6f2299c8798b5f9dd5d13', '62.93.167.89', 1756048184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('56800369542f07febb5a7df664d5386e34f0b91b', '62.93.167.89', 1756048184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('11862940848c25df8ff4fb6aa5a601c384f65a6f', '62.93.167.89', 1756048185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('07466c975fe8b060bd4d99a4bae31659398ec043', '62.93.167.89', 1756048185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('70a10ecb8ae14bc97974600cb5a7583084396d81', '62.93.167.89', 1756048185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('66a285e2e520b1958bc61420491385d2c94577a2', '62.93.167.89', 1756048186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('03069b3c49da22887185ebeb9635e5059a242542', '62.93.167.89', 1756048186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dcf01600dfc541545ec0f7db14b6053fc02c2827', '62.93.167.89', 1756048187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7016eb02bcef0cca4dbea60dceabb90b6b64ec66', '62.93.167.89', 1756048187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('90c6c12e55a4fc37c8ac16e1086c45e07826367b', '62.93.167.89', 1756048187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5879f7485cfd2a59112f8c5e01cd106df2469178', '62.93.167.89', 1756048188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e4f860d0b5eb3629c444544663e40375d4698bd', '62.93.167.89', 1756048188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('680ef72f7a4d4c10e1c44c1453516237d80b2b01', '62.93.167.89', 1756048189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('43a75f81a00944d1ca76668bd4e7afe356cab8eb', '62.93.167.89', 1756048189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383138393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('00bb0abd375c9a0fbc0c1914b13f5afc4aaf72d2', '62.93.167.89', 1756048190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2d666c1293a4f7de243a954ca3ddf32a2d746f51', '62.93.167.89', 1756048190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6bc47b3ac35fc36ee32d9ed87b284983d64b4527', '62.93.167.89', 1756048191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a338e7763122b1e77a9dcbe03e7cad666cc5c57f', '62.93.167.89', 1756048191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2a1c2dd7790ef0bf4559c9123be0757147043e8c', '62.93.167.89', 1756048192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('18dc44d985ef0ea0525e7fc0ea2cb2ee9912c547', '62.93.167.89', 1756048193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d31f523090efbddcc7b9a1ff19560370a322bd5', '62.93.167.89', 1756048193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('146dfa0820b96e4f81e0e490c19d8b00139c5338', '62.93.167.89', 1756048193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b7786ba2046806bc628c6a1d16a04209ea272c26', '62.93.167.89', 1756048194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6c8351e144a331eb7a8cabbcaceec69a64641187', '62.93.167.89', 1756048194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1755dc77394b2e22131fc034fd421f66eeefedec', '62.93.167.89', 1756048195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('49944bb21ad39e7740f6ef4ef090e643b1a6c0e9', '62.93.167.89', 1756048195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('76988ec3a379b872fe01edcd7300e96f9d0b22c6', '62.93.167.89', 1756048196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fa6c9274e3953e4786eb12782a7a47758d462f4c', '62.93.167.89', 1756048196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f9a9bdbebb9b53f6bd81efef2b5a57c2037e280f', '62.93.167.89', 1756048196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f82e81677e942a2789fd20b06dfa83eaea2065f8', '62.93.167.89', 1756048197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e967b55e7b65e6c7b9da2f86f525188e3d5d148d', '62.93.167.89', 1756048197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('014b4595b4701a35c600e007af8945ee4c2b2470', '62.93.167.89', 1756048198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('23ed8ea8bb84ef58d7cfa39a39b7b2de214d000c', '62.93.167.89', 1756048198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f5e7a9bac27bdba7c8d24efaf9b8081e71f2d729', '62.93.167.89', 1756048198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fc3c50c5893747b89aa48a2a1d4cdeadbcc2c9fd', '62.93.167.89', 1756048199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383139393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('689ea569ba42b270ec694791c9c942f7f574bd08', '62.93.167.89', 1756048200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ec4cdd1dfcdcbdd4a3b538a582be193213f3a260', '62.93.167.89', 1756048200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e54a9f64713686d2caa80fe809320946d303dc93', '62.93.167.89', 1756048201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2cf2a013f86f8bc9e2851d73335b3239dbd43680', '62.93.167.89', 1756048201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('663c8401cc1a7ec8baaa3c50e58758369817fcca', '62.93.167.89', 1756048203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8814c2dde724117b50eab93359d261c1c81118ad', '62.93.167.89', 1756048203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e26efb52199e078c486259e8461435889f79427f', '62.93.167.89', 1756048204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('38b2ce03bc69b24722f95918eeaa098833c21d58', '62.93.167.89', 1756048204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('96ad85c17410984abbd562ea729d6cb1b319852c', '62.93.167.89', 1756048205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b84b09567fa25d51dc95be7409c224fd7acc6c5', '62.93.167.89', 1756048206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b49d5e597374016b73365f5a4aadee740d306df', '62.93.167.89', 1756048206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('23127553ba0c8343266aa8ba65981473d11b5ea1', '62.93.167.89', 1756048207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('53bbde527d5978fd2c3f10c65ea9dc633be81f8b', '62.93.167.89', 1756048207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ea82a526fa794bfc93124a4dd20ebea98de8037f', '62.93.167.89', 1756048208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0e0d373265a43e2839d2e0cc8ae8da6fb3bc4c18', '62.93.167.89', 1756048208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4e78e72283a48fb1ace7952eb159d04ed5f377d2', '62.93.167.89', 1756048209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('58abf8f2d70b7aba6efded2288521bf0d033eb95', '62.93.167.89', 1756048209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383230393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f67b7263b724190819a7dcf7f821394ff8b906b9', '62.93.167.89', 1756048210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('47a89b68967918b5fa43b9a88473183aa3d284b7', '62.93.167.89', 1756048210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a9f32b43766e37481fae0c1ac76a325940d6346d', '62.93.167.89', 1756048211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('51cff82d97c3baf1d6f2e9e216b67e4d84282f4f', '62.93.167.89', 1756048211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('99b7a94b4ef4ebccac60890dacb4204d9aba9bee', '62.93.167.89', 1756048211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b49052eaeaf411cfd0766140c105f9f82fb59e7c', '62.93.167.89', 1756048212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e218443076e865f2847b04a6974f03a907983294', '62.93.167.89', 1756048212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('79256c7cee3aa8f4dbc2303100e0c4dc7feecc97', '62.93.167.89', 1756048213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1aefa98a99bb1481bf0fa070e577927fa2e7e78e', '62.93.167.89', 1756048213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('718ea33828f7ce1f7f370906b47bd2baabed9b4f', '62.93.167.89', 1756048214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('befc757117f6ad29528714549197bb9b84db3a54', '62.93.167.89', 1756048214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5e86a3518043204c438a0e3302178c8b1e12d010', '62.93.167.89', 1756048214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('548de83465dd62e68988f564025d7a4d5720192b', '62.93.167.89', 1756048215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8128652200a8fa8d8bcfedfb976dc72d1da7fb19', '62.93.167.89', 1756048215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91cabb3aecdfb2279d557b582d14bcddb39006e5', '62.93.167.89', 1756048216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('660b69eb27734a5afb8bde341b71c35cac787d8f', '62.93.167.89', 1756048216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1604d5648e219a33bbb9c400c68c62996828b343', '62.93.167.89', 1756048217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('131f0839d6613c234241fa8b1de4b8e946a880ec', '62.93.167.89', 1756048217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8ee56bfa5180532ca1cc1ed84d11f9ba0cee6ddc', '62.93.167.89', 1756048217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bb8dc8b9edff024c1fe784d15226d9217b573d47', '62.93.167.89', 1756048218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bfedff9b8176a14030adc334d94362f6b6dd77c3', '62.93.167.89', 1756048218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('93358b9d1e7c7462de1e13982dbd6a97d59c339b', '62.93.167.89', 1756048219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a9b0d954dfb08ffb3e7e0ad1cdfb7753f9f31ad9', '62.93.167.89', 1756048219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383231393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bfb53f00d56f2dba11f8321cf87fffc2e7ed6cf7', '62.93.167.89', 1756048220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('104d2d81ddad46a4000bdfda2a51c8aa475d9caa', '62.93.167.89', 1756048220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3f99519c794c265518083bb97b9a274032e6fbba', '62.93.167.89', 1756048221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('16061a7f518ecbb34458eb64da31341bc40a6006', '62.93.167.89', 1756048221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('39ce9ad9af7076e1468940b4aada8e1a619fd3c0', '62.93.167.89', 1756048222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dc4e03bdf535cd032a427d307dec4bcfe29250ce', '62.93.167.89', 1756048222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c50da16ade67f8256a33d2e3e2a645c80afe458f', '62.93.167.89', 1756048223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fdbbd2e4e88c96a0f199525e9128c7f5f7254d92', '62.93.167.89', 1756048223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('09a2e2af152a4303f1bee8119613a6aca772fabe', '62.93.167.89', 1756048224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9d490bf1e33c14f00c16be3347c5267b8d7b99f7', '62.93.167.89', 1756048224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('280697875238f2509ff320f79553046dd7bfa667', '62.93.167.89', 1756048225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6ca00b0a834cf2022f90300c83dd7231db711366', '62.93.167.89', 1756048225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5abb4019550ad50ae0c5f28103fc4367de1e3b71', '62.93.167.89', 1756048225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bda2476a190291a75732d7e06bc431d631eff752', '62.93.167.89', 1756048226, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('035db2afaec1bdf3650423f0f900a4dd73219cc2', '62.93.167.89', 1756048227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91678c7f6edc5296c77d581906b99e71860bd22b', '62.93.167.89', 1756048227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1f11df7d9d78424fdb4ba81c115d2edc11ab5f2a', '62.93.167.89', 1756048228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('09c6e766f03af7bafdae8f1fe92e3dc562dc3c20', '62.93.167.89', 1756048228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72959229dbb8a85fadf98ea48508e2fd857fc57b', '62.93.167.89', 1756048228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f4a8127aae16d6dd5c025c210d4221cac0e37a05', '62.93.167.89', 1756048229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('253f4d305c1d3d0b72e85dabb880a54d469a565f', '62.93.167.89', 1756048229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383232393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c76a2e83e75290f950d7a7e6d5ecf1dc80cbe8e1', '62.93.167.89', 1756048230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8bbe1ed02291e458e83ffa7d8fc29b86db1df413', '62.93.167.89', 1756048231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8dc84862291fd64b7b5412d4d098875e5aefed66', '62.93.167.89', 1756048231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('aef67013b8725b9b10128ae5c6e5876dff7ab743', '62.93.167.89', 1756048232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fb6c348a4b6c5ce7dbfbb9e8502ef030bd76ef61', '62.93.167.89', 1756048232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('198e0654e2acaf64e04b38a2dde98699eb78eff6', '62.93.167.89', 1756048233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7e43f64c57debd2272f1642965c88d6044ccaeb4', '62.93.167.89', 1756048233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7ae48cf11c471cd5890039afb3d7d0f8219a4ee7', '62.93.167.89', 1756048234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0838af861c7bf48c12f141cb2a20ee1d79bb260b', '62.93.167.89', 1756048234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b4d2d4c9106e5dfd1f3f094dd07e0d9e7d2a73d0', '62.93.167.89', 1756048234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('163db93460f32b144b554876529d626b30d0eb5b', '62.93.167.89', 1756048235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e56e6af0fdf933572d0236a90be53db29af5bda8', '62.93.167.89', 1756048236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2e8127b4b3116d318a0d53a07179ca6f16752fd4', '62.93.167.89', 1756048237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b4f7a4491a23cb6d3054afe6dbcca025fc4d4180', '62.93.167.89', 1756048237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8c96ac1ff0a8cff18659b1fcad450fa44b1833c3', '62.93.167.89', 1756048238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8eb9a7b8cc398efe51c53c70a75446c1cd8070ad', '62.93.167.89', 1756048238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8abd52aba621dc8ee6033fa55b80caf1ee77bd7e', '62.93.167.89', 1756048239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e3bf389af6e7db129989760bbc1705313092319', '62.93.167.89', 1756048239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383233393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2fa0665f8f3eda30e9b62d919fba7899d04a4536', '62.93.167.89', 1756048240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('62d8fdce089326352e214e115ae8d104aa4bdf70', '62.93.167.89', 1756048240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('22479ed5214c098c9aadfdd6fae5bb29ffcb9dac', '62.93.167.89', 1756048241, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c14080090367e1493bfd87973a44596cacbe8c35', '62.93.167.89', 1756048241, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8d3e97f9fcd8b0240013aa4082b8b0aa0487d0a5', '62.93.167.89', 1756048242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('8a8174cccbbf31d2e6045cd6c8ea36dcdf5e2e32', '62.93.167.89', 1756048242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f253e0d90de65e4e3a2e4323604f04f416320acb', '62.93.167.89', 1756048243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a19c5eb43eab131fe29a8347f7f8fa002b6eafa0', '62.93.167.89', 1756048243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d79d609b7722f5f914cf1c3d337c731d8bf08ceb', '62.93.167.89', 1756048244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72ad726defa2a438ca86739491e662d66d1b0397', '62.93.167.89', 1756048244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fe9a4e69e233af18f9ca2b630475bd72983a14c1', '62.93.167.89', 1756048245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e694b3ec8a6e8eba2ef86e36e597c7885e4e668', '62.93.167.89', 1756048245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('13877e3a907f901489bc257fd3a156f68325bc5d', '62.93.167.89', 1756048246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1732584da5864521a00dd02b8155b6189c004fb9', '62.93.167.89', 1756048246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9ba56c25857a3569eadc1386e93845a155051c54', '62.93.167.89', 1756048246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dde3de8429620b349c2592318276f56c8ef789f9', '62.93.167.89', 1756048247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bc1f316451b70330dcc3e195d29e6dc430f2cffe', '62.93.167.89', 1756048247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('90e59cc46c2a01d06c636381821f1f0c7b622257', '62.93.167.89', 1756048248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('afa1ebd30f639d54c8b6be2123fc8ec07c74f575', '62.93.167.89', 1756048248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('428c6c4e2d568c560b53ebeb2c5d56160ed280c7', '62.93.167.89', 1756048249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8de776345be94fe9e461e9a4fd5f2264ddb17efa', '62.93.167.89', 1756048249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91fa52e27047cb4e8408bf6c8c787fafe9cc1d3a', '62.93.167.89', 1756048249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383234393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3f8f6acafa6a6368e1048cf57341107bb15e3987', '62.93.167.89', 1756048250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('49c4eec63c29cbd547f34fb20e59c022bd9b6354', '62.93.167.89', 1756048250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b372d3206bded16be622d348da13e1421063ea1', '62.93.167.89', 1756048251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f068164fc9ef7a8a3df8b8e16a4d0bb60227f2fc', '62.93.167.89', 1756048251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('81dcbf5698b5d879a46553094afcb4c5c1f2dcb1', '62.93.167.89', 1756048252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('86f330e333e6d2adfd5c196290373827517f9bbc', '62.93.167.89', 1756048253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('448d3d0bd0201714a7536a970e750b1dc5759d22', '62.93.167.89', 1756048253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('53c5f9d722ccf5453c10d5628b6177f6518b1d7f', '62.93.167.89', 1756048253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9005b88dbcb0ce3621de0330860911e84c418e65', '62.93.167.89', 1756048254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('601f0fc18725d595ae7eab760cba002cc26e8f1a', '62.93.167.89', 1756048254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cce56366e9b33f888352a8e5557c09215b690f19', '62.93.167.89', 1756048255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('83ab97f58631a4d6a08637bb77aeb2278d072160', '62.93.167.89', 1756048255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('47792abc968ba2d1d888b7db8c8255967d517ce0', '62.93.167.89', 1756048256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('243ff9c2d4fe89bb5d33e99a71288f243f5c1b48', '62.93.167.89', 1756048256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('dd69932c979b3b086dec481d3205cce697b688af', '62.93.167.89', 1756048256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45c8497d8bee7e3885463db5eaa6374c508955ed', '62.93.167.89', 1756048257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('cac5ec9cd668fbf49b2ad9e1cfe166c49a6cd658', '62.93.167.89', 1756048257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f3f12ef3920033774c215feed930c70cc1eadfa0', '62.93.167.89', 1756048258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e5fa792906d14ed9ab56bc561c133427c85c4752', '62.93.167.89', 1756048258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('df2eba1bd344f9fad2cd9da520b9c180740ea6fc', '62.93.167.89', 1756048259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('bb52b91dd8cd65c82bad0a8fd1985e550563cce7', '62.93.167.89', 1756048259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('302075871dfcad534fe5008e0b8f003392163308', '62.93.167.89', 1756048260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383235393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a41632fd3f613b70778f4243019e0af442186bcb', '62.93.167.89', 1756048260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('46d56c4c72eaf8a6891fb96e4e7e2bbdc4e0e4e7', '62.93.167.89', 1756048261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7d7795e0aa7fdd9f9b3268b341efa1a52ff8143f', '62.93.167.89', 1756048261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0f22dde5c1d0ccf60b27977bda82114186658a38', '62.93.167.89', 1756048262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7d21cf99036dedb600c6d24ad38a498e6fdfbcdf', '62.93.167.89', 1756048263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f5979c194bb429707e14cd6e8cb153b7fc4ca89a', '62.93.167.89', 1756048263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8e39e3effc37df23fcc806ccb40231bbafd329fb', '62.93.167.89', 1756048264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('092d94ca295b700eb486fbbe813345e223aa8bbb', '62.93.167.89', 1756048264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a7958298b0aa15f35f118f26021d42b848a2607c', '62.93.167.89', 1756048265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f20888936f7ad3c7c5d1372714e9892f0ec14682', '62.93.167.89', 1756048265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8220180473ebe45eede0aec29791cd0bdd11a978', '62.93.167.89', 1756048266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('527195fa9f16a742c750bae105f6e919d60463fc', '62.93.167.89', 1756048266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f6cddb3593bb5bccc772c434303e5ec7648c33e0', '62.93.167.89', 1756048267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21062c5317721adf5b77039e3ca320dd4a459f03', '62.93.167.89', 1756048268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('df0ace131f6067add1e00181c903d03915021562', '62.93.167.89', 1756048268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('91449ab1973cc3c4bad0d78dcfada5eec6b8c310', '62.93.167.89', 1756048269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('84074f52536c092f4b12c2f18bba63bcaef780b5', '62.93.167.89', 1756048269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4700eb0887f385ab4e99f1592b44de7e54f95c74', '62.93.167.89', 1756048269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383236393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72614eaf886730dbf79b8d668f438cd8649c6ff6', '62.93.167.89', 1756048270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('72b5de02d268df3bf51c7ac57a8ddcfbe31f5f79', '62.93.167.89', 1756048270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e013a4439e0085907b2aa289ea16b623b8cc10fc', '62.93.167.89', 1756048271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1c245650b15da6fa391ebffc5560a6e9f1515116', '62.93.167.89', 1756048271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('40a1c3d2fa08534c46097d774fd811bd64d390fa', '62.93.167.89', 1756048272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ede9c3d5444983843e25fb7631e6644a6e7db3c1', '62.93.167.89', 1756048272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('36e5588d4fbcec2075adf3331a0d2eb083e174da', '62.93.167.89', 1756048272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('856a8541e0e6fbdac78cac096017f83899aceeb1', '62.93.167.89', 1756048273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('020fcf3f736eb30481db423cb6472fc4daaf0df3', '62.93.167.89', 1756048273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f561922cc0f10e567c35469772706b6d6dbb45b6', '62.93.167.89', 1756048274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f025751f198a756d39e325ee33b8834454e25e03', '62.93.167.89', 1756048274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('45c9c7029c529216e4eed8cad9c0b5da25b5c95e', '62.93.167.89', 1756048275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1e4a5fbfcdbdd1dfc1bed26fdc6127f8b2fa038d', '62.93.167.89', 1756048275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ccfaaab9b6bd57ad746cdfc9b13a4ab6267d2dd4', '62.93.167.89', 1756048275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('189fbe9b5f939c6c64e2a1bf79b5f560e8c01f6d', '62.93.167.89', 1756048276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('89421ccafc8c05e8a626f6ade8e466f1946e6fd1', '62.93.167.89', 1756048276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c578aafbdf0fd9037e42e4f20a865dcef95ff834', '62.93.167.89', 1756048277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ccac83e63eb54f0e5509958bb6df3654824473d9', '62.93.167.89', 1756048277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad7295aeac320e684938882b301fb35a557f44ad', '62.93.167.89', 1756048278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a56e22531b5b1ac495266b6b479d5c581766e5c2', '62.93.167.89', 1756048278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a19e17da73d86bcef27b3c3c13fa0e6c2bf1e1cf', '62.93.167.89', 1756048279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6d1fa49dd1b21d9ba6ef911e5052ffcac1b5720a', '62.93.167.89', 1756048280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383237393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2e930af54bd5225608be1539a245062ffd9c315a', '62.93.167.89', 1756048280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3117c31c006fd2fc0316b11ffc08098a17f26a3f', '62.93.167.89', 1756048281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a292ff0c8590d65318f0f9d0d09a047e639ae321', '62.93.167.89', 1756048281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d0f0a4639d3c055c0a2d925744066abe8fff622', '62.93.167.89', 1756048282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('30b4d4cd9b4eaba65903272e48c97ca7fa0fd475', '62.93.167.89', 1756048282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3f1c869e84eb11687e8b6976704df8714fe16195', '62.93.167.89', 1756048282, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5a7e6ee9e2d7d4ebeb06bffaf6e07b015ca739b3', '62.93.167.89', 1756048283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('061ebe3f64acaf26d05c9e2e59bc48b1e82cadaa', '62.93.167.89', 1756048284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('aeeb1a838663eb2d0b0c3a4249a7a100b2565001', '62.93.167.89', 1756048284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b403ee2d6b45f561e7e46750ab5c88ae290a3f5f', '62.93.167.89', 1756048285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('a0b9058f5a6718fea97b4a2e8b6208305b1d6d21', '62.93.167.89', 1756048285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('510653555084e07b264f6268957d2dd5b3e23199', '62.93.167.89', 1756048285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b21f0d1d7f7b2a5960e7ba88ce1710d494e1036b', '62.93.167.89', 1756048286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c14061c2fb9d224460201205095889724a5a2db4', '62.93.167.89', 1756048286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e7aa798d796fbc733f081c1edbbb2b1cd5214098', '62.93.167.89', 1756048287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0d9f5a66813edd492161c14790c5775002a6c685', '62.93.167.89', 1756048287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2b9f154a1b5b23f8a79264c63ca901f2c48904c6', '62.93.167.89', 1756048288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3015d67f371f60c15eb72f600276601ccdb66a1f', '62.93.167.89', 1756048288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3f29860f3c6c850971ed4a1220be9ed0eaf927ad', '62.93.167.89', 1756048289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383238393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fe52fcb75db785bfb93cd06b7bce0062385cf6b9', '62.93.167.89', 1756048290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('86ba83bafc0eff7765d06559b13682d838b758eb', '62.93.167.89', 1756048290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3b24723cc15aa142b81a34984a22b7caeb3df0ea', '62.93.167.89', 1756048291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c53771ae9e7fc59e60a3609457dee22d2c6ce103', '62.93.167.89', 1756048291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('13650e778da39ed4241c3e3f55d0e536eef08974', '62.93.167.89', 1756048292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5a3a013f93ea47bba8bfb7971d48f42eef898e57', '62.93.167.89', 1756048292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('997cbaaca048f5b5988443246ae3bbcfc36c06c4', '62.93.167.89', 1756048292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e0a6954212abcb1fb0dd91b8c09fc9e058eb53df', '62.93.167.89', 1756048293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3ac5696f06cd94504cfec3057c5412bfcec89db5', '62.93.167.89', 1756048293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eaee3ccda4a4597c2b47f828bdd0066a3e1b7bc8', '62.93.167.89', 1756048294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('57e1caa68f647801614c0029176a0cc6b8c0938c', '62.93.167.89', 1756048295, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('28da01b27806062fd9988242d334bffd87a73d22', '62.93.167.89', 1756048295, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034383239353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('38229297e07f0592ae326657a6845b957de8858c', '50.6.197.32', 1756049497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363034393439373b),
('a11989bb20fc3217bae07f2be998f24fc18ce6e4', '50.6.197.32', 1756051332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035313333313b),
('b1316c8f7af322c2046d0de058d167292d69da89', '50.6.197.32', 1756053102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035333130323b),
('86aabf6707359c73067612c5dffcac00d3293f46', '50.6.197.32', 1756054953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035343935323b),
('cdf15e1c6d1d659f98f37852f24adb5708d5bb40', '49.113.92.219', 1756056466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035363436363b),
('7aadc716e10748310cb1dd9d53078a53f2e027c3', '49.113.92.219', 1756056468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035363436373b),
('dfa892365f478cacfe72be727a12d6a1e66a3b31', '50.6.197.32', 1756056697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035363639373b),
('34450002016ee2dc5ceb6059fe491bfca6f13c3d', '93.123.109.225', 1756057346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373334363b),
('e6f3e4af20cbb3403b290f4a7c674265317d58a8', '4.227.36.67', 1756057529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373532393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4c8054f3a53d18ecad05d867fe53b81b551e064a', '4.227.36.67', 1756057529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373532393b),
('d625c0950e8f97133a4f8e4d4649e6e5a8c380b1', '93.123.109.225', 1756057629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373632393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fc3a8576afae070f931cdcaeabc92f917d91d8ab', '93.123.109.225', 1756057629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373632393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('817344ae8d5678665ff2a9403a2e758ce80921d8', '93.123.109.225', 1756057634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373633343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4ce8381966d43e2aa46abb5399aadbc49b91b95b', '93.123.109.225', 1756057634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035373633343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2d100e9fe5c01a143baac825c32458bbb2748ac4', '45.141.233.208', 1756058325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035383332353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9f2d4db35761555c8fea733e47774f57cc691fbc', '50.6.197.32', 1756058535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363035383533343b),
('43ebd3f59c9255278ff1d340b645b968d5f5cb2f', '50.6.197.32', 1756060300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036303330303b),
('ade770f901cfb32fb10a8198439801b1465c42ff', '50.6.197.32', 1756062137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036323133373b),
('824e3ca1d4df4adc1e1f931bcfb389d30a64de6f', '50.6.197.32', 1756063899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036333839393b),
('375b8fc7e34b9fcd5ff24868785b611f5cfd6c6d', '50.6.197.32', 1756065762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036353736323b),
('40fba4cf655f677333a03f147267ee6395784444', '4.227.36.67', 1756066254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036363235333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b07b677b2c1f50b5cde6c46218a8e3cb491c4a9a', '4.227.36.67', 1756066255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036363235353b),
('fd46932e9bcd8a6f1f690e3b84658aafd63fb784', '50.6.197.32', 1756067500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036373530303b),
('6203da76440e637b4bd48ad1ba032ee98f01e31a', '50.6.197.32', 1756069331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363036393333313b),
('a868a1e9ff0b7e0126640eed2344b437329ba9ad', '50.6.197.32', 1756071099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363037313039393b),
('bb9c086f176e95b66577fc045358cb26fc043140', '50.6.197.32', 1756072934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363037323933343b),
('8ff2bfae3289047ad3b1aa975ca7082d3c280174', '50.6.197.32', 1756074701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363037343730313b),
('b1a8758d420c0834da71c86cd11660847d9ad942', '50.6.197.32', 1756076561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363037363536303b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('2ca79a96865f91a6a5bdd5f6cd3a2b9642b3cdd1', '50.6.197.32', 1756078300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363037383239393b),
('10b5566dcd2e4f48213f92cdf2e8f64b26c5c816', '50.6.197.32', 1756080153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038303135323b),
('de2cbf6f053993bfed9fac49637bb9e5ff26e8ff', '50.6.197.32', 1756081900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038313930303b),
('2d4eefd5660d541cf241832be7e2815351f60516', '50.6.197.32', 1756083733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038333733323b),
('fae2c2877b9a2dbc0dd71c34baf7e3d9f5187e3a', '50.6.197.32', 1756085502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038353530323b),
('ad23768e0bd2c3292bf6fc2568daefd376788998', '4.227.36.67', 1756087004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373030343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c5ebd29852a77c04133f84b37d8e3b9d98c4526a', '4.227.36.67', 1756087006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373030353b),
('18b9702131f163c0270baad870b61152c5abf2f6', '20.171.207.161', 1756087007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373030363b),
('321df67d277a7f8cda123242b03260dba8602401', '50.6.197.32', 1756087363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373336333b),
('bf9a2589b3ee4855d6728050b5f40e884c21228b', '4.227.36.67', 1756087771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373737313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9b98e2032d3114dcef03e4ed49d7bbb261c84e74', '4.227.36.67', 1756087772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038373737313b),
('861becc60185db0053128e31f2a1c2fd6de0625c', '41.59.2.192', 1756088929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038383932313b7265717565737465645f706167657c733a31353a2261646d696e2f707572636861736573223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f150294c42b443bdd3b2db8171402b1c490b826e', '50.6.197.32', 1756089102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363038393130323b),
('c222fbd1426574fe5311dadcd433944a3e816c21', '50.6.197.32', 1756090960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039303935393b),
('15dddb608769a5fed3684b2227d2e0b629205691', '50.6.197.32', 1756092702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039323730323b),
('c40b94db5809cb6d0bb627b561d0fc0521cc55cc', '50.6.197.32', 1756094532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039343533313b),
('7eedd1818cd720159d69345214c4724fce2669da', '50.6.197.32', 1756096303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039363330333b),
('18a7c3d16b986b1e6d89e71db093d41042bca166', '50.6.197.32', 1756098132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039383133323b),
('3a526beab4eeeea2c9f05e5e5bedac6047405395', '50.6.197.32', 1756099903, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363039393930333b),
('137fe088dac8985e026db021dbcd73c675ebe97b', '212.102.46.224', 1756100560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130303535393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('d05003c802ff66907f818f1b8600938094d16b93', '50.6.197.32', 1756101733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130313733323b),
('b622bccb9c8f8c94b6b50ef67721567db4c39943', '50.6.197.32', 1756103504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130333530343b),
('d7d136aa5ea5df244f51d23ff6c3a23170c9c60d', '50.6.197.32', 1756105335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130353333343b),
('44c251f4424a65eb63ee49c1e589135376e8ee3a', '50.6.197.32', 1756107105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130373130353b),
('9d8762637a546a8c6360a7209c616b182c096644', '50.6.197.32', 1756108934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363130383933333b),
('e733e4e7b541f5214bf91e7e53fc0d648554488f', '50.6.197.32', 1756110705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131303730353b),
('5e2ac763200150c0dcb47ff39501e69429e65835', '51.210.120.133', 1756110766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131303736343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('21a882ba7dc2c1ffbe2774baaab5418c2eea13f1', '42.96.17.195', 1756111084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131313038313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('dee0baca0ffc0e0f224c65fc41baad6a0606104a', '125.227.7.13', 1756111403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131313430303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('d0250bcf660f3b5f4d49aa13c07e752bc72a3334', '44.196.119.63', 1756112030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131323032383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f70511e0e3f4ec8c994501a2188bd6a64b217fa4', '5.182.209.204', 1756112343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131323334313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9b0207607ee854817802285116c08f528181052d', '50.6.197.32', 1756112534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131323533343b),
('823c8ef4bf33282cbd4d65adb085a7b8792cc95b', '103.166.182.115', 1756112666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131323636333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('eda3777af94d33d5bc2a9dea360c93121a5c62ec', '185.252.31.27', 1756112987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131323938353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1104da298cfcdd2b34b2e9d8dc18e3357bd47f9c', '103.124.95.168', 1756113310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131333330363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1210d2551fa5be7321fa960f4fd7d7e938272053', '92.114.50.2', 1756113614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131333631323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('692135066b2b2acd0da60e8cf7eb6bf8d21ecc1a', '51.79.250.168', 1756113945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131333934353b6572726f727c733a3130353a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('52de9f981237d120d0489a9436c295bd498ac182', '109.123.250.227', 1756114256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131343235343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c1902e0c77733a758cfcac6e4aed37ad696c5806', '50.6.197.32', 1756114305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131343330353b),
('2c3c70064cff75ca88e5074e0b70902e91dbb9ab', '218.255.162.2', 1756114902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131343930303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('2596130c07f94b0d7e409f1ac167d58e0a9bef61', '203.161.32.106', 1756115227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131353232343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4298acdb99982ccab17eaf7b7fbba2f26cf50e3b', '185.182.56.29', 1756115547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131353534353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4d9d504e177fec17347bda94188b262ff7baf1da', '31.11.36.220', 1756115871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131353836393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('afa3f1beb50e2072353c69cf926d42f1b33bb806', '50.6.197.32', 1756116137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131363133363b),
('4e2c9cf61a62ccfee2e68e470236adb69a95043a', '188.225.9.110', 1756116206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131363230343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1decc1ffdc0975e0026215c30c2f41b3d8f557e2', '165.227.140.18', 1756116528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131363532373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('a07ba65fd7f954e979dfb075f64b2b71de08ca36', '203.161.32.106', 1756116860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131363835383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('055c416a085ebd81a37a947e0c68d4c9f320738d', '50.6.197.32', 1756117907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131373930373b),
('f0fe997bf271847b6a6b20517f7324f859c715cc', '128.140.39.177', 1756118160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131383135383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9a9d0864799317ea177f32777e15ba490b49cb9f', '51.91.161.103', 1756118501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131383439393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f42f4909b14c13e80e8a4387316b05a3df7f1655', '167.71.166.141', 1756118814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131383831313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('278390afc6a3ae22136fdd266125ddcdf90e42b6', '190.6.176.90', 1756119145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131393134323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8573a9e917347be995c28f902e9fe20e5e3691a1', '50.6.197.32', 1756119737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131393733363b),
('5bc0d62a3029a41b8974a58762fb1816e01822c2', '80.87.199.123', 1756119772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363131393737303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('40b3cceb24c9fcda41559a09a1bf55d6cb03855e', '186.209.113.104', 1756120104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132303130313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1274e67e89dc7909c8bf04c2958ec789189fb05e', '65.109.97.92', 1756120427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132303432353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('191e6ebb262fc0a62aaf0eca213fb30102646709', '31.200.244.71', 1756120763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132303736303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('46825e28f2e6598532f4bfaa09de78f8634ba7b3', '148.66.135.187', 1756121097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132313039353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1e3989d5118d7bda8e03be965b0a483238aed09a', '103.159.36.74', 1756121440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132313433323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4463726b49b71d5d1d5ed15e98ad51a5a80a0410', '50.6.197.32', 1756121510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132313531303b),
('737dd02280a3447518c8ce26d02dd9ec701164b3', '188.166.45.210', 1756121771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132313736393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('2f41ad40d3be8de03b939ee48253bb2f10eca3bd', '218.255.162.2', 1756122106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132323130333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9a0ee4fd761ed08c64f7fc9bac214aa8558ee7c8', '31.200.244.71', 1756122438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132323433353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('5928b6ec9e7b70e3e4f044cac9b7c13cc07cfae7', '81.177.135.2', 1756122772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132323737303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('b19a559acd9e273524b9eb0d5678f759d8641e2c', '113.192.8.160', 1756123107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333130343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c7b0d20105585da3ef1c203a4580121c39f3d6e5', '4.227.36.67', 1756123336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333333363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3bf563abfb23d81f56ccbaf621cc34761951f579', '50.6.197.32', 1756123337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333333363b),
('354160c2097072c4c4c05e128f81e703cb342228', '4.227.36.67', 1756123337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333333373b),
('7b4cb737cbe09aae3f648e6edd9aa1b567dfbd12', '132.148.178.183', 1756123451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333434383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('fad4270304838baf665db71669fd8222f8ee9d17', '90.156.142.52', 1756123800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132333739393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('408dc98a27eb72bae46c543ac487b2474925dd04', '138.197.201.180', 1756124487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132343438333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('55ffed4af234d60cc6b4c55e08687cefc8f2bd3e', '80.211.189.112', 1756124837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132343833363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('3f5914e169c67f38377bab182c122c99fa4623e6', '50.6.197.32', 1756125107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132353130373b),
('9d6264d6fada720c6b1fbfc6a5d143aedc840720', '161.248.189.50', 1756125206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132353230323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('decc601bbd5560e24964db7933ccecb388ec6e86', '93.89.232.2', 1756125546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132353534353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('db9ca62cc720a87730dc63bebd24d0cb6b563904', '103.77.207.75', 1756125891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132353838383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('26ebf4347823469520bfae57143584ea507fc27a', '173.236.218.94', 1756126238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363233353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('125a46cbe4212d6b9a2d3e09db5914b2877cd554', '154.29.78.82', 1756126585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363538323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('6620ffbffd46947f6c620d26938738c24c2c7f33', '4.227.36.67', 1756126733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363733333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fa2b0d5e447814c201a2d966dcc348b6c2bab6e4', '4.227.36.67', 1756126734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363733343b),
('c8f505d53143fa943cc3b7e66c3d047254c88f8d', '107.170.66.27', 1756126939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363933373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('da6a5df06bbd4a8b991ca70cf5f80bd65bdcb6dd', '89.253.255.122', 1756127276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132373237343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('b8088206ad034487540ea29436ffc40964d19e61', '50.6.197.32', 1756126937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132363933373b),
('ac27941c451aa81aa95e916e1a8e0dc207aebb7e', '134.209.118.102', 1756127614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132373631313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9a13d5da77568f6558a6344602b8edbc15d4ed20', '167.71.166.141', 1756127954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132373935323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('6a72b5486d6ed518d4df8039f941e7b4b7beb5db', '213.156.43.111', 1756128292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132383239303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('e0a693ed1d4a7ef54e77fc9b48330fc83e1046c1', '89.46.107.133', 1756128635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132383633323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('b69be0a46b52d22940562a95746761ae20c3661a', '50.6.197.32', 1756128708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132383730383b),
('8266cc3b541c1091090d08a9c7b5412431cd1fb2', '185.182.56.73', 1756128980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132383937393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('b6f820a4f3053665e192a3dfa90d0988565388bf', '87.229.65.46', 1756129329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132393332383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('eb5faa8c8ab6318319e196cadce07b1a649931a7', '92.53.96.245', 1756129680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363132393637393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('59ada288907f38aeb7b7fb6a8181f9174f312eb4', '203.161.32.106', 1756130032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133303032393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f8652384a1aef3890bf3e528feaf238805b41893', '107.170.66.27', 1756130386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133303338333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ccae8aeca8761bda093b989a69ee6060fb92068e', '50.6.197.32', 1756130540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133303533393b),
('1dd978cfda2561f384d03dacdd28e32364b722e6', '177.52.160.19', 1756131097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133313039333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('d603e9ce5962744b0e1418a53cefe7f578357783', '125.253.121.223', 1756131455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133313435313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('559b1e8c1149cf02813957bc11ad2b0c9970d759', '217.172.189.100', 1756131803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133313830313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('0bca431968810d53a195c484ea0d2789ad3c8946', '198.186.130.214', 1756132154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133323135323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('a5552136bd14472823c96e2906d0c892cda5fa55', '50.6.197.32', 1756132311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133323331303b),
('a1a073f1836c92d3c23462b2137372cc4198f746', '77.247.109.57', 1756132508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133323530363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('692a391d162b57a48521b9fa05ca7ec933fbb641', '103.173.227.90', 1756133223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133333231373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7b98b1982412edaab459039b549b2c8cb1036e06', '185.87.120.51', 1756133571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133333536393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('008a1955eaa6480f7eec7d35a48d13c75eaa24f5', '103.92.235.17', 1756133927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133333932343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('71cd5dea83f4d1b55a445fe6d5115685beeb422f', '50.6.197.32', 1756134138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133343133383b),
('fc7a65b1c483948b9728f5d2892be734ee6b2da9', '103.177.95.86', 1756134283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133343237393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('eeb78c8289a76efe3ed4702971bafb54a7b46c32', '5.160.146.1', 1756134641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133343633353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4c70b732b1607d862aa5c562ffbc5a8f6277fa7a', '47.236.12.137', 1756135001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133343939363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('39216e8f9d3db768faa411e7077e8559bd9c035c', '103.57.130.129', 1756135350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133353334373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c4644d0f909a87b493e62497c53ec989b732df7b', '185.2.4.147', 1756135702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133353730313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('e3af1bc555744acbf95900d4c09ca0e6fa752026', '50.6.197.32', 1756135909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133353930393b),
('0bc554f1a02d01ee05717a34befad907d9d46200', '199.188.204.167', 1756136054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133363035313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('67f9b0b087b67ef799a00189d51ca61b8caf5010', '45.119.84.83', 1756136406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133363430333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('5d571c9977c8c535df3967db155f9202a47f9999', '50.6.197.32', 1756137740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133373734303b),
('bbc0f110038f21de68fa3923c5fa8992c3d0f128', '4.227.36.67', 1756137767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133373736373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ddde6470056590ef5aa1a9dcb18a701aa3e2af59', '4.227.36.67', 1756137768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133373736383b),
('b9ff83ad4d9005f542226e9039545c976dc8fb7c', '35.176.58.103', 1756139390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133393338383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9c151d82c5684e09122b2146fe081f2f08e7d05a', '50.6.197.32', 1756139509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133393530393b),
('132a25989e5ce8735154cbf91204998d869b46ed', '194.164.54.162', 1756139747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363133393734363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('a8bd5950b1039519fdcf88e0b9ce9160e31848dd', '20.52.16.104', 1756140455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134303435343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('0e71f5214a46155f68cfa93a96c6d891740bfe69', '15.207.50.92', 1756140798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134303739363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('3b05c1c70d7d1ed49ae0fedf1ed380a61cb074eb', '159.89.120.67', 1756141141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134313134303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('587faea85b412b66c21fe4c44e63c0a9b0631de1', '50.6.197.32', 1756141338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134313333373b),
('cf632f7fb69c3e04f9db5966f87ca5a1e3bb0ff3', '88.99.148.122', 1756141497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134313439363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1c9216f1f97d46665625d40c80b046c384d93879', '104.236.74.180', 1756141854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134313835323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('efa4e7015d445c55cb4a68dc3c0faf34210da3d1', '103.90.232.143', 1756142220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134323231373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('59dac9ae2f9656632d036989d097582091c285d1', '113.192.8.160', 1756142578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134323537363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8ee2d0787935d3e153d702ffadb58318deebbde9', '162.241.99.71', 1756142946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134323934353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('452214fcbf02cf3b4c18b2fa8bfe06950522d068', '50.6.197.32', 1756143111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134333131313b),
('d90df3a22d5348bc7e6617183d84893bdad31168', '103.124.95.168', 1756143304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134333330313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c675e486e1040817c8a6ef18b580043087c1c579', '103.177.95.86', 1756143662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134333636303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('1036270c4fe1cc17b603b7cc14b876a6ec979f95', '4.227.36.67', 1756143701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134333730313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('40672e4760071981d34199140204bd9b1748458d', '4.227.36.67', 1756143702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134333730323b),
('ad8ffd9844db2fed145abc1183d6c23c937d43c7', '188.212.34.189', 1756144023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134343032313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('16f5920d201fb55b11768de387ecc94fb5925dce', '45.250.20.25', 1756144376, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134343337333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8c490636b37f03c836b744b99afe31f40e1af53e', '107.170.66.27', 1756144728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134343732363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('2d2e7da948cffb849bf2c935cb6983fcf4fc4581', '50.6.197.32', 1756144945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134343934343b),
('4e2346f105d5b24b280927125cfcd241122b6896', '46.101.83.186', 1756146140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134363133373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('90ba883a66e08962d001d05ef2d34844d5a50f0b', '110.4.45.184', 1756146518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134363531343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ce3483f52f2bc8dda7c3f38331245586c5ebf26b', '50.6.197.32', 1756146711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134363731313b),
('183caac31ecea693aa1ef7ecb738a2a5d046b5b5', '31.193.2.236', 1756147208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134373230363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('cddcf1e3c23fab598b78c4de29fe83ead1842deb', '34.46.107.224', 1756147557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134373535353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('28f9e5648c96476ab44861909a05a4b67d95bbad', '64.23.170.70', 1756147894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134373839323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c4cb41c20392c10c85a9d57c33950878473d8de0', '218.255.162.2', 1756148232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383233303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7d4125731b298363ac3139f3bd91cbf4e692f3f2', '45.80.158.151', 1756148266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236363b6572726f727c733a39303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e7777772e676f6f676c652e636f6d223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('86d0a28967cd7f2e4d3c2c203de51d528c815af7', '45.80.158.151', 1756148267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236373b),
('1def14ffef65690c794fe1bf3855f56330f002a9', '45.80.158.151', 1756148267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6c45ea0f027e146af36811f40a829119a5c73b93', '45.80.158.151', 1756148267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236373b6572726f727c733a39303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e7777772e676f6f676c652e636f6d223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('40a683fbee83cfce7f9b0fcfff62eab877ddb70b', '45.80.158.151', 1756148267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('22aaef7f615ae5ff992e5990e16702d33e93eb26', '45.80.158.151', 1756148267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236373b),
('25fdaaf42adc9cafcc188ed9d46fc58753b95ba4', '45.80.158.151', 1756148268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236383b),
('8f4cced14dacd5d5c0130a9df8368ceaf7591268', '45.80.158.151', 1756148268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236383b),
('b76b7c33ebc7dc5221e4818fa7b943cc6c18b726', '45.80.158.151', 1756148268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236383b6572726f727c733a39303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e7777772e676f6f676c652e636f6d223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d4d051f8b80199e6ee690b57e76a2e5eb0779e99', '45.80.158.151', 1756148268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236383b),
('b5873afba483497a8e47c2692afeb4113bdf3f63', '45.80.158.151', 1756148269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236393b6572726f727c733a39303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e7777772e676f6f676c652e636f6d223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('38eec66ba1688d76f8d4e669598b92ee79ca5299', '45.80.158.151', 1756148269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c84928572bb9e440cf0e26d4b024ce41383c1706', '45.80.158.151', 1756148269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383236393b),
('042b5cc7f4c13e35f9055e289e1c79f3f3210fe1', '45.80.158.151', 1756148270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237303b),
('36fc3ad4f7b8decb25a1c0cb430a9f8f9c57be14', '45.80.158.151', 1756148270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237303b),
('8263c5bc362291746c9d7bffb3885cab16aeb40d', '45.80.158.151', 1756148270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5cc17afd438f1b1d4f461d88fdc97f03db87e919', '45.80.158.151', 1756148271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237313b),
('ce90a6ca5d9da18c611483e73a7f8b468cd05009', '45.80.158.151', 1756148271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('47d5cf6a35c33a082f1b9c8cfa17b45024e830ba', '45.80.158.151', 1756148272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383237323b),
('baf0449d5737b390a449850cf2b42ebdd80c9b4a', '50.6.197.32', 1756148540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383534303b),
('76945d1c8e992940203b3c563a81ab50671ae995', '198.186.130.214', 1756148566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383536353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ddd782fc44dfb828a09395590cff700ea5603419', '103.124.95.168', 1756148908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134383930353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8526cff7afa3fe43d56fea2bdeb4f61945b4a2c0', '206.168.34.34', 1756149206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393230363b),
('9ea8b9e476c5f750314cbd7173a9c556b3f9aead', '206.168.34.34', 1756149216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393231363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('62a0f760e76b0b854ed810945faf2d77e367ee70', '206.168.34.34', 1756149221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393232313b),
('683b9c2775200806fdc6fa584a2b1cc91492e42a', '206.168.34.34', 1756149245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393234353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('d22ed4607a2af8f4178da156f72435bdd9baace1', '206.168.34.34', 1756149247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393234373b),
('fe05deac690b1274b4a3ed49dfc3e739104d3841', '162.214.121.103', 1756149265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393236333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('006f7479fb2824b200d1946041a331d2cee44d65', '62.60.201.21', 1756149604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393630323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('6a8374e1a062d6df8b7f7f7677318e6b14a58ed3', '172.245.155.10', 1756149944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363134393934323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('49461496aaa06dcefc7e37e3a48635ed3203afd4', '50.6.197.32', 1756150311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135303331313b),
('425283ca170252ca7f7a4f4b1ee02a74856a58a7', '144.91.101.129', 1756150609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135303630383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('de201b293e52088121dec969ade99832bb642883', '190.6.176.90', 1756150944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135303934323b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('fcdcfdd6c6da33aaff6ab5ab5d6396a771395a19', '178.128.166.101', 1756151268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135313236363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7a611a69512e1cf9cca190190b28101a2b5e6ef4', '222.255.214.45', 1756151927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135313932353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('60f38d9818ae94c996c5b7f0d2c6139ea4ca48da', '50.6.197.32', 1756152163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135323136323b),
('802a1221efc42ca0c0f80076c441ac50e80f8805', '103.163.214.43', 1756152262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135323235383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('21e33e3226a6caa2628119fff84a6a5b9d2f0a78', '59.110.154.116', 1756152607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135323630353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('31514e2d43a12831ff7794e14350e8ba36399529', '138.117.148.157', 1756152947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135323934343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7dca12d9edc4dbba7adfed021d8593de346b2aad', '149.255.58.152', 1756153294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135333239333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f3248f5b909f5ca8351683bc5724bf32ba13e0d0', '107.130.219.56', 1756153636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135333633333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ccf1cba862fa189cfc98eca77822308428eaacd7', '50.6.197.32', 1756153912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135333931323b),
('ad0db69e03f65d84322d134241d05fb137258cc2', '92.53.96.193', 1756153964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135333936333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('3c77f493246f44f9afe166b4e11546868bb1c9d1', '103.179.56.29', 1756154300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135343239383b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('d8c20c50fe0b7db03c7d561fc4df9dc9c8447fbe', '198.12.246.102', 1756154623, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135343632313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('c34d34a532f2d068449e3d7fd463b7895c03a79c', '58.156.129.134', 1756154951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135343934393b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('63beca32277ca3b0ee91fb7b78b8dc5c86c9d0ea', '198.12.247.139', 1756155265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135353236333b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('459bf5a6744847e65333cc1a2cb9a1ae20eb9514', '198.38.92.6', 1756155575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135353537343b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('eef132fe4234c0e14401659ea25d79ef1ba05ffd', '50.6.197.32', 1756155765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135353736353b),
('7c54a62d75a6c7d02103e3ff5574c68a8a9355af', '162.19.58.174', 1756156217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135363231363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('ab3d04c4281859774d887a098eb965bed14ed442', '20.11.41.35', 1756156559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135363535363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('65af5edb6e2750a37e4d39a3f7e38faa6e1e61d2', '82.165.66.230', 1756156893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135363839313b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('e296996e3eb45bb9fd0e65c669513fa3ea6547b7', '50.6.197.32', 1756157512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135373531323b),
('68166a800ce09ba72c4a7035f647b053fb313479', '50.6.197.32', 1756159363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363135393336333b),
('56a10d4ab24facd9ce5945d08d323af78c264636', '50.6.197.32', 1756161117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363136313131373b),
('cea27001485407da5932e290f78855e58187a456', '50.6.197.32', 1756162949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363136323934393b),
('dc7cd2f15d2aa3bc6b2eff5ffce74ebbcb5076ff', '50.6.197.32', 1756164716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363136343731363b),
('b87c4ffcc2449676d35d10f4c2e1e0900157d5f8', '50.6.197.32', 1756166550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363136363535303b),
('11ab95115b9aa7217c1d4d692fcc82c8f4397276', '50.6.197.32', 1756168314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363136383331343b),
('e8d461c1da1c0060b2fb006732ba379732fa27e4', '50.6.197.32', 1756170164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137303136333b),
('093863e4beadcdebe918c32ccf5a309bf71d71ae', '50.6.197.32', 1756171914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137313931343b),
('d8c6beafd3c24f4a9b05877134c52eb8edbe4473', '50.6.197.32', 1756173770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137333737303b),
('9f1735c588d870870a0265fbd4605d7d502e6d46', '50.6.197.32', 1756175515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137353531353b),
('668707ac714814d9f92eba6d973b8f2b222ac1ad', '50.6.197.32', 1756177343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137373334333b),
('58df16a635329033808667d509ecd24e969b352a', '4.227.36.107', 1756178255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137383235353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('ad4553399b49acdea7e033fde4ebf095dbfbc255', '4.227.36.107', 1756178256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137383235363b),
('0b7b469e1dec9342ae58fc9ac18ff951072b75e0', '205.210.31.47', 1756178324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137383332343b),
('21d300cc43e53568d0134c71ae3a30de814b9f1e', '50.6.197.32', 1756179115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363137393131353b),
('d87ea81da3898fe9f791fcd73028143ab4264764', '50.6.197.32', 1756180952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138303935313b),
('715cb1bd634828b5b2032540f8edf52926c1d342', '50.6.197.32', 1756182716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138323731353b),
('d1f20c75b9825147398974bd7c9c10dbb7f360fe', '50.6.197.32', 1756184553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138343535333b),
('c8bf6928e9fd7f6a9b4005459ee7f43b6406cf5a', '50.6.197.32', 1756186316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138363331363b),
('7589a5d5b0d77f6a010e2a158c0140aff3aedb59', '50.6.197.32', 1756188152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138383135323b),
('9fd5d4e5e85aa18fa950a6350f593b791b02310d', '4.227.36.107', 1756188453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138383435333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('6190410beacf73277f1504006f56d2ad47480471', '4.227.36.107', 1756188454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138383435343b),
('953efdb07bbeeb55867c5ac29e22289b57f156a5', '147.185.132.40', 1756188774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138383737343b),
('c95067aebbd65fbdddd7ce101ee82a762993e16e', '50.6.197.32', 1756189916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363138393931363b),
('96b55ad88c0dc44ba683b05b463780d9c7d45858', '50.6.197.32', 1756191753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139313735333b),
('3a40aee715d2dc5510c83beabcdfe1022a6bc5a5', '50.6.197.32', 1756193517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139333531373b),
('4c334698cd16da43df854670db00c6055dc3e8ce', '50.6.197.32', 1756195359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139353335383b),
('ff14ee51b390506394062322fda88b1a781e7cae', '217.114.43.119', 1756196129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363132393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('155202ee3c7edac2e309f131b72011bb98ac8650', '217.114.43.119', 1756196130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133303b),
('8befda48ac55858c0316d637045443dd048609da', '217.114.43.119', 1756196130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('592114026b4d90b4db25c8594f95b7ecb978eee0', '217.114.43.119', 1756196131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133313b),
('d5309b2ec4fc4a6bcc33294dc7ea456b89b877df', '217.114.43.119', 1756196131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7b20bf36ea0d351fccc45d28a78171c0c9221ff0', '217.114.43.119', 1756196132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133313b),
('fe02111cbb25b4f64dc4ab385bc28dbbc4e7cac1', '217.114.43.119', 1756196132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4759d6dc11fc0ac7a8f2bd39e36532cd6c0863b8', '217.114.43.119', 1756196132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133323b),
('ddeec5c9ca61aa5156da68f8a614f16620364a2b', '217.114.43.119', 1756196133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('580c9c6f065044ed609ff48c58f4115efdb4f41f', '217.114.43.119', 1756196133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133333b),
('2d86b95bb04eb98634be50ed1686ff179b36749b', '217.114.43.119', 1756196133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3235e5efa673ef25408bcc731813ff02126aa1f9', '217.114.43.119', 1756196134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133343b),
('94b40b88325e61b3265ebc8d3301193cf3e4cf59', '217.114.43.119', 1756196134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('fdc75ee9399b7d455c923673abf6bd6f3d7c2bf5', '217.114.43.119', 1756196135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133353b),
('1048678d2f88be50578caec7a8cc6cbc79143c38', '217.114.43.119', 1756196135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('867fb9afcc174db0a878a9c09e5f1f62b19a611f', '217.114.43.119', 1756196136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133363b),
('f0d2019aaaa8074b595597f9b0af9e232fbc37e1', '217.114.43.119', 1756196136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('78330e752a2e8ddec55e5e1fd9f3ba319fb8425f', '217.114.43.119', 1756196137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133373b),
('e6b6ec6b8fc957bb3a42dbd086094e28347b0854', '217.114.43.119', 1756196137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f0db5a608e55479bba2d9b612be7cb103d8e39cb', '217.114.43.119', 1756196137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133373b),
('3a3a6420e7d183033cdc06c2f112ee9932c5617b', '217.114.43.119', 1756196138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('9a99f18265cbde6632345ea89562baacdd467fbe', '217.114.43.119', 1756196138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133383b),
('8ad08fc8a702007ce2418099658ddb505d5956ce', '217.114.43.119', 1756196138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fe8ac213f2f5db78551204991c8b0e5f7e98ae1a', '217.114.43.119', 1756196139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133393b),
('1959187ded19d2c673fad76a73322567f2000c86', '217.114.43.119', 1756196139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0eb8b2c185e00219235e60797ea25b22c33b9ddf', '217.114.43.119', 1756196139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363133393b),
('44b3c55ac1da7a4f37be932469692c5f316eb846', '217.114.43.119', 1756196140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3451256d0933398e2dd6e98f9af8ca4abdc29b00', '217.114.43.119', 1756196140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134303b),
('32fe92929556e3b0bbef9a929065f8f0485222c4', '217.114.43.119', 1756196140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('51c2cefed4c9a94942420d8e2dc8a23c903fe5e7', '217.114.43.119', 1756196141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134313b),
('8ab39b9980bf71c6828a1092df6beb6abf2a8463', '217.114.43.119', 1756196141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8159e459b2f9aee5ed56689c8940e2a50284281e', '217.114.43.119', 1756196141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134313b),
('4738e863d1475c84bd8dbb06253a1798db78ac3c', '217.114.43.119', 1756196142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b5355822b36aff999d4bf22bb0edf92063d6d1b1', '217.114.43.119', 1756196142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134323b),
('9126882acbf7c2c364dca660f99e224a797a655a', '217.114.43.119', 1756196142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('49f061c10699498c2d6dcd92d893c84a0122fa45', '217.114.43.119', 1756196143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134333b),
('d3ac63c4d53a9e165a0d7fa63a5d6b34303fb14e', '217.114.43.119', 1756196143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('403b552f4ec7b5761659ea31071d9a6624742e62', '217.114.43.119', 1756196143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139363134333b),
('241041e39bd7aa45ff44ef281e419f8054f08b5a', '50.6.197.32', 1756197117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139373131373b),
('aba6ea1ea10f4d3dad5dbf9f1b0f8b337838e095', '50.6.197.32', 1756198951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363139383935313b),
('897458a1439e4c57391cf03c712a6340e811a879', '50.6.197.32', 1756200719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230303731393b),
('3680a046574e12fba3818b441af0ea3be39b9750', '50.6.197.32', 1756202555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230323535353b),
('65e8683f18a611961f0424a6a6901fc672f5499f', '50.6.197.32', 1756204319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230343331393b),
('2ef0c05d12d33498325fdab1837bcffa289df2d8', '50.6.197.32', 1756206153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230363135333b),
('2455422abad793170b2cf83d89dff4ce763b3079', '50.6.197.32', 1756207919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230373931393b),
('cd7b6d65b7d9961ffdb4139836d5536e9db99495', '185.177.72.205', 1756209154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230393135343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('e9d241febd8cd49e0bb61f2883d4713b13192022', '50.6.197.32', 1756209769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363230393736393b),
('c4fa153e043470f108353cbe0e6667554575fae6', '50.6.197.32', 1756211520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231313532303b),
('650693929a41fa751634f3560635a0ec1f82733c', '3.140.182.19', 1756212351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231323335313b),
('318912f3faeb651ed9567ebdb8aa1a9419566db7', '50.6.197.32', 1756213357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231333335373b),
('d7c7b98a31ee7c08fa20d7f7d5fb8f3f9dab4bcb', '50.6.197.32', 1756215120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231353132303b),
('2ebe6ea07a29aa611d55f264770bc67169ff9f2d', '50.6.197.32', 1756216958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231363935383b),
('5bf9a52a2a768f5542c8ba7bb9e5ae972aabb610', '154.74.187.2', 1756220902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232303930323b),
('d9245c7ace78a237bca36e5740b71ee28f700845', '50.6.197.32', 1756218723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363231383732323b),
('9069f969115bb70162acc0d48849597ffe311e08', '50.6.197.32', 1756220557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232303535363b),
('62836458168c45053aeaa5a64ffa4e6a47a874cb', '154.74.187.20', 1756220902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232303930323b),
('51fd3243f63fb319b6e95970a552b4ad7ea00cdd', '4.227.36.107', 1756221922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232313932323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('818a4f366cc4666073a78a7f119f43a495dc6067', '4.227.36.107', 1756221922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232313932323b),
('1ea261c602127c35470fbda3f21bf39264ec2e60', '50.6.197.32', 1756222323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232323332333b),
('d206111ec2a148e0733c4c97e6c8a6bd3f5d45d2', '50.6.197.32', 1756224160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232343136303b),
('7f327967a3a5eeb17d8f7d1aeef239ff5d5a27d1', '4.227.36.107', 1756224569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232343536393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('322f87392bbda83000e8a397bb992cbf83f9d4fa', '4.227.36.107', 1756224569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232343536393b),
('b6bd8b9175a3138e1a117693f28b43eed80f387e', '50.6.197.32', 1756225922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232353932323b),
('e60c350a94dec8c32c0aa1fbf204bd504ffad18f', '196.251.69.222', 1756226875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232363837353b),
('c44b0e66b73647247094960ac3b7e673f513885b', '196.251.69.222', 1756226876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232363837363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('08086e1ef4b0a45b4aa48209d566a9510f76bb9b', '196.251.69.222', 1756226877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232363837363b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('9b7d3bac70a33db5280fe6bbbb33e987f6d2e3af', '50.6.197.32', 1756227759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232373735383b),
('a7b663246e141a8087685a8fef70447faa2d2c4d', '50.6.197.32', 1756229522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363232393532323b),
('a4f8bdeb8919f8c0f637531f372bba334712760b', '50.6.197.32', 1756231353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363233313335333b),
('d54ffbc1b0f6d994912b159a7184257ad9e9081a', '50.6.197.32', 1756233123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363233333132333b),
('e48797f00bfc7d12eb398e63b8a4964129ac00ec', '50.6.197.32', 1756234952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363233343935313b),
('2755abde9b87e05ee84ea47ac51da679f249c50e', '50.6.197.32', 1756236722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363233363732323b),
('c9ace6fde2bc5db68e83189348fd9166d1155ea9', '50.6.197.32', 1756238553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363233383535323b),
('ef83c2e48bec6c5a0ddfc7ca8ec03fbf2f7d0620', '50.6.197.32', 1756240326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234303332363b),
('11d6cddd08695b64073ed0ca71a899bdc3d5b1e0', '50.6.197.32', 1756242161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234323136313b),
('599e09cc4fb1d71a6f4839bfbd2c64224ecc846a', '50.6.197.32', 1756243926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234333932363b),
('25a7a760871ecb836495b3ea887a64d652ba1c0c', '50.6.197.32', 1756245761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234353736313b),
('9f9537373367a1bd434631832d8bc8504216238b', '50.6.197.32', 1756247526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234373532363b),
('51dade710292efda5e3946b1027cd59fd25114eb', '50.6.197.32', 1756249362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363234393336323b),
('bcba3a79583adda8a0354f083a3f1259486e05c1', '50.6.197.32', 1756251128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235313132383b),
('54bfdeec0d10b2ebfde25437e8e5d5ea699d931c', '194.50.16.252', 1756251262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235313236323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c891fff1477c7d8f64c71085c15d0d035ea3ccd4', '50.6.197.32', 1756252964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235323936343b),
('0cce94f7dc47938ebb4af056a756b65529b255a5', '50.6.197.32', 1756254725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235343732353b),
('248aad373d5bf82be3ade1f0d38b50e39937c0db', '50.6.197.32', 1756256563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235363536323b),
('6f0b8c00ee7703bb220ef5b0755012e3d38d393e', '50.6.197.32', 1756258326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363235383332363b),
('ff3dbfa2a774b5545cdf2fe64f9c5c9a60f6a3ba', '50.6.197.32', 1756260155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236303135343b),
('efa8a45d39ce4c924866634bfa7c447e90683edb', '50.6.197.32', 1756261928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236313932383b),
('51ae284fbf10f225b90f76e577b00471583eccae', '50.6.197.32', 1756263761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236333736313b),
('84f80e7c4093f5006c997b12d0aadfca458dbb69', '50.6.197.32', 1756265528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236353532383b),
('606bccd64ea3837eea8ebb5e9c30bfd13c9a2a57', '50.6.197.32', 1756267364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236373336333b),
('94440386ec0820566728bdc70cdf1ea3ba868a45', '50.6.197.32', 1756269128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363236393132383b),
('da08cb30d9691c1a105a6aa901535246a849d019', '50.6.197.32', 1756270964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237303936343b),
('052157b8e116d8ee77d2bfdfb4377d76bb6f4116', '50.6.197.32', 1756272729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237323732393b),
('4ed89b1d5e76ccfefa1924790d65a507dd7445fb', '50.6.197.32', 1756274557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237343535373b),
('4810ca671361daccce316a3ea66f98b5aa1da3a8', '50.6.197.32', 1756276330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237363333303b),
('4c53908ad3e7c0bf5f486b9cba201114f0063c06', '50.6.197.32', 1756278165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237383136353b),
('875b85db2d61c374704aee1652d214fdd6802419', '50.6.197.32', 1756279929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363237393932393b),
('d2df7f416ba8dda57243dd2981b44cf358d77d6f', '50.6.197.32', 1756281761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238313736303b),
('4103f8386b5a63316757ee6deb10279da935d027', '50.6.197.32', 1756283530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238333533303b),
('25e0c72edd3fd88b19a3497153c173749f407a1b', '44.244.20.34', 1756283780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238333737393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('5f22e59e54415d9ad45640f02359125628b9b9ef', '50.6.197.32', 1756285360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238353336303b),
('8248d6e97df8afc61ed9c572b2f523dbb07c7137', '206.82.9.244', 1756285437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238353433353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8d20629ab625b07b3f0806ab1a31736b44bcc3a6', '196.216.247.42', 1756287254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373235343b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373735393838223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b37ecadf31363aad901755c7e6b2aff4e2a345f1', '50.6.197.32', 1756287131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373133313b),
('86f9d437475f32221f778e3b199364dd274e8294', '196.216.247.42', 1756287422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373432323b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a343a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535383539393033223b6c6173745f69707c733a31333a2234312e35392e3135392e313433223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a223458574a6e62736a223b6373726676616c75657c733a32303a225670476f35716c30397379345141463632685944223b),
('a583afe21b82cb597742c3e5ce8854f6a1e76441', '196.216.247.42', 1756287610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373631303b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373735393838223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c0e43f2578be07df28fb9cc47e4f30904e53fb73', '196.216.247.42', 1756287694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373432323b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a343a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535383539393033223b6c6173745f69707c733a31333a2234312e35392e3135392e313433223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a227871597246483474223b6373726676616c75657c733a32303a22736549753076513137353670696b6f5358715441223b),
('4ac57328869c3acea57ec54055c89f1c880e11fd', '196.216.247.42', 1756287435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373433353b7265717565737465645f706167657c733a32323a2261646d696e2f70726f64756374732f656469742f3339223b),
('38c791a366345baad5e588b3c6bd8fba9af2c770', '196.216.247.42', 1756287437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373433373b),
('42a92961677fee0378a8510fd5390a7f6fda6604', '196.216.247.42', 1756287611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238373631303b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373535373735393838223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2234223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fde724ff4ca926e6ef1a204ccbafaea3e54a62fb', '196.216.247.42', 1756292666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239323636363b6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536323836363131223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('f9eb1242688a8c719764d609b53acbba30ddfc91', '35.239.241.252', 1756288859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238383835353b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b),
('fb5cd71c6f00837e3052bdddffa10ed33dc7d0e1', '50.6.197.32', 1756288964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363238383936343b),
('166b266bc14435238bf4df03132bcf068faad67a', '50.6.197.32', 1756290732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239303733323b),
('3c49a035a54c9cbb1c0dcdc43a8e8d48b390d16a', '43.163.94.101', 1756291817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239313831373b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8b44abdc63031e4901f9b30c689a33402b1a8780', '50.6.197.32', 1756292561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239323536303b),
('1a834ab0341497449fe8959ac00dfa0419edace0', '196.216.247.42', 1756292985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239323938353b6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536323836363131223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('aa3858ece8f46eb525bfddc3fbf6834db409f19e', '196.216.247.42', 1756299468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239393436383b6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536323836363131223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('e73266d74d36259023d1099da93d6360ea3f4ef5', '124.156.207.229', 1756295676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239353637363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('912b0e429532d6827648c941eac8ae5f4a032f39', '50.6.197.32', 1756294333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239343333333b),
('bd2b99e9afa82d9d7f1a45e13f91222387e46bf8', '124.156.207.229', 1756295680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239353638303b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('0d1fd6ce88994e039e2d41384ac3726deaec4f11', '50.6.197.32', 1756296165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239363136353b),
('048ffb6f83b598afcff2cdd7cbed40e700de52af', '154.74.187.4', 1756298101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239383130313b7265717565737465645f706167657c733a33393a2263617465676f72792f646f6d65737469632d70726f64756374732f636f6f6b696e672d73616c74223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('4e08c263a9aba17be09c33de8c32331239629c3e', '50.6.197.32', 1756297934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239373933343b),
('5dd0118a2cda03fd3cf615c93053ce62a5b8fe0f', '154.74.187.4', 1756298110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239383130313b7265717565737465645f706167657c733a33393a2263617465676f72792f646f6d65737469632d70726f64756374732f636f6f6b696e672d73616c74223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('bdde852b0611e3f46565c912d487b574f3f91095', '196.216.247.42', 1756299560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239393436383b6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536323836363131223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a323a7b733a373a226d657373616765223b733a333a226f6c64223b733a353a226572726f72223b733a333a226f6c64223b7d),
('7df5ca74890b121b0471b706a49808e0ba01f31a', '50.6.197.32', 1756299761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363239393736313b),
('86817e81264c3e4fa9818ca1bb17d7ff6e16cdfd', '50.6.197.32', 1756301534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363330313533333b),
('0b74b37d64f3b0dc329ea8bbe969932a74a46e14', '50.6.197.32', 1756303367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363330333336373b),
('deacc85b04f11ee780bc30037376dcf576343acd', '50.6.197.32', 1756305133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363330353133333b),
('363301b21f00c831ba3e8ef065f378bfd9a08186', '50.6.197.32', 1756306968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363330363936383b),
('04de93c586ad6cc4e414690cfd225019ead72332', '50.6.197.32', 1756308734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363330383733343b),
('1ebb4b0fcbc2d4021d0101c8198211e5260cb007', '50.6.197.32', 1756310575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331303537353b),
('de1edf0531f072aa7c79dae36f61c4321d24aa5d', '50.6.197.32', 1756312336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331323333363b),
('570ad582408f0554cb067c2cfd70600cd86ef120', '50.6.197.32', 1756314164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343136333b),
('5eebeddf4882afd08db61916c23b14b842447eeb', '176.126.103.125', 1756314951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343935313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('29942c31b1d21dbb10820af3bede9c4b6443f648', '176.126.103.125', 1756314955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343935353b),
('e7e559c023bc61a6bf795710947ddc6f32b0b76b', '176.126.103.125', 1756314960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343936303b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('239b87298ff2367c4922005d37065e63ad74737d', '176.126.103.125', 1756314965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343936353b),
('1bc3a2fef5239e4c78777f593c2eb404a22ac36b', '176.126.103.125', 1756314969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343936393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0957b8457a4fccc184ed5e458764b6514d06a2d7', '176.126.103.125', 1756314973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343937333b),
('24acd80cb2a3529fe1d9ef873fd530755791cb66', '176.126.103.125', 1756314977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343937373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('8661f07bdbd7e9e9996db16746fba9e5eb25de01', '176.126.103.125', 1756314982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343938323b),
('3f3c5cd9c78da208d6bf1d5337f3f2a7fd1d4e54', '176.126.103.125', 1756314986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343938363b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b3b3953e048f8088d63736d4899d267525749fb0', '176.126.103.125', 1756314990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343939303b),
('ee111eb359e8622d981651b5e49739470ae72131', '176.126.103.125', 1756314994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343939343b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('af269d6cfb3752b071cdd1144c46e907569e4191', '176.126.103.125', 1756314999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331343939393b),
('ad871ca2aa317f952b521e00e9ee362fdd93112f', '176.126.103.125', 1756315003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353030333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('b81366db58b64b5b98f7b142aadb2a9149b5ae63', '176.126.103.125', 1756315007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353030373b),
('d4516950d6524908f90daaa5f53b191dffa72035', '176.126.103.125', 1756315011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353031313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('785faeb582e80418bb7ab1f6e8e47eab434942a3', '176.126.103.125', 1756315015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353031353b),
('59829467604b8cdb1e5741083f8ec938d36c985f', '176.126.103.125', 1756315019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353031393b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('02bbf7d43a2f38a98463077a47094a1afa74e7f8', '176.126.103.125', 1756315024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353032333b),
('70a7cb561e73eef5a49a6d734071bc1ec6124cca', '176.126.103.125', 1756315028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353032383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('83eaedaa07bb37934a911a7cbdc39fbb4806d7e3', '176.126.103.125', 1756315032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353033323b),
('cb51c268ee99ee1b8ec54d65af47f985cfad36b1', '176.126.103.125', 1756315037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353033373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4416f1eb06009ce44435e14624f19f97cd102b6d', '176.126.103.125', 1756315041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353034313b),
('c1559f2e2c85d8ead2a42ca86a078bbb6a2ac91e', '176.126.103.125', 1756315045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353034353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('41a3161ee664c58fef981e0e96a4a437bbc4db77', '176.126.103.125', 1756315049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353034393b),
('3ba57e5fdd94749419505074d7453dbe1ad4b5e2', '176.126.103.125', 1756315053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353035333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('11faeccc9ab583e30a80a554a6a494bd0e73836a', '176.126.103.125', 1756315057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353035373b),
('301e53603522e5e199f0f1d0c423ac46d5577f72', '176.126.103.125', 1756315062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353036313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('2ef075645cef77eff5309c17f15d272bc0163545', '176.126.103.125', 1756315066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353036363b),
('3c10b36bf75cf3549011bea07bf0e35cb4d9ba24', '176.126.103.125', 1756315068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353036383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('21bf983e552fd3534840c899616d3fe74521c70b', '176.126.103.125', 1756315072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353037323b),
('fcb53bc43e5db86b8fbd7951ef5777b2d75dcc6f', '176.126.103.125', 1756315077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353037373b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('0f19dbcc5c3856ac39f4cd30279a066e1118973a', '176.126.103.125', 1756315081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353038313b),
('2c580842687332e593d490ce58e1baff5f32b8af', '176.126.103.125', 1756315085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353038353b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('66b5baf0ad816ae00419faed564088ca70b6bf91', '176.126.103.125', 1756315089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353038393b),
('7ce285b57aff028a1d54c17e7bebd57858bf58c7', '176.126.103.125', 1756315093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353039333b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('c45b1669e675c3f1b924a7785a103ddc3e4be676', '176.126.103.125', 1756315097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353039373b),
('7293f8e7b2a9225f96f5142ec06f77db7d8161cf', '176.126.103.125', 1756315101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353130313b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('4195fb1bd2dc9d3a51f97cba8559d6025e006903', '176.126.103.125', 1756315106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353130363b),
('93d245f61798360e3b35dc5a8bc1be6e1e4c7ab0', '50.6.197.32', 1756315935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331353933353b),
('73f38d587187ebaae3324c09cefdb337c37e7a92', '50.6.197.32', 1756317771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331373737313b),
('b3a489a5c81af28be284e11881a189bd278ea5d1', '194.50.16.252', 1756318332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331383333323b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1bf279a34a2380a92ec6373bd8673d499ccefbba', '50.6.197.32', 1756319536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363331393533363b),
('eb66741c7ad25273a26587672b6b13e6a4dbde50', '84.239.50.149', 1756320189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332303138383b6572726f727c733a37363a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('f2d5dd25dd9bb6fa9dbe502d89d0ff230554d74f', '197.250.134.229', 1756320364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332303331303b),
('8d3c897f0baaefd42f37e075be8bb72dbbff65cf', '66.249.93.74', 1756320316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332303331363b),
('44e1d8f22e984b5877f9aa6275bb00ebf1b6c799', '66.249.93.74', 1756320317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332303331363b),
('e070bc0d8bf54cd4abd69a00e3e8baa2bb2d2589', '66.102.8.128', 1756320317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332303331373b),
('6b75d656d880cd66d5c1eaf4e0996e0245ac241b', '50.6.197.32', 1756321370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332313337303b),
('8e91cb504654a4625da8148a78db4a86eee2f632', '50.6.197.32', 1756323135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332333133353b),
('215ec6fc01f47a76274aa856da1874b5ec360a62', '50.6.197.32', 1756324965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332343936343b),
('69757489a5558d46507bb814ff2e5b841b2e6702', '50.6.197.32', 1756326738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332363733383b),
('75660b77831dac59dd03b6a144e89fecabb44e78', '124.220.228.96', 1756327502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332373530323b),
('8b9c52b1774b9e4b69dad903cc6b0a3f92e92f36', '50.6.197.32', 1756328566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363332383536353b),
('ddcdef13de912673a0e243c7690e7cc20bc9ce9d', '50.6.197.32', 1756330338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333303333383b),
('3d02e6b1a1e739ebd48ec1cf66d968328860ab68', '134.122.133.31', 1756331093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333313039333b),
('634105d2f8f2d53ceb105a84e8415ba35ca22ae6', '50.6.197.32', 1756332166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333323136353b),
('774e2f32b7e4b556909ce7174f95d3d355cf178f', '50.6.197.32', 1756333937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333333933373b),
('be6d3693667c55855d9948a7a90771568d5c3d61', '50.6.197.32', 1756335768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333353736373b),
('183aa7433e1996491e5d535af5ab8071fc67aae6', '50.6.197.32', 1756337538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333373533383b),
('43012419298579b612a75860d07055703dd1f8d9', '50.6.197.32', 1756339377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363333393337373b),
('e4ae6a5ade19fb46eec93851826cd95722844415', '50.6.197.32', 1756341140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363334313134303b),
('3582bc06bbfef1d4470682ecff5700cbd307d5f7', '50.6.197.32', 1756342971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363334323937313b),
('68dc2efffb5264b868daa1fec3b7449e8b482a8e', '50.6.197.32', 1756344740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363334343734303b),
('a76e695e8089ddb748f0e8c7f78a95d4b0031d6c', '50.6.197.32', 1756346576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363334363537363b),
('e6a8dfc6643fda1370f7ef94e861f9aa10471391', '50.6.197.32', 1756348340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363334383333393b),
('7f89725b6fef296ae461ea3ea7effa59cdca1689', '50.6.197.32', 1756350170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335303136393b),
('c083ed5c8556f2c7ec3b8568111dccc85b4abc76', '50.6.197.32', 1756351940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335313934303b),
('8674c9eb0682a4462cc0618527dd5ac7820c6087', '50.6.197.32', 1756353769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335333736393b),
('15fd1928f912526cef7fa712c615c66db509b532', '50.6.197.32', 1756355541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335353534313b),
('bfebe244e68a5e461ccfdb73c3e395e6728c9c16', '50.6.197.32', 1756357370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335373336393b),
('ebf5e0aee5ced653b04717f56b77abc9ffb92afe', '50.6.197.32', 1756359144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363335393134343b),
('fe6bfe81baca5d4e7ae0fc97807390e3a5aef5d3', '50.6.197.32', 1756360974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336303937333b),
('0e8ce67c00ba236a9a37ede17bb7f5d5c59078d1', '50.6.197.32', 1756362742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336323734323b),
('3ff8eb59eef3ce6623d09360a5b6ca5f35e46840', '50.6.197.32', 1756364570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336343537303b),
('f9f6a94a2036e5571bea4d2486a1431a67ebda7c', '196.216.247.42', 1756365616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353536373b7265717565737465645f706167657c733a33323a2261646d696e2f73797374656d5f73657474696e67732f63617465676f72696573223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a343a226a616e65223b757365726e616d657c733a343a226a616e65223b656d61696c7c733a32323a226a616e652e6265746875656c40676d61696c2e636f6d223b757365725f69647c733a313a2234223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536323837373230223b6c6173745f69707c733a31343a223139362e3231362e3234372e3432223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2b02b1bd83f43da30c7413ff8501ae37e1cd550b', '41.59.12.123', 1756365740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353734303b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3687ac46f7fa7e8142232468d5fc7d1e49814247', '41.59.12.123', 1756365741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353734313b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('7d0695b96fce8abea7ced632906eeec7df49f744', '41.59.12.123', 1756365846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353834363b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('334f90394cbffc1ce4fa3716a2575f51688b233f', '41.59.12.123', 1756367873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336373837333b),
('e2c60bb60cfaf56dc7f3607a42c4e434ce4c842a', '67.219.192.36', 1756365831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353833313b),
('068ad1fb55a4511b00020a0616e034a169c57a4b', '41.59.12.123', 1756365845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336353834353b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('eb299ea1867cc98bbdc859b4ea0dd17afe9edda5', '50.6.197.32', 1756366342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336363334323b),
('dae4abc9c1519f13550dbf175386d9edea2a604f', '41.59.179.47', 1756368182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336383138323b7265717565737465645f706167657c733a353a2261646d696e223b),
('3eebfa0d1936c7ee1de6ee829c9f6552f75999cc', '41.59.179.47', 1756367879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336373837393b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('25f87a1686e5b7b37aa9dab117773c7cc77d5da5', '41.59.179.47', 1756367879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336373837393b6572726f727c733a3135323a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e68747470733a2f2f6d756c742d73746f72652e63616a616d2e636f2e747a2f7468656d65732f64656661756c742f73686f702f6173736574732f6373732f7374796c65732e6d696e2e637373223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('93779f00a6f5d0c500b3f3912a8a23abededb78e', '50.6.197.32', 1756368172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336383137313b),
('b72c5a9fdaf583269db60c0e0099462a56768e24', '41.59.179.47', 1756371103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337313130333b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a343a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536333635373831223b6c6173745f69707c733a31323a2234312e35392e31322e313233223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2250684a4841376a4e223b6373726676616c75657c733a32303a2278453361417a5434723766796d4c43676c515330223b),
('5d3916836b258b7430b927a5d679c4a7dfe9e0c6', '50.6.197.32', 1756369952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363336393935323b),
('fdbab098a1bb0cdbf0486a80cf3d47fa2f3eb61d', '41.59.179.47', 1756373576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337333537363b7265717565737465645f706167657c733a353a2261646d696e223b5f5f63695f766172737c613a343a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536333635373831223b6c6173745f69707c733a31323a2234312e35392e31322e313233223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a2250684a4841376a4e223b6373726676616c75657c733a32303a2278453361417a5434723766796d4c43676c515330223b),
('e5548aff2fd9adaac5bf2b6d25caa56f23d41f08', '50.6.197.32', 1756371772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337313737313b),
('a95a4893952fc52997579539b23e3281dad5e556', '50.6.197.32', 1756373545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337333534353b),
('bf95fc0131ffa1393973126bce8479b0baa084d6', '41.59.179.47', 1756373743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337333730393b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536333638313930223b6c6173745f69707c733a31323a2234312e35392e3137392e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('dd27e55e48257b19e4f6440e6a3c7f9b2200c096', '41.59.179.47', 1756374467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735363337343430363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a31383a226f776e65724074656364696172792e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a226f776e65724074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373536333733373233223b6c6173745f69707c733a31323a2234312e35392e3137392e3437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(11) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(11) NOT NULL,
  `rows_per_page` int(11) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(4) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(4) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `ksa_qrcode` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`, `ksa_qrcode`) VALUES
(1, 'logo2.png', 'logo3.png', 'cajam-mult-store', 'english', 1, 0, 'TZS', 1, 10, '3.4.53', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 0, 0, 0, 1, 0, 'Africa/Dar_es_Salaam', 800, 800, 150, 150, 1, 0, 0, 0, NULL, 'smtp', '/usr/sbin/sendmail', 'mail.wolinet.com', 'cajam@wolinet.com', ';6{RiUefzIPD;-xq', '587', 'tls', NULL, 1, 'sales@cajam.co.tz', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'REKA197380', 'c89x223w4590', 0, 5000.0000, 10, 50000.0000, 100, 0, 0, 1, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 1, 'AN', 'dompdf', 1, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_shop_settings`
--

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.53',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT 0,
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT 0,
  `hide_price` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_shop_settings`
--

INSERT INTO `sma_shop_settings` (`shop_id`, `shop_name`, `description`, `warehouse`, `biller`, `about_link`, `terms_link`, `privacy_link`, `contact_link`, `payment_text`, `follow_text`, `facebook`, `twitter`, `google_plus`, `instagram`, `phone`, `email`, `cookie_message`, `cookie_link`, `slider`, `shipping`, `purchase_code`, `envato_username`, `version`, `logo`, `bank_details`, `products_page`, `hide0`, `products_description`, `private`, `hide_price`, `stripe`) VALUES
(1, 'Cajam Mult Store', 'Cajam Mult Store Is Ecommerce Shop that would help you to sell your products from your site.', 1, 3, '', '', '', '', 'We accept PayPal or you can pay with your credit/debit cards.', 'Please click the link below to follow us on social media.', 'http://facebook.com/tecdiary', 'http://twitter.com/tecdiary', '', '', '0747003357', 'info@cajam.co.tz', 'We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.', '', '[{\"image\":\"89574ea2f565c29e0b5199eb0ab45241.jpg\",\"link\":\"https:\\/\\/cajam.co.tz\\/wp-content\\/uploads\\/elementor\\/thumbs\\/IMG-20231002-WA0006-r63f4fn1ihhfabenfd6cdi6shbbds9q8q7ujpksh50.jpg\",\"caption\":\"\"},{\"image\":\"1b0c9ceb727a350dcd66e412a8d25ed0.jpg\",\"link\":\"https:\\/\\/cajam.co.tz\\/wp-content\\/uploads\\/elementor\\/thumbs\\/IMG-20231002-WA0006-r63f4fn1ihhfabenfd6cdi6shbbds9q8q7ujpksh50.jpg\",\"caption\":\"\"},{\"image\":\"b31cb00deea1dfb137f619aca442ffb1.jpg\",\"link\":\"https:\\/\\/cajam.co.tz\\/wp-content\\/uploads\\/elementor\\/thumbs\\/IMG-20231002-WA0006-r63f4fn1ihhfabenfd6cdi6shbbds9q8q7ujpksh50.jpg\",\"caption\":\"\"},{\"image\":\"73d539c7d07dbfc91f131c5cf662da16.jpg\",\"link\":\"https:\\/\\/cajam.co.tz\\/wp-content\\/uploads\\/elementor\\/thumbs\\/IMG-20231002-WA0006-r63f4fn1ihhfabenfd6cdi6shbbds9q8q7ujpksh50.jpg\",\"caption\":\"\"},{\"image\":\"be051a5b89c78b41c3215a96162f8fb5.jpg\",\"link\":\"https:\\/\\/cajam.co.tz\\/wp-content\\/uploads\\/elementor\\/thumbs\\/IMG-20231002-WA0006-r63f4fn1ihhfabenfd6cdi6shbbds9q8q7ujpksh50.jpg\",\"caption\":\"\"}]', 1, '', 'envato_username', '3.4.53', 'sma-shop.png', '', 1, 0, 'Cajam Mult Store is a modern eCommerce platform designed to help you showcase and sell your products directly from your own website. Whether you offer fashion, electronics, home goods, or digital products, Cajam Mult Store provides a smooth shopping exper', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sms_settings`
--

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_sms_settings`
--

INSERT INTO `sma_sms_settings` (`id`, `auto_send`, `config`) VALUES
(1, NULL, '{\"gateway\":\"Log\",\"Log\":{}');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'VAT @10%', 'VAT10', 10.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'KG', 'Kilogram', NULL, NULL, NULL, NULL),
(2, 'LT', 'Litre', NULL, NULL, NULL, NULL),
(3, 'PC', 'Piece', NULL, NULL, NULL, NULL),
(4, 'BD', 'Bundle', NULL, NULL, NULL, NULL),
(5, 'PK', 'PACK', NULL, NULL, NULL, NULL),
(6, 'PO', 'POULTRY', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(10) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(3) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x34312e35392e3137392e3437, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1351661704, 1756374417, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x34312e35392e3137392e3437, 0x0000, 'admin', 'c1abe23d7891bd9addeaa6dc9aebf9a0d8ce1039', NULL, 'wolinetrn@gmail.com', NULL, '49555ea52fc16d3215b2ee08134092517820506c', 1755783729, NULL, 1755107721, 1756373597, 1, 'Admin', 'Admin', 'Stock Manager', '012345679', NULL, 'male', 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(3, 0x34312e35392e3137382e3634, 0x34312e35392e31332e323032, 'janebethuel@gmail.com', 'ab325c25e974de144d0b7dc6848d777645c86b2a', NULL, 'janebethuel@gmail.com', NULL, NULL, NULL, NULL, 1755598090, 1755773968, 1, 'Dr janeth', 'Bese', 'CAJAM MULT-STORE ', '0747003357', NULL, 'male', 4, 1, NULL, NULL, 0, 0, 0, 1, 1, 0),
(4, 0x3139362e3231362e3234372e3432, 0x34312e35392e3137382e3634, 'jane', 'a2ab21206418b04c25893f5f2ff19c4b86cb2d01', NULL, 'jane.bethuel@gmail.com', NULL, NULL, NULL, NULL, 1755775300, 1756365572, 1, 'DR', 'JANETH', 'CAJAM MULT-STORE ', '+255 713 460 541', NULL, 'male', 2, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-13 17:55:20'),
(2, 2, NULL, 0x3a3a31, 'admin@tecdiary.com', '2025-08-14 06:58:33'),
(3, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-14 07:07:25'),
(4, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-14 09:46:41'),
(5, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-14 12:03:20'),
(6, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-18 13:22:51'),
(7, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-18 14:05:24'),
(8, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2025-08-19 01:58:17'),
(9, 1, NULL, 0x34312e35392e31332e323032, 'owner@tecdiary.com', '2025-08-19 04:58:02'),
(10, 1, NULL, 0x34312e35392e31332e323032, 'owner@tecdiary.com', '2025-08-19 10:29:48'),
(11, 3, NULL, 0x34312e35392e31332e323032, 'janebethuel@gmail.com', '2025-08-19 11:10:20'),
(12, 1, NULL, 0x34312e35392e31332e3634, 'owner@tecdiary.com', '2025-08-20 01:10:09'),
(13, 3, NULL, 0x34312e35392e3137382e3634, 'janebethuel@gmail.com', '2025-08-21 11:59:28'),
(14, 1, NULL, 0x34312e35392e3137382e3634, 'owner@tecdiary.com', '2025-08-21 11:59:51'),
(15, 1, NULL, 0x34312e35392e3137382e3634, 'owner@tecdiary.com', '2025-08-21 12:11:51'),
(16, 4, NULL, 0x34312e35392e3137382e3634, 'jane', '2025-08-21 12:22:12'),
(17, 4, NULL, 0x3139362e3231362e3234372e3432, 'jane', '2025-08-21 12:29:12'),
(18, 4, NULL, 0x3139362e3231362e3234372e3432, 'jane', '2025-08-21 12:33:08'),
(19, 1, NULL, 0x34312e35392e3135392e313433, 'owner@tecdiary.com', '2025-08-22 11:51:43'),
(20, 4, NULL, 0x3139362e3231362e3234372e3432, 'jane', '2025-08-27 10:23:31'),
(21, 1, NULL, 0x3139362e3231362e3234372e3432, 'owner@tecdiary.com', '2025-08-27 10:32:22'),
(22, 4, NULL, 0x3139362e3231362e3234372e3432, 'jane', '2025-08-27 10:42:00'),
(23, 4, NULL, 0x3139362e3231362e3234372e3432, 'jane', '2025-08-28 08:19:32'),
(24, 1, NULL, 0x34312e35392e31322e313233, 'owner@tecdiary.com', '2025-08-28 08:23:01'),
(25, 1, NULL, 0x34312e35392e3137392e3437, 'owner@tecdiary.com', '2025-08-28 09:03:10'),
(26, 2, NULL, 0x34312e35392e3137392e3437, 'wolinetrn@gmail.com', '2025-08-28 10:33:17'),
(27, 1, NULL, 0x34312e35392e3137392e3437, 'owner@tecdiary.com', '2025-08-28 10:35:23'),
(28, 1, NULL, 0x34312e35392e3137392e3437, 'owner@tecdiary.com', '2025-08-28 10:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'CAJAM MINI SUPERMARKET', '<p>Address, City</p>', NULL, '012345678', 'cmsupermarket@cajam-mult-store.com', 1),
(2, 'WHII', 'CAJAM PIG FARM', '<p>CAJAM MINI SUPERMARKET</p>', NULL, '0105292122', 'sales@cajam.co.tz', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, 100.0000, 'R1', 12000.0000),
(2, 2, 1, 100.0000, 'R1', 14400.0000),
(3, 3, 1, 100.0000, 'R1', 8000.0000),
(4, 4, 1, 100.0000, 'R1', 6400.0000),
(5, 5, 1, 100.0000, 'R1', 12800.0000),
(6, 6, 1, 100.0000, 'R1', 4000.0000),
(7, 7, 1, 100.0000, 'R1', 20000.0000),
(8, 8, 1, 100.0000, 'R1', 40000.0000),
(9, 9, 1, 100.0000, 'R1', 13600.0000),
(10, 10, 1, 100.0000, 'R1', 16000.0000),
(11, 11, 1, 100.0000, 'R1', 11200.0000),
(12, 12, 1, 100.0000, 'R1', 17600.0000),
(13, 13, 1, 100.0000, 'R2', 72000.0000),
(14, 14, 1, 100.0000, 'R2', 20000.0000),
(15, 15, 1, 100.0000, 'R2', 24000.0000),
(16, 16, 1, 100.0000, 'R2', 22400.0000),
(17, 17, 1, 100.0000, 'R2', 12000.0000),
(18, 18, 1, 100.0000, 'R2', 24000.0000),
(19, 19, 1, 100.0000, 'R2', 4800.0000),
(20, 20, 1, 100.0000, 'R2', 12000.0000),
(21, 21, 1, 100.0000, 'R2', 6400.0000),
(22, 22, 1, 100.0000, 'R2', 76000.0000),
(23, 23, 1, 100.0000, 'R2', 21600.0000),
(24, 24, 1, 100.0000, 'R2', 5600.0000),
(25, 25, 1, 100.0000, 'R2', 16000.0000),
(26, 26, 1, 100.0000, 'R3', 9600.0000),
(27, 27, 1, 100.0000, 'R3', 4800.0000),
(28, 28, 1, 100.0000, 'R3', 2400.0000),
(29, 29, 1, 100.0000, 'R3', 1600.0000),
(30, 30, 1, 100.0000, 'R3', 4000.0000),
(31, 31, 1, 100.0000, 'R3', 3200.0000),
(32, 32, 1, 100.0000, 'R3', 8000.0000),
(33, 33, 1, 100.0000, 'R3', 17600.0000),
(34, 34, 1, 100.0000, 'R3', 11200.0000),
(35, 35, 1, 100.0000, 'R3', 8800.0000),
(36, 36, 1, 100.0000, 'R3', 5600.0000),
(37, 37, 1, 100.0000, 'R3', 4000.0000),
(38, 38, 1, 0.0000, 'R4', 16000.0000),
(39, 39, 1, 0.0000, 'R4', 8000.0000),
(40, 40, 1, 0.0000, 'R4', 12000.0000),
(41, 41, 1, 0.0000, 'R4', 9600.0000),
(42, 42, 1, 0.0000, 'R4', 6400.0000),
(43, 43, 1, 100.0000, 'R4', 20000.0000),
(44, 44, 1, 300.0000, 'R4', 7200.0000),
(45, 45, 1, 0.0000, 'R4', 5600.0000),
(46, 46, 1, 100.0000, 'R4', 8800.0000),
(47, 47, 1, 100.0000, 'R4', 17600.0000),
(48, 48, 1, 100.0000, 'R4', 6400.0000),
(49, 49, 1, 100.0000, 'R4', 4000.0000),
(50, 50, 1, 100.0000, 'R4', 3200.0000),
(51, 44, 2, 0.0000, NULL, 7200.0000),
(52, 45, 2, 0.0000, NULL, 5600.0000),
(53, 38, 2, 0.0000, NULL, 16000.0000),
(54, 39, 2, 0.0000, NULL, 8000.0000),
(55, 40, 2, 0.0000, NULL, 12000.0000),
(56, 41, 2, 0.0000, NULL, 9600.0000),
(57, 42, 2, 0.0000, NULL, 6400.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

INSERT INTO `sma_warehouses_products_variants` (`id`, `option_id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(1, 88, 44, 1, 300.0000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_wishlist`
--

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `config` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `auto_send`, `config`) VALUES
(1, 0, '{\"gateway\":\"Log\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_cart`
--
ALTER TABLE `sma_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`login`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_pages`
--
ALTER TABLE `sma_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_shop_settings`
--
ALTER TABLE `sma_shop_settings`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pages`
--
ALTER TABLE `sma_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
