-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 04:53 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_karim_afify_delivery_queries.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `birthdate`) VALUES
(1, 'John', 'Doe', '1970-01-01'),
(2, 'Karim', 'Afify', '1997-08-04'),
(3, 'Michael', 'Schulz', '1988-11-12'),
(4, 'Veronica', 'Engel', '1995-02-06'),
(5, 'Laura', 'Melcher', '1998-09-09'),
(6, 'Thomas', 'Mayr', '1976-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_country`
--

CREATE TABLE `customer_country` (
  `cu_address_id` int(11) NOT NULL,
  `country` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_country`
--

INSERT INTO `customer_country` (`cu_address_id`, `country`, `state`, `fk_customer_id`) VALUES
(1, 'Austria', 'Vienna', 1),
(2, 'Austria', 'Vienna', 2),
(3, 'Austria', 'Vienna', 3),
(4, 'Austria', 'Vienna', 4),
(5, 'Austria', 'Vienna', 5),
(6, 'Austria', 'Vienna', 6);

-- --------------------------------------------------------

--
-- Table structure for table `delivering`
--

CREATE TABLE `delivering` (
  `delivering_id` int(11) NOT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL,
  `fk_system_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivering`
--

INSERT INTO `delivering` (`delivering_id`, `fk_recipient_id`, `fk_system_id`, `fk_package_id`, `date_time`) VALUES
(1, 1, 1, 4, '2020-03-14 14:38:13'),
(2, 5, 3, 5, '2020-03-11 12:29:19'),
(3, 6, 2, 5, '2020-03-01 15:11:36'),
(4, 2, 3, 5, '2020-03-01 13:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`deposit_id`, `fk_customer_id`, `fk_package_id`, `date_time`) VALUES
(1, 1, 1, '2020-03-14 14:38:13'),
(2, 3, 3, '2020-03-12 14:38:13'),
(3, 5, 6, '2020-03-14 12:20:13'),
(4, 4, 4, '2020-02-27 14:38:13'),
(5, 2, 5, '2020-03-22 07:20:13'),
(6, 6, 2, '2020-02-25 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `birthdate`) VALUES
(1, 'Paul', 'Kurz', '1977-05-01'),
(2, 'Tobias', 'Larssen', '1986-10-27'),
(3, 'Martina', 'Waldo', '1991-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `mdscompany`
--

CREATE TABLE `mdscompany` (
  `company_id` int(11) NOT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mdscompany`
--

INSERT INTO `mdscompany` (`company_id`, `fk_employee_id`, `fk_package_id`, `name`, `location`) VALUES
(1, 3, 1, 'Postfiliale Liesing', 'Liesinger Platz 2'),
(2, 1, 5, 'Postfiliale 1230', 'Riedelgasse 5'),
(3, 1, 1, 'Postfiliale Meidling', 'Meidlinger Hauptstraße 4'),
(4, 2, 4, 'Postfiliale 1238', 'Endresstraße 6'),
(5, 2, 3, 'Postfiliale 1230', 'Speisinger Straße 6'),
(6, 3, 2, 'Postfiliale Mariahilferstraße', 'Mariahilferstraße 6');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `height` varchar(30) DEFAULT NULL,
  `weight` varchar(30) DEFAULT NULL,
  `content` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `fk_employee_id`, `height`, `weight`, `content`) VALUES
(1, 1, '2 metres', '50kg', 'Wardrobe'),
(2, 3, '1 metres', '3kg', 'Table'),
(3, 3, '20 cm', '1 kg', 'Stack of Letters'),
(4, 1, '1 metres', '1 kg', 'Painting'),
(5, 2, '1,34 metres', '0,7 kg', 'PC-Monitor'),
(6, 2, '2 metres', '50 kg', 'Wooden Door');

-- --------------------------------------------------------

--
-- Table structure for table `progressing_system`
--

CREATE TABLE `progressing_system` (
  `system_id` int(11) NOT NULL,
  `progressing_time` varchar(30) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `progressing_system`
--

INSERT INTO `progressing_system` (`system_id`, `progressing_time`, `fk_package_id`, `fk_employee_id`) VALUES
(1, '3 days', 5, 3),
(2, '7 days', 3, 1),
(3, '6 days', 6, 2),
(4, '14 days', 1, 3),
(5, '2 days', 2, 2),
(6, '9 days', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `fk_delivering_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `address`, `fk_delivering_id`) VALUES
(1, 'Maria', 'Kraus', 'Ramsau 12', 1),
(2, 'Mark', 'Hirschberger', 'Mannheimerstraße 7/1', 2),
(3, 'Benjamin', 'Kozamel', 'Mainzer Straße 23', 2),
(4, 'Elena', 'Neumayer', 'Fahrerstraße 12', 2),
(5, 'Daniel', 'Schubert', 'Liverpoolstreet 11/1/6', 2),
(6, 'Beslinda', 'Rama', 'Hietzinger Kai 18/2/4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_country`
--

CREATE TABLE `recipient_country` (
  `re_address_id` int(11) NOT NULL,
  `country` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient_country`
--

INSERT INTO `recipient_country` (`re_address_id`, `country`, `state`, `fk_recipient_id`) VALUES
(1, 'Austria', 'Styria', 1),
(2, 'Germany', 'Cologne', 2),
(3, 'Germany', 'Berlin', 3),
(4, 'Austria', 'Salzburg', 4),
(5, 'United Kingdom', 'England', 5),
(6, 'Austria', 'Vienna', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_country`
--
ALTER TABLE `customer_country`
  ADD PRIMARY KEY (`cu_address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `delivering`
--
ALTER TABLE `delivering`
  ADD PRIMARY KEY (`delivering_id`),
  ADD KEY `fk_system_id` (`fk_system_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`deposit_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `mdscompany`
--
ALTER TABLE `mdscompany`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `progressing_system`
--
ALTER TABLE `progressing_system`
  ADD PRIMARY KEY (`system_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_delivering_id` (`fk_delivering_id`);

--
-- Indexes for table `recipient_country`
--
ALTER TABLE `recipient_country`
  ADD PRIMARY KEY (`re_address_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_country`
--
ALTER TABLE `customer_country`
  ADD CONSTRAINT `customer_country_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `delivering`
--
ALTER TABLE `delivering`
  ADD CONSTRAINT `delivering_ibfk_1` FOREIGN KEY (`fk_system_id`) REFERENCES `progressing_system` (`system_id`),
  ADD CONSTRAINT `delivering_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `delivering_ibfk_3` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`);

--
-- Constraints for table `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `mdscompany`
--
ALTER TABLE `mdscompany`
  ADD CONSTRAINT `mdscompany_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `mdscompany_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `progressing_system`
--
ALTER TABLE `progressing_system`
  ADD CONSTRAINT `progressing_system_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `progressing_system_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_delivering_id`) REFERENCES `delivering` (`delivering_id`);

--
-- Constraints for table `recipient_country`
--
ALTER TABLE `recipient_country`
  ADD CONSTRAINT `recipient_country_ibfk_1` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
