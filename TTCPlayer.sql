-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2014 at 10:05 AM
-- Server version: 5.5.39-MariaDB
-- PHP Version: 5.5.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `TTCPlayer`
--
CREATE DATABASE IF NOT EXISTS `TTCPlayer`;
USE `TTCPlayer`;

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
CREATE TABLE IF NOT EXISTS `Player` (
`ID` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `teamID` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`ID`, `firstname`, `lastname`, `prefix`, `mobile`, `email`, `teamID`) VALUES
(6, 'Albert', 'Einstien', '098', '979797080', 'al@emc.sq', 1),
(12, 'Peter', 'Parker', '989', '63547456', 'pp@spidy.web', 2),
(14, 'Eric', 'Banna', '9875', '9879574', 'eb@thehulk.huge', 3),
(15, 'Clark', 'Kent', '086', '987987', 'ck@krypton.kry', 2),
(16, 'Bruce', 'Wayne', '098', '37495474', 'bruc@bat.man', 3),
(17, 'Richard', 'Gray', '374', '8347857', 'rich@gr.ay', 2),
(18, 'Ian', 'Caprani', '097', '8748487', 'ian@cap.rani', 2),
(20, 'Tall', 'Paul', '090', '847594', 'tp@pt.tp', 3),
(21, 'Roy', 'Keane', '021', '98778080', 'roy@key.ne', 3),
(24, 'Derek', 'Caprani', '087', '9679097', 'dcaprani@me.com', 1),
(25, 'Hairy', 'Mairy', '086', '0980980', 'hm@mh.ie', 1),
(26, 'John', 'Joe', '083', '0989879890', 'johnJoe@jj.jj', 1),
(28, '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
CREATE TABLE IF NOT EXISTS `Team` (
`ID` int(11) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `TeamColour` varchar(50) NOT NULL,
  `TeamCaptain` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`ID`, `TeamName`, `TeamColour`, `TeamCaptain`) VALUES
(1, 'Madmen', 'Red', 6),
(2, 'Sadmen', 'Blue', 0),
(3, 'Rovers', 'Green', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Player`
--
ALTER TABLE `Player`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Player`
--
ALTER TABLE `Player`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `Team`
--
ALTER TABLE `Team`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
