#!/usr/bin/bash
SANDBOX=sandbox_$RANDOM
echo Using sandbox $SANDBOX
#
# Stop services
/etc/init.d/apache2 stop
/etc/init.d/mysql stop
#
apt-get update
#
apt-get -q -y remove apache2
apt-get -q -y install apache2
#
apt-get -q -y remove mysql-server mysql-client
echo mysql-server mysql-server/root_password password password | debconf-set-selections
echo mysql-server mysql-server/root_password_again password password | debconf-set-selections
apt-get -q -y install mysql-server mysql-client
#
cd /tmp
mkdir $SANDBOX
cd $SANDBOX/
git clone https://github.com/FSlyne/NCIRL.git
cd NCIRL/
#
cp Apache/www/* /var/www/
cp Apache/cgi-bin/* /usr/lib/cgi-bin/
chmod a+x /usr/lib/cgi-bin/*
#
# Start services
/etc/init.d/apache2 start
/etc/init.d/mysql start
#
cat <<FINISH | mysql -uroot -ppassword
--
-- Database: `TTCPlayer`
--
CREATE DATABASE IF NOT EXISTS `TTCPlayer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
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
--Insert data into `Player` table
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
-- Insert data into `Team` table
--

INSERT INTO `Team` (`ID`, `TeamName`, `TeamColour`, `TeamCaptain`) VALUES
(1, 'Madmen', 'Red', 6),
(2, 'Sadmen', 'Blue', 0),
(3, 'Rovers', 'Green', 0);

--
-- Indexes for tables
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
select * from Player
FINISH
#
cd /tmp
rm -rf $SANDBOX

