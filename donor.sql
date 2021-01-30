-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 04, 2021 at 02:29 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donor`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `getBlood`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBlood` (IN `b_type` VARCHAR(255))  SELECT * FROM users WHERE users.b_type=b_type$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
CREATE TABLE IF NOT EXISTS `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `b_type` varchar(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(100) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup`
--

INSERT INTO `backup` (`id`, `first_name`, `last_name`, `email`, `dob`, `gender`, `b_type`, `address`, `city`, `mobile`, `created_at`) VALUES
(21, 'Vikash', 'l', 'vi@gmail.com', '1999-09-11', 'Male', 'A+', 'Vidyanagar', 'Bangalore', '9900876543', '2019-11-10 15:31:34'),
(17, 'Krupa', 'L', 'krupa@gmail.com', '1992-09-01', 'Female', 'AB+', '7th block ,48th cross ,Vasanthnagar', 'Bangalore', '7685845097', '2019-11-08 17:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `blood_banks`
--

DROP TABLE IF EXISTS `blood_banks`;
CREATE TABLE IF NOT EXISTS `blood_banks` (
  `hospital_id` int(255) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `hospital_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `contact` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_banks`
--

INSERT INTO `blood_banks` (`hospital_id`, `hospital_name`, `hospital_address`, `city`, `contact`) VALUES
(1001, 'A.I.I.M.S', 'Ansari Nagar,Ring Road', 'New Delhi-110029', 26588641),
(1002, 'Safdarjang Hospital', 'Ring Road', 'New Delhi-110029', 26168470),
(1003, 'Lions Blood Bank', 'Rpc Layout, Vijayanagar', 'Bangalore', 29067563),
(1004, 'Apollo Hospital', '21,Greams Lane Chennai-600006', 'Chennai', 26577453),
(1005, 'Breach Candy Hospital', 'Bhulabhai Desai Marg,Breach Candy Mumbai,Maharashtra 400026', 'Mumbai', 222367788);

-- --------------------------------------------------------

--
-- Table structure for table `blood_request`
--

DROP TABLE IF EXISTS `blood_request`;
CREATE TABLE IF NOT EXISTS `blood_request` (
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `blood_group` varchar(255) NOT NULL,
  `unitblood` int(20) NOT NULL,
  `hospitaladdress` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `doctorName` varchar(255) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(40) NOT NULL,
  `reasonblood` mediumtext NOT NULL,
  PRIMARY KEY (`firstName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_request`
--

INSERT INTO `blood_request` (`firstName`, `lastName`, `gender`, `blood_group`, `unitblood`, `hospitaladdress`, `city`, `pincode`, `doctorName`, `contactName`, `address`, `dob`, `email`, `mobile`, `reasonblood`) VALUES
('Vishwas', 'L', 'Male', 'O+', 2, 'Fortis Hospital,Rajajinagar', 'Bangalore', 560010, 'Dr.Kamath', 'Ruthvik', 'Vijaynagar', '2019-11-19', 'ruthvik@gmail.com', 21768901, 'Accident'),
('Suhas', 'P', 'Male', 'B-', 3, 'Kushal Hospital,Malleshwaram', 'Bangalore', 560011, 'Dr.Kamath', 'Sarvesh', 'R T Nagar', '2019-11-22', 'sarvesh@gmail.com', 6574890431, 'Operation'),
('Prasanthi', 'Q', 'Female', 'AB-', 7, 'Ananya Hospital,Rajajinagar 1st Block', 'Bangalore', 560010, 'Dr.Kulkarni', 'Prakash', 'Navarang,Rajajinagar', '2019-11-23', 'prakash@gmail.com', 8907651234, 'BloodPlatlets'),
('Aruna', 'L', 'Female', 'AB+', 2, 'Vikram Hospital,Cunningumroad', 'Bangalore', 560027, 'Dr.Vasanth', 'Praveen', 'Shantinagar', '2019-11-19', 'praveen@gmail.com', 8877665432, 'Operation');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
CREATE TABLE IF NOT EXISTS `donors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `lname` varchar(45) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `b_type` varchar(2) NOT NULL,
  `bday` date NOT NULL,
  `h_address` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `don_date` date NOT NULL,
  `stats` text NOT NULL,
  `temp` varchar(10) NOT NULL,
  `pulse` varchar(10) NOT NULL,
  `bp` varchar(10) NOT NULL,
  `weight` int(11) NOT NULL,
  `hemoglobin` varchar(25) NOT NULL,
  `hbsag` varchar(10) NOT NULL,
  `aids` varchar(15) NOT NULL,
  `malaria_smear` varchar(20) NOT NULL,
  `hematocrit` varchar(15) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`id`, `fname`, `mname`, `lname`, `sex`, `b_type`, `bday`, `h_address`, `city`, `don_date`, `stats`, `temp`, `pulse`, `bp`, `weight`, `hemoglobin`, `hbsag`, `aids`, `malaria_smear`, `hematocrit`, `phone`, `mobile`) VALUES
(30, 'Varun', '', 'Shrivastava', 'male', 'O+', '1994-07-16', '2647, Azad Nagar\r\nRanjhi , Front Of Goswami Buildi', 'Jabalpur', '2015-04-18', 'Normal', '30', '60', '80 | 120', 64, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', '2632181', '9827983762'),
(31, 'Priyanka', '', 'Yadav', 'female', 'A+', '1994-02-02', 'Somewhere near Panehra', 'Jabalpur', '2015-04-18', 'Normal', '30', '60', '80 | 120', 64, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', '', '8602042302'),
(32, 'Diksha', '', 'Gupta', 'female', 'O+', '1994-09-24', 'SBI Colony, Baldev Bagh\r\n', 'Jabalpur', '2015-04-19', 'Normal', '30', '70', '80 | 120', 52, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', '', '8269036096'),
(36, 'Varsha', 'Reddy', 'S', 'female', 'O-', '1999-08-06', '1st block Rajajinagar', 'Bangalore', '2019-11-10', 'Normal', '30', '60', '110|120', 48, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', NULL, '8105680862'),
(37, 'Aruna', '', 'T', 'female', 'B-', '1990-10-08', '5th Block Chikjala', 'Bangalore', '2019-12-05', 'Normal', '30', '60', '80|120', 70, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', '7689045', '7685940321'),
(35, 'Srikar', 'kalle', 'k', 'male', 'A+', '1998-09-01', '4th block 7th main road\r\nRajajinagar', 'Bangalore', '2015-08-09', 'Normal', '30', '60', '110|120', 65, '16 - 18 gm/dl', 'Negative', 'Negative', 'Negative', '45 - 62%', NULL, '886731970');

-- --------------------------------------------------------

--
-- Table structure for table `employeebackup`
--

DROP TABLE IF EXISTS `employeebackup`;
CREATE TABLE IF NOT EXISTS `employeebackup` (
  `id` int(11) NOT NULL,
  `f_name` varchar(35) NOT NULL,
  `m_name` varchar(15) DEFAULT NULL,
  `l_name` varchar(35) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `b_day` date NOT NULL,
  `prc_nr` int(25) NOT NULL,
  `designation` varchar(35) NOT NULL,
  `landline` varchar(10) DEFAULT NULL,
  `mobile_nr` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeebackup`
--

INSERT INTO `employeebackup` (`id`, `f_name`, `m_name`, `l_name`, `username`, `password`, `b_day`, `prc_nr`, `designation`, `landline`, `mobile_nr`) VALUES
(23, 'kiran', NULL, 'l', 'kir_k', '450', '2019-11-23', 26754319, 'Student', '2301638', '9908556780'),
(24, 'akul', NULL, 'balaji', 'akul_l', '678', '2019-11-25', 23456, 'Student', '2301635', '7788906548'),
(55, 'Sathyanarayana', NULL, 'M S', 'sathyanarayana', 'sathya123', '1990-09-01', 345677881, 'Employee', NULL, '9876500654'),
(44, 'Aruna', 'a', 'T', 'aruna_t', 'aruna345', '1990-11-13', 456788299, 'Employee', '3456717', '7689054311'),
(57, 'Suraj', NULL, 'P', 'suraj_p', '890', '1990-11-01', 21345678, 'Student', '2356789', '996655432'),
(56, 'kiran', 'kumar', 'A', 'kiran_a', '678', '1990-11-04', 23456789, 'Student', '2111567', '990855678');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(35) NOT NULL,
  `m_name` varchar(15) DEFAULT NULL,
  `l_name` varchar(35) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `b_day` date NOT NULL,
  `prc_nr` int(100) NOT NULL,
  `designation` varchar(35) NOT NULL,
  `landline` varchar(10) DEFAULT NULL,
  `mobile_nr` varchar(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `prc_nr` (`prc_nr`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `f_name`, `m_name`, `l_name`, `username`, `password`, `b_day`, `prc_nr`, `designation`, `landline`, `mobile_nr`) VALUES
(11, 'Varun', '', 'Shrivastava', 'vs_lala', '123', '1994-07-16', 2147483647, 'Student', '2632181', '9827983762'),
(22, 'Srikar', ' sharma', 'K', 'sri_k', '456', '1998-09-01', 2117835677, 'Student', '23016380', '8877667543'),
(33, 'Varsha', '', 'S', 'varsha_reddy', '6899', '1999-08-06', 2107789647, 'Student', '2134567', '8105680862'),
(58, 'Satyanarayana', '', 'M S', 'satya_ms', '2721', '1990-11-01', 2135043191, 'Employee', '63149721', '9844969036'),
(60, 'Richard', NULL, 'Louise', 'richard_louise', 'richard990', '1997-08-28', 1147489647, 'Artist', NULL, '7869042317'),
(59, 'Aruna', '', 'T', 'aruna_t', 'aruna123', '1990-10-08', 2063738361, 'Employee', '7689045', '7685940321'),
(61, 'Ram', NULL, 'Prasad', 'ramprasad', 'ramushiv', '1989-11-30', 1047465437, 'Chief Executive Officer', NULL, '8879065789');

--
-- Triggers `employees`
--
DROP TRIGGER IF EXISTS `empbackup`;
DELIMITER $$
CREATE TRIGGER `empbackup` AFTER DELETE ON `employees` FOR EACH ROW INSERT INTO employeebackup VALUES 
(OLD.id,OLD.f_name,OLD.m_name,OLD.l_name,OLD.username,OLD.password,OLD.b_day,OLD.prc_nr,OLD.designation,OLD.landline,OLD.mobile_nr)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `member_admin`
--

DROP TABLE IF EXISTS `member_admin`;
CREATE TABLE IF NOT EXISTS `member_admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `b_type` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_admin`
--

INSERT INTO `member_admin` (`id`, `first_name`, `last_name`, `email`, `DOB`, `gender`, `b_type`, `address`, `city`, `created_date`) VALUES
(1, 'Srikar', 'K', 'srikarsharma16@gmail.com', '1998-09-01', 'Male', 'A+', '4th Block Rajajinagar', 'Bangalore', '2019-11-07 07:35:10'),
(2, 'Varsha', 'S', 'varshareddy71@gmail.com', '1999-08-06', 'Female', 'O-', '1st Block Rajajinagar', 'Bangalore', '2019-11-08 08:00:00'),
(3, 'Vipul ', 'Balar', 'vipulbalar@gmail.com', '1998-12-03', 'Male', 'B+', '2nd Block,Kachiguda', 'Hyderabad', '2019-11-09 04:00:00'),
(4, 'Bhoomika', 'M', 'bhoomikareddy@gmail.com', '1999-04-02', 'Female', 'AB+', '7th Main Road,Thane', 'Mumbai', '2019-11-08 02:40:10'),
(5, 'Shreyas', 'Iyer', 'shreyas@gmail.com', '1999-08-09', 'Male', 'B-', 'Azad Nagar, Ranjhi', 'Jabalpur', '2019-11-08 17:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `b_type` varchar(10) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(100) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `dob`, `gender`, `b_type`, `address`, `city`, `mobile`, `created_at`) VALUES
(1, 'Varun', 'Shrivastava', 'varunshrivastava007@gmail.com', '1994-07-16', 'Male', 'O+', '2647, Azad Nagar\r\nRanjhi , Front Of Goswami Building', 'Jabalpur', '9827983762', '2015-04-19 17:12:26'),
(2, 'Diksha', 'Gupta', 'diksha24gupta24@gmail.com', '1994-09-24', 'Female', 'B+', 'State Bank Colony,\r\nSingle Story,\r\nBal Dev Bagh\r\n', 'Jabalpur', '8269036096', '2015-04-28 10:08:46'),
(3, 'Vaibhav', 'Shrivastava', 'iammagnificient@gmail.com', '2000-02-15', 'Male', 'O+', '2631, Azad Nagar,\r\nRanjhi, Jabalpur', 'Jabalpur', '8871479418', '2015-04-30 06:27:06'),
(4, 'Srikar', 'K', 'srikarsharma16@gmail.com', '1998-09-01', 'Male', 'O+', '4th block 7th main road\r\nRajajinagar', 'Bangalore', '08867319703', '2019-11-15 16:53:15'),
(5, 'Varsha', 'S', 'varshareddy71@gmail.com', '1999-08-06', 'Female', 'O-', 'Rajajinagar', 'Bangalore', '8105680862', '2019-11-15 16:52:22'),
(8, 'Sujatha', 'M', 'sujathasrinivas@gmail.com', '1960-09-20', 'Female', 'A+', '3/1,JUBLIE HILLS,8TH MAIN ROAD', 'Hyderabad', '8796905050', '2019-11-15 16:53:00'),
(9, 'Srinivas', 'V', 'srinivassrini@gmail.com', '1978-05-26', 'Male', 'B+', '2321,1 main road,shivajinagar.', 'Davangere', '9481473962', '2019-11-15 16:53:36'),
(11, 'Anitha', 'Gowda', 'annilovely@gmail.com', '1989-11-30', 'Female', 'A+', '2324,8th cross,marathalli', 'Shivmoga', '9988732321', '2019-12-10 07:30:05'),
(12, 'Amrutha', 'Sunil', 'amruthasunil@gmail.com', '1990-05-20', 'Female', 'A-', '5/7,2nd main road,HR hills', 'Gulbarga', '9845678321', '2019-12-10 07:18:36'),
(13, 'Ram', 'Prasad', 'ramprasad@gmail.com', '1970-06-05', 'Male', 'AB+', '4/5,13th cross,BTM layout', 'Hyderabad', '8879065789', '2019-11-16 05:30:56'),
(14, 'Deepak', 'Sharma', 'deepaksharma@gmail.com', '1993-07-06', 'Male', 'AB+', '3/2,9th cross,ram mandir', 'Hyderabad', '9080706021', '2019-11-15 16:54:36'),
(15, 'Sagarika', 'Manu', 'sagarikamanu@gmail.com', '1992-06-24', 'Female', 'O-', '2/1,12th cross,basvangudi', 'Bangalore', '8873456781', '2019-11-15 16:54:57'),
(16, 'Muralidhra', 'Kalle', 'muralidhrakalle@gmail.com', '1980-04-10', 'Male', 'AB-', '5/3,Ansari Nagar,Ring Road', 'New Delhi', '9787654321', '2019-12-10 07:45:43'),
(17, 'Richard', 'Louise', 'richard@gmail.om', '1997-08-28', 'Male', 'B-', 'Lonavala, Pune', 'Pune', '7869042317', '2019-12-05 17:25:10'),
(18, 'Satyanarayana', 'M S', 'satya_ms@gmail.com', '1990-11-01', 'Male', 'AB+', '19th T Block, Botakpur', 'Mumbai', '9844969036', '2019-12-10 07:19:54'),
(19, 'Aruna ', 'T', 'aruna_t@gmsil.com', '1990-10-08', 'Female', 'B-', '5th Block Chikjala', 'Bangalore', '7685940321', '2019-12-10 07:06:56');

--
-- Triggers `users`
--
DROP TRIGGER IF EXISTS `usersbackup`;
DELIMITER $$
CREATE TRIGGER `usersbackup` AFTER DELETE ON `users` FOR EACH ROW INSERT INTO backup VALUES
(OLD.ID,OLD.first_name,OLD.last_name,OLD.email,OLD.dob,OLD.gender,OLD.b_type,OLD.address,OLD.city,OLD.mobile,OLD.created_at)
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
