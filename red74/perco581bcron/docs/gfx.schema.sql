-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `GFxPRoduction_archive03` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Machine` char(20) DEFAULT NULL,
  `Part` char(20) DEFAULT NULL,
  `PerpetualCount` int(11) DEFAULT NULL,
  `TimeStamp` double(20,2) DEFAULT NULL,
  `Count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `Machine` (`Machine`),
  KEY `Part_TimeStamp` (`Part`,`TimeStamp`),
  KEY `Machine_TimeStamp` (`Machine`,`TimeStamp`),
  KEY `Machine_Part` (`Machine`,`Part`),
  KEY `Part_Machine` (`Part`,`Machine`),
  KEY `Part_TimeStamp_Machine` (`Part`,`TimeStamp`,`Machine`),
  KEY `TimeStamp` (`TimeStamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2023-11-28 19:26:15