-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2018 at 02:21 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `car servo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `no_of_users`()
    NO SQL
select count(*) from user_details$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `accessories_name` varchar(40) NOT NULL DEFAULT '',
  `quantity` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`user_name`,`accessories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`user_name`, `accessories_name`, `quantity`, `price`) VALUES
('Shrisha Adiga', 'alloy mag wheel', 1, 5000.00),
('Shrisha Adiga', 'car seat organizer', 1, 5000.00),
('Shrisha Adiga', 'Gold Mag Wheel', 4, 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `modification`
--

CREATE TABLE IF NOT EXISTS `modification` (
  `user_name` varchar(50) NOT NULL,
  `current_car` varchar(20) NOT NULL,
  `Modification_type` varchar(100) NOT NULL,
  `other_options` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `other_colors` varchar(20) NOT NULL,
  `other_req` varchar(50) NOT NULL,
  `garage_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modification`
--

INSERT INTO `modification` (`user_name`, `current_car`, `Modification_type`, `other_options`, `color`, `other_colors`, `other_req`, `garage_name`) VALUES
('Shrisha Adiga', 'Ciaz', 'Suspension And Clearance,Sun Roof', '', 'red', '', '', 'Auto Matrix');

-- --------------------------------------------------------

--
-- Table structure for table `noofusers`
--

CREATE TABLE IF NOT EXISTS `noofusers` (
  `no` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noofusers`
--

INSERT INTO `noofusers` (`no`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE IF NOT EXISTS `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(50) NOT NULL,
  `price` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `image`, `price`) VALUES
(10, 'car seat organizer', 'pics\\seat.jpg', '5000.00'),
(31, 'alloy mag wheel', 'pics\\alloy mag wheel.jpg', '5000.00'),
(34, 'Gold Mag Wheel', 'pics/gold color mag wheel.jpg', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `Full_Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `psw_repeat` varchar(30) NOT NULL,
  `Car_name` varchar(30) NOT NULL,
  `Car_no` varchar(30) NOT NULL,
  `Car_type` varchar(30) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`Full_Name`, `Email`, `Password`, `psw_repeat`, `Car_name`, `Car_no`, `Car_type`, `id`) VALUES
('Shrisha', 'shrishadiga1@gmail.com', '123', '123', 'XUV 500', 'KA 14 Z 2685', 'SUV', 1),
('Yashas ', 'yashassc@gmail.com', '111', '111', 'Ignis', 'KA 51 MR 8421', 'Hatchback', 2),
('Shrisha Adiga', 'adigashrishu@gmail.com', '123', '123', 'XUV 500', 'KA 51 MR 8421', 'SUV', 3),
('Rajath', 'rajath@gmail.com', 'qwe', 'qwe', 'XUV 500', 'KA 14 Z 2685', 'SUV', 4),
('Rakesh', 'rock@gmail.com', 'r', 'r', 'Mclaren', '007', 'Hatchback', 5),
('Shri', 'shri@gmail.com', '123', '123', 'Benz', 'KA 51 MR 8421', 'Sedan', 6);

--
-- Triggers `user_details`
--
DROP TRIGGER IF EXISTS `update_users`;
DELIMITER //
CREATE TRIGGER `update_users` AFTER INSERT ON `user_details`
 FOR EACH ROW update noofusers set no=no+1
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wash_details`
--

CREATE TABLE IF NOT EXISTS `wash_details` (
  `Full_Name` varchar(30) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `ctype` varchar(20) NOT NULL,
  `wtype` varchar(20) NOT NULL,
  `datew` date NOT NULL,
  `gd` varchar(35) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `wash_details`
--

INSERT INTO `wash_details` (`Full_Name`, `cname`, `cno`, `ctype`, `wtype`, `datew`, `gd`, `id`) VALUES
('Shrisha Adiga', 'XUV 500', 'KA 51 MR 8421', 'sedan', 'complete', '2018-11-06', 'nissan', 1),
('Yashas', 'Baleno', 'KA 14 Z 8421', 'hatch', 'exterior', '2018-11-20', 'dc', 2),
('Shrisha Adiga', 'Ignis', 'KA 14 Z 2685', 'hatch', 'complete', '2018-11-29', 'nissan', 3),
('Yashas', 'Chervolet Cruze', 'KA 14 X 143', 'sedan', 'exterior', '2018-12-09', 'nexa', 4),
('Shrisha ', 'XUV 500', 'KA 14 X 143', 'sedan', 'complete', '2018-11-29', 'supreme', 5),
('Shrisha Adiga', 'Chervolet Cruze', 'KA 14 Z 2685', 'sedan', 'complete', '2018-11-30', 'supreme', 6),
('Shrisha Adiga', 'Ciaz', 'KA 14 X 4049', 'sedan', 'exterior', '2018-11-17', 'dc', 7),
('Rajath', 'XUV 500', 'KA 14 X 143', 'sedan', 'complete', '2018-11-29', 'nexa', 8),
('Yashas', 'Ignis', 'KA 14 Z 2685', 'hatch', 'complete', '2018-11-28', 'supreme', 9),
('Shrisha Adiga', 'PajeroSport', 'KA 20 X 8421', 'sedan', 'complete', '2018-12-24', 'nexa', 10),
('Shrisha Adiga', 'Swift', 'KA 20 V 9080', 'hatch', 'exterior', '2018-12-25', 'supreme', 11),
('Shrisha Adiga', 'Lancer', 'KA 18 A 1123', 'sedan', 'exterior', '2018-11-23', 'nexa', 12);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
