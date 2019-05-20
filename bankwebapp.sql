-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 01:48 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankwebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accno` char(5) NOT NULL,
  `name` char(20) NOT NULL,
  `address` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accno`, `name`, `address`) VALUES
('sf001', 'fabian', 'askme'),
('cm001', 'dannyboy', 'me'),
('sf002', 'myname', 'das');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `accno` char(5) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`accno`, `amount`, `date`, `type`) VALUES
('sf001', 40, '2019-05-15 16:20:19', 'd'),
('sf001', 40, '2019-05-15 16:21:18', 'd'),
('sf001', 40, '2019-05-15 16:21:55', 'd'),
('sf001', 40, '2019-05-15 16:22:56', 'd'),
('sf001', 100, '2019-05-15 16:45:08', 'd'),
('cm001', 50, '2019-05-20 11:15:15', 'd'),
('cm001', 50, '2019-05-20 11:15:49', 'd'),
('cm001', 10, '2019-05-20 11:16:04', 'w'),
('cm001', 18, '2019-05-20 12:29:06', 'd'),
('cm001', 12, '2019-05-20 12:29:18', 'd'),
('cm001', 12, '2019-05-20 12:30:40', 'd'),
('cm001', 100, '2019-05-20 12:31:21', 'd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `accno` char(5) NOT NULL,
  `password` char(20) NOT NULL,
  `role` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`accno`, `password`, `role`, `active`) VALUES
('admin', 'password', 2, 1),
('cm001', 'me', 1, 1),
('sf001', 'p', 1, 1),
('sf002', 'a', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`accno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
