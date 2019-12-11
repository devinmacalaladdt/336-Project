-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com    Database: AirlineFlight
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aircraft`
--

DROP TABLE IF EXISTS `Aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft` (
  `Identifier` int(11) NOT NULL,
  `Maximum_capacity` int(11) DEFAULT NULL,
  `2letterID` char(2) DEFAULT NULL,
  PRIMARY KEY (`Identifier`),
  KEY `Aircraft_ibfk_1` (`2letterID`),
  CONSTRAINT `Aircraft_ibfk_1` FOREIGN KEY (`2letterID`) REFERENCES `Airline` (`2letterID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Airline`
--

DROP TABLE IF EXISTS `Airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airline` (
  `2letterID` char(2) NOT NULL,
  PRIMARY KEY (`2letterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `3letterID` char(3) NOT NULL,
  PRIMARY KEY (`3letterID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Associated`
--

DROP TABLE IF EXISTS `Associated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Associated` (
  `Unique_number` int(11) NOT NULL,
  `Flight` int(11) NOT NULL,
  `Seat` int(11) NOT NULL,
  PRIMARY KEY (`Unique_number`,`Seat`,`Flight`),
  KEY `Associated_ibfk_2_idx` (`Flight`),
  KEY `Associated_ibfk_3` (`Seat`),
  CONSTRAINT `Associated_ibfk_1` FOREIGN KEY (`Unique_number`) REFERENCES `Ticket` (`Unique_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Destination`
--

DROP TABLE IF EXISTS `Destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destination` (
  `3letterID` varchar(3) NOT NULL,
  `Flight` int(11) NOT NULL,
  PRIMARY KEY (`3letterID`,`Flight`),
  KEY `Destination_ibfk_2` (`Flight`),
  CONSTRAINT `Destination_ibfk_1` FOREIGN KEY (`3letterID`) REFERENCES `Airport` (`3letterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Destination_ibfk_2` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Domestic`
--

DROP TABLE IF EXISTS `Domestic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Domestic` (
  `Flight` int(11) DEFAULT NULL,
  KEY `Domestic_ibfk_1` (`Flight`),
  CONSTRAINT `Domestic_ibfk_1` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight` (
  `Flight` int(11) NOT NULL,
  `Departure_time` time DEFAULT NULL,
  `Days_of_operation` char(20) DEFAULT NULL,
  `Arrival_time` time DEFAULT NULL,
  `2letterID` char(2) DEFAULT NULL,
  `3letterID` char(3) DEFAULT NULL,
  `num_of_stops` int(11) DEFAULT NULL,
  PRIMARY KEY (`Flight`),
  KEY `Flight_ibfk_1` (`2letterID`),
  CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`2letterID`) REFERENCES `Airline` (`2letterID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `International`
--

DROP TABLE IF EXISTS `International`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `International` (
  `Flight` int(11) DEFAULT NULL,
  KEY `International_ibfk_1` (`Flight`),
  CONSTRAINT `International_ibfk_1` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Oneway`
--

DROP TABLE IF EXISTS `Oneway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Oneway` (
  `Unique_number` int(11) DEFAULT NULL,
  KEY `Oneway_ibfk_1` (`Unique_number`),
  CONSTRAINT `Oneway_ibfk_1` FOREIGN KEY (`Unique_number`) REFERENCES `Ticket` (`Unique_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Operates`
--

DROP TABLE IF EXISTS `Operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operates` (
  `2letterID` char(2) NOT NULL,
  `3letterID` char(3) NOT NULL,
  `number_of` int(11) DEFAULT NULL,
  PRIMARY KEY (`2letterID`,`3letterID`),
  KEY `Operates_ibfk_2` (`3letterID`),
  CONSTRAINT `Operates_ibfk_1` FOREIGN KEY (`2letterID`) REFERENCES `Airline` (`2letterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Operates_ibfk_2` FOREIGN KEY (`3letterID`) REFERENCES `Airport` (`3letterID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Operates2`
--

DROP TABLE IF EXISTS `Operates2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operates2` (
  `3letterID` char(3) DEFAULT NULL,
  `Identifier` int(11) DEFAULT NULL,
  `Flight` int(11) DEFAULT NULL,
  KEY `Operates2_ibfk_1` (`Identifier`),
  KEY `Operates2_ibfk_2` (`3letterID`),
  KEY `Operates2_ibfk_3` (`Flight`),
  CONSTRAINT `Operates2_ibfk_1` FOREIGN KEY (`Identifier`) REFERENCES `Aircraft` (`Identifier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Operates2_ibfk_2` FOREIGN KEY (`3letterID`) REFERENCES `Airport` (`3letterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Operates2_ibfk_3` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Owns`
--

DROP TABLE IF EXISTS `Owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Owns` (
  `2letterID` char(2) DEFAULT NULL,
  `Identifier` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `Owns_ibfk_1` (`2letterID`),
  KEY `Owns_ibfk_2` (`Identifier`),
  CONSTRAINT `Owns_ibfk_1` FOREIGN KEY (`2letterID`) REFERENCES `Airline` (`2letterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Owns_ibfk_2` FOREIGN KEY (`Identifier`) REFERENCES `Aircraft` (`Identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `Unique_number` int(11) NOT NULL,
  `accountname` varchar(50) NOT NULL,
  `valid` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Unique_number`,`accountname`),
  KEY `accountname` (`accountname`),
  CONSTRAINT `Unique_number` FOREIGN KEY (`Unique_number`) REFERENCES `Ticket` (`Unique_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accountname` FOREIGN KEY (`accountname`) REFERENCES `account` (`accountname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoundTrip`
--

DROP TABLE IF EXISTS `RoundTrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoundTrip` (
  `Unique_number` int(11) DEFAULT NULL,
  KEY `RoundTrip_ibfk_1` (`Unique_number`),
  CONSTRAINT `RoundTrip_ibfk_1` FOREIGN KEY (`Unique_number`) REFERENCES `Ticket` (`Unique_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `Seat` int(11) NOT NULL,
  `Meal_ordered` char(20) DEFAULT NULL,
  `Flight` int(11) NOT NULL,
  PRIMARY KEY (`Seat`,`Flight`),
  KEY `Seat_ibfk_1` (`Flight`),
  CONSTRAINT `Seat_ibfk_1` FOREIGN KEY (`Flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `Unique_number` int(11) NOT NULL,
  `Fare` decimal(10,2) DEFAULT NULL,
  `Booking_fee` decimal(10,2) DEFAULT NULL,
  `Date_of_purchase` date DEFAULT NULL,
  `sold` varchar(1) DEFAULT NULL,
  `flexable` varchar(1) DEFAULT NULL,
  `class` varchar(1) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Unique_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountname` varchar(50) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `account_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`accountname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waitlist`
--

DROP TABLE IF EXISTS `waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist` (
  `accountname` varchar(50) NOT NULL,
  `flight` int(11) NOT NULL,
  PRIMARY KEY (`accountname`,`flight`),
  KEY `waitlist_ibfk_2` (`flight`),
  CONSTRAINT `waitlist_ibfk_1` FOREIGN KEY (`accountname`) REFERENCES `account` (`accountname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `waitlist_ibfk_2` FOREIGN KEY (`flight`) REFERENCES `Flight` (`Flight`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-11  0:59:37
