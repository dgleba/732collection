
-- create db and import data

create database if not exists dkr2;

SET GLOBAL sql_mode = '';

--



/*!40000 DROP DATABASE IF EXISTS `dgnote130`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dgnote130` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dgnote130`;


--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `genre` enum('fantasy','mystery','nonfiction') NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `title`, `genre`, `description`) VALUES (1,'The Lord of the Rings','fantasy','The Lord of the Rings is an epic fantasy novel written by philologist and University of Oxford professor J. R. R. Tolkien (from Wikipedia).'),(2,'The Maltese Falcon','mystery','The Maltese Falcon is a 1930 detective novel by Dashiell Hammett, originally serialized in the magazine Black Mask (from Wikipedia).'),(3,'Economics in One Lesson','nonfiction','dg2. Economics in One Lesson is an introduction to free market economics written by Henry Hazlitt and published in 1946, based on FrÃ©dÃ©ric Bastiat\\\'s essay Ce qu\\\'on voit et ce qu\\\'on ne voit pas (English: \\\"What is Seen and What is Not Seen\\\") (from Wikipedia).'),(4,'dg2','mystery','a book for dg.'),(5,'a','fantasy','2015-10-05_Mon_12.25-PM');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--
SET GLOBAL sql_mode = '';

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` int(11) DEFAULT NULL,
  `staten` int(11) DEFAULT NULL,
  `cityn` int(11) DEFAULT NULL,
  `updatedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdtime` datetime  ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

SET GLOBAL sql_mode = '';

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` (`id`, `country`, `staten`, `cityn`, `updatedtime`, `createdtime`) VALUES (1,1,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,3,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,2,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,3,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,2,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,3,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,2,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,3,NULL,NULL,'2016-04-11 12:14:20','2016-04-11 12:14:20'),(10,1,NULL,NULL,'2016-04-11 12:18:10','2016-04-11 12:18:10'),(11,1,NULL,NULL,'2016-04-11 12:41:44','2016-04-11 12:41:44'),(12,2,NULL,NULL,'2016-04-11 12:43:46','2016-04-11 12:43:46'),(13,3,6,12,'2016-04-12 12:20:09','2016-04-12 12:20:09'),(14,2,4,8,'2016-04-12 12:21:28','2016-04-12 12:21:28'),(15,2,4,8,'2016-04-12 12:21:57','2016-04-12 12:21:57'),(16,2,3,6,'2016-04-12 12:22:36','2016-04-12 12:22:36'),(17,2,4,7,'2016-04-12 12:26:00','2016-04-12 12:26:00'),(18,2,4,7,'2016-04-12 12:26:10','2016-04-12 12:26:10'),(19,2,4,8,'2016-04-12 13:38:43','2016-04-12 13:38:43'),(20,3,5,10,'2016-04-12 13:39:20','2016-04-12 13:39:20'),(21,3,6,12,'2016-04-12 13:44:32','2016-04-12 13:44:32'),(22,1,2,3,'2016-04-12 13:47:50','2016-04-12 13:47:50'),(23,1,1,1,'2016-04-12 13:52:12','2016-04-12 13:52:12'),(24,3,6,12,'2016-04-12 14:54:00','2016-04-12 14:54:00'),(25,2,4,7,'2016-04-12 20:09:40','2016-04-12 20:09:40'),(26,2,3,5,'2016-04-12 20:12:23','2016-04-12 20:12:23'),(27,3,6,11,'2016-04-12 20:13:44','2016-04-12 20:13:44'),(28,3,6,11,'2016-04-12 20:19:45','2016-04-12 20:19:45'),(29,2,3,5,'2016-04-12 20:20:20','2016-04-12 20:20:20'),(30,1,2,4,'2016-04-12 20:26:01','2016-04-12 20:26:01'),(31,3,5,10,'2016-04-12 20:27:13','2016-04-12 20:27:13'),(32,3,5,10,'2016-04-12 20:28:49','2016-04-12 20:28:49'),(33,2,3,6,'2016-04-12 20:31:59','2016-04-12 20:31:59'),(34,2,3,5,'2016-04-12 20:36:37','2016-04-12 20:36:37'),(35,2,3,5,'2016-04-12 20:37:44','2016-04-12 20:37:44'),(36,1,2,4,'2016-04-12 20:40:48','2016-04-12 20:40:48'),(37,2,3,5,'2016-04-12 20:41:14','2016-04-12 20:41:14'),(38,3,5,10,'2016-04-12 20:42:43','2016-04-12 20:42:43'),(39,1,1,2,'2016-04-12 20:43:22','2016-04-12 20:43:22'),(40,2,3,5,'2016-04-12 20:44:41','2016-04-12 20:44:41'),(41,1,1,2,'2016-04-12 20:45:27','2016-04-12 20:45:27'),(42,3,5,10,'2016-04-12 20:45:57','2016-04-12 20:45:57'),(43,3,6,11,'2016-04-12 20:46:19','2016-04-12 20:46:19'),(44,2,4,8,'2016-04-12 20:57:29','2016-04-12 20:57:29');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`dg417`@`localhost`*/ /*!50003 TRIGGER notes_trigger_created BEFORE INSERT ON 
notes
FOR EACH ROW BEGIN
SET new.createdtime := now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


--
-- Table structure for table `nte_note`
--

DROP TABLE IF EXISTS `nte_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nte_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_fld` text,
  `tags_fld` varchar(244) DEFAULT NULL,
  `state_fld` varchar(99) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  `datenote` datetime DEFAULT NULL,
  `active` enum('Yes','No') DEFAULT 'Yes',
  `note2` text,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nte_note`
--

LOCK TABLES `nte_note` WRITE;
/*!40000 ALTER TABLE `nte_note` DISABLE KEYS */;
INSERT INTO `nte_note` (`note_id`, `note_fld`, `tags_fld`, `state_fld`, `country_id`, `province_id`, `city_id`, `createdtime`, `updatedtime`, `datenote`, `active`, `note2`) VALUES (2836,'<p>a</p>',NULL,NULL,NULL,NULL,NULL,'2012-07-16 16:38:16','2012-07-16 12:38:16',NULL,NULL,'<p>a</p>'),(2837,'<p>b</p>',NULL,NULL,NULL,NULL,NULL,'2012-07-16 16:38:59','2012-07-16 12:38:59',NULL,NULL,'<p>b</p>'),(2838,'a',NULL,NULL,NULL,NULL,NULL,'2012-07-16 17:01:01','2013-04-15 11:55:51',NULL,NULL,'a'),(2839,'<p>e</p>',NULL,NULL,NULL,NULL,NULL,'2012-07-16 17:04:29','2012-07-16 13:09:20',NULL,NULL,'<p>e</p>'),(2840,'2013-04-08_Mon_11.49-AM',NULL,NULL,NULL,NULL,NULL,'2013-04-08 15:49:08','2013-04-15 11:49:15',NULL,NULL,'2013-04-08_Mon_11.49-AM'),(2841,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-08 15:50:09','2013-04-08 11:50:09',NULL,NULL,NULL),(2842,'11:56AM',NULL,NULL,NULL,NULL,NULL,'2013-04-08 15:56:29','2013-04-15 11:53:44',NULL,'No','11:56AM'),(2843,'2013-04-08_Mon_12.01-PM',NULL,NULL,NULL,NULL,NULL,'2013-04-08 16:01:39','2013-04-15 11:49:37',NULL,NULL,'2013-04-08_Mon_12.01-PM'),(2844,'<p>tagger1.</p>\r\n<p>2013-04-08_Mon_12.04-PM</p>',NULL,NULL,NULL,NULL,NULL,'2013-04-08 16:04:21','2013-04-08 12:05:29',NULL,NULL,'<p>tagger1.</p>\r\n<p>2013-04-08_Mon_12.04-PM</p>'),(2845,'2845\r\n',NULL,NULL,NULL,NULL,NULL,'2013-04-08 19:13:48','2013-04-24 15:43:18',NULL,'No','2845\r\n'),(2846,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-08 19:53:15','2013-04-08 15:53:15',NULL,NULL,NULL),(2847,' 2013-04-09_Tue_08.26-AM ',NULL,'Tennessee',NULL,NULL,NULL,'2013-04-09 12:26:16','2013-09-11 11:05:04',NULL,'Yes','2013-04-09_Tue_08.26-AM'),(2848,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-09 12:31:02','2013-04-09 08:32:07','2013-04-09 11:31:23','Yes',NULL),(2849,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-09 12:47:16','2013-04-10 09:19:50','2013-04-09 08:47:23','Yes',NULL),(2850,'q',NULL,NULL,NULL,NULL,NULL,'2013-04-15 18:16:23','2013-04-15 14:16:56','2013-04-10 14:16:23',NULL,'q'),(2851,'Either spotting a gap in the market or just out of loyalty to its best buddy Microsoft, Dell has released its own Windows RT slate. Aimed at business users, the 10.1-inch Dell XPS 10 is another transformer-style laptop-tablet hybrid, shipping with an attachable keyboard that turns it into a laptop for working on the move.\r\nThe Dell XPS 10 falls into a crowded market, with a host of devices aiming to please similar needs. The Asus VivoTab, Samsung Ativ Tab and of course the Microsoft Surface RT are all offering the same USP, and there are other hybrids such as the Lenovo IdeaPad Yoga 11 too.\r\nWhile there\'s no shortage of big players in the market, Dell\'s late arrival doesn\'t mean it\'s too far behind; no RT device has gained any traction to date.\r\n\r\nBuying Guide\r\n\r\n10 best tablet PCs in the world today\r\nThe XPS 10 fits perfectly into Dell\'s line up of high end machines, joining its XPS 12, XPS 13 and XPS 15 siblings. It looks like an XPS, with a soft black finish and a rubberised texture, and the same rounded chiclet keys adorning the base station.\r\nThe XPS range is certainly high quality, and each component of the 10-inch RT tablet follows this design ethos to a tee.\r\nCompared to some notable offenders, Dell has managed to keep the price down to a reasonable level. The base level 32GB device without the keyboard costs £299/US$449.99, the 32GB version with the keyboard dock costs £409/US$599.99, the 64GB without a keyboard costs £339/US$499.99, while the 64GB version with the dock is £444/US$649.99.\r\n',NULL,NULL,NULL,NULL,NULL,'2013-04-18 15:12:59','2013-04-18 11:49:54',NULL,NULL,'Either spotting a gap in the market or just out of loyalty to its best buddy Microsoft, Dell has released its own Windows RT slate. Aimed at business users, the 10.1-inch Dell XPS 10 is another transformer-style laptop-tablet hybrid, shipping with an attachable keyboard that turns it into a laptop for working on the move.\r\nThe Dell XPS 10 falls into a crowded market, with a host of devices aiming to please similar needs. The Asus VivoTab, Samsung Ativ Tab and of course the Microsoft Surface RT are all offering the same USP, and there are other hybrids such as the Lenovo IdeaPad Yoga 11 too.\r\nWhile there\'s no shortage of big players in the market, Dell\'s late arrival doesn\'t mean it\'s too far behind; no RT device has gained any traction to date.\r\n\r\nBuying Guide\r\n\r\n10 best tablet PCs in the world today\r\nThe XPS 10 fits perfectly into Dell\'s line up of high end machines, joining its XPS 12, XPS 13 and XPS 15 siblings. It looks like an XPS, with a soft black finish and a rubberised texture, and the same rounded chiclet keys adorning the base station.\r\nThe XPS range is certainly high quality, and each component of the 10-inch RT tablet follows this design ethos to a tee.\r\nCompared to some notable offenders, Dell has managed to keep the price down to a reasonable level. The base level 32GB device without the keyboard costs £299/US$449.99, the 32GB version with the keyboard dock costs £409/US$599.99, the 64GB without a keyboard costs £339/US$499.99, while the 64GB version with the dock is £444/US$649.99.\r\n'),(2852,'test mail send',NULL,NULL,NULL,NULL,NULL,'2013-04-19 18:09:18','2013-04-19 14:09:18','2013-04-19 14:09:23',NULL,'test mail send'),(2853,'test tags',NULL,NULL,NULL,NULL,NULL,'2013-04-19 18:09:53','2013-04-19 14:09:53',NULL,NULL,'test tags'),(2854,'04:00PM',NULL,NULL,NULL,NULL,NULL,'2013-04-19 20:00:52','2013-04-19 16:00:52',NULL,NULL,'04:00PM'),(2855,'04:27PM',NULL,NULL,NULL,NULL,NULL,'2013-04-19 20:27:08','2013-04-19 16:27:08',NULL,NULL,'04:27PM'),(2856,'2013-04-19_Fri_16.29-PM\r\ntest note.\r\n.\r\nx',NULL,NULL,NULL,NULL,NULL,'2013-04-19 20:30:11','2013-04-19 16:30:11',NULL,NULL,'2013-04-19_Fri_16.29-PM\r\ntest note.\r\n.\r\nx'),(2857,'2013-04-22_Mon_10.30-AM test csd email',NULL,NULL,NULL,NULL,NULL,'2013-04-22 14:30:55','2013-04-22 10:30:55','2013-04-22 10:30:23','Yes','2013-04-22_Mon_10.30-AM test csd email'),(2858,'a',NULL,NULL,NULL,NULL,NULL,'2013-04-22 14:33:43','2013-04-22 10:33:43','2013-04-22 10:33:23','No','a'),(2859,'test double email',NULL,NULL,NULL,NULL,NULL,'2013-04-22 14:40:15','2013-04-22 10:40:15','2013-04-22 10:40:23','Yes','test double email'),(2860,'cleaned up',NULL,NULL,NULL,NULL,NULL,'2013-04-22 15:03:50','2013-04-22 11:03:50','2013-04-22 11:03:23','Yes','cleaned up'),(2861,'Get Involved\r\n\r\nIf you want to help contribute to Ubuntu then you\'ve come to the right place. Keep reading to learn how.\r\n\r\nYou have just taken your first step toward getting involved. Before you get started, we ask that you please observe the Ubuntu Code of Conduct, it\'s not very long and it will help you get started.\r\n\r\nNow that\'s done. To find out the best way to get started, you should check out our community page.\r\n\r\nTeams\r\n\r\nThe Teams page contains a listing of all the various Community Teams, links to their Wiki Home Pages and\r\n\r\nMost Teams\' Wiki Home Pages provide information about who they are, what they do, when their meetings are and how to contact them. Using these pages, teammates are able communicate and coordinate projects.\r\n\r\nGovernance and Membership\r\n\r\nLike most communities, we have our rules and governing body.\r\n\r\nAnyone can join and participate in most, if not all, of our Teams and Projects. But if you want an \"@ubuntu.com\" e-mail address, it has to be earned. Find out how in our Membership section.\r\n\r\nCommunity Links\r\n\r\nAs an active member of our community, you probably should check out what else is going on in the world of Ubuntu:\r\n\r\nThe Fridge posts all the latest News and Upcoming Events.\r\nPlanet Ubuntu is a collection of community blogs.\r\nAlso you can help at Ubuntu Brainstorm by submitting your ideas to make Ubuntu better OS for everyone.\r\n\r\nIf you are interested to get to know other Ubuntu users or see a list of Ubuntu teams outside the general Ubuntu world, check out our social network page.\r\n\r\nReleases',NULL,NULL,NULL,NULL,NULL,'2013-04-22 15:07:43','2013-04-22 11:07:43','2013-04-22 11:07:23','Yes','Get Involved\r\n\r\nIf you want to help contribute to Ubuntu then you\'ve come to the right place. Keep reading to learn how.\r\n\r\nYou have just taken your first step toward getting involved. Before you get started, we ask that you please observe the Ubuntu Code of Conduct, it\'s not very long and it will help you get started.\r\n\r\nNow that\'s done. To find out the best way to get started, you should check out our community page.\r\n\r\nTeams\r\n\r\nThe Teams page contains a listing of all the various Community Teams, links to their Wiki Home Pages and\r\n\r\nMost Teams\' Wiki Home Pages provide information about who they are, what they do, when their meetings are and how to contact them. Using these pages, teammates are able communicate and coordinate projects.\r\n\r\nGovernance and Membership\r\n\r\nLike most communities, we have our rules and governing body.\r\n\r\nAnyone can join and participate in most, if not all, of our Teams and Projects. But if you want an \"@ubuntu.com\" e-mail address, it has to be earned. Find out how in our Membership section.\r\n\r\nCommunity Links\r\n\r\nAs an active member of our community, you probably should check out what else is going on in the world of Ubuntu:\r\n\r\nThe Fridge posts all the latest News and Upcoming Events.\r\nPlanet Ubuntu is a collection of community blogs.\r\nAlso you can help at Ubuntu Brainstorm by submitting your ideas to make Ubuntu better OS for everyone.\r\n\r\nIf you are interested to get to know other Ubuntu users or see a list of Ubuntu teams outside the general Ubuntu world, check out our social network page.\r\n\r\nReleases'),(2862,'b',NULL,NULL,NULL,NULL,NULL,'2013-04-22 15:11:08','2013-04-22 11:11:08','2013-04-22 11:11:23','Yes','b'),(2863,'Weiss\r\n',NULL,NULL,NULL,NULL,NULL,'2013-04-22 15:28:44','2013-04-22 11:28:44','2013-04-22 11:28:23','Yes','Weiss\r\n'),(2864,'email on?',NULL,NULL,NULL,NULL,NULL,'2013-04-24 16:04:36','2013-04-24 12:04:36','2013-04-24 12:04:23','Yes','email on?'),(2865,'2013-04-24_Wed_14.22-PM test with filter. 03:48PM',NULL,NULL,NULL,NULL,NULL,'2013-04-24 18:22:42','2013-04-24 15:48:41','2013-04-24 14:22:23','Yes','2013-04-24_Wed_14.22-PM test with filter. 03:48PM'),(2866,'moved default filter to index.php',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:34:19','2013-04-24 15:34:19','2013-04-24 15:34:23',NULL,'moved default filter to index.php'),(2867,'moved default filter to index.php',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:35:00','2013-04-24 15:35:00','2013-04-24 15:34:23',NULL,'moved default filter to index.php'),(2868,'a',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:35:31','2013-04-24 15:35:31','2013-04-24 15:35:23','Yes','a'),(2869,'a',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:35:34','2013-04-24 15:35:34','2013-04-24 15:35:23','Yes','a'),(2870,'test index.php filter',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:37:08','2013-04-24 15:37:08','2013-04-24 15:37:23','No','test index.php filter'),(2871,'a',NULL,NULL,NULL,NULL,NULL,'2013-04-24 19:41:51','2013-04-24 15:41:51','2013-04-24 15:41:23','Yes','a'),(2872,'   2013-04-25_Thu_09.58-AM   ',NULL,NULL,NULL,NULL,NULL,'2013-04-25 13:59:01','2013-09-16 14:36:28','2013-09-16 13:44:23','','2013-04-25_Thu_09.58-AM'),(2873,'2013-04-25_Thu_10.29-AM default sort in sql in fields.ini',NULL,NULL,NULL,NULL,NULL,'2013-04-25 14:29:35','2013-04-25 10:29:35','2013-04-25 10:29:23','Yes','2013-04-25_Thu_10.29-AM default sort in sql in fields.ini'),(2874,'2013-04-25_Thu_10.36-AM test view add',NULL,NULL,NULL,NULL,NULL,'2013-04-25 14:36:50','2013-04-25 10:36:50','2013-04-25 10:36:23','Yes','2013-04-25_Thu_10.36-AM test view add'),(2875,'2013-04-25_Thu_10.41-AM test view add',NULL,NULL,NULL,NULL,NULL,'2013-04-25 14:41:22','2013-04-25 10:41:22','2013-04-25 10:41:23',NULL,'2013-04-25_Thu_10.41-AM test view add'),(2876,'2013-04-25_Thu_10.49-AM',NULL,NULL,NULL,NULL,NULL,'2013-04-25 14:49:23','2013-04-25 10:49:23','2013-04-25 10:49:23','Yes','2013-04-25_Thu_10.49-AM'),(2877,'    2013-04-25_Thu_10.53-AM \r\nAdam\r\nHere \r\n\r\nA b\r\n  ','Quite','New Jersey',NULL,NULL,NULL,'2013-04-25 14:53:35','2013-09-16 14:43:52','2013-09-16 14:43:23','Yes','2013-04-25_Thu_10.53-AM'),(2878,'     2013-04-25_Thu_10.54-AM     ',NULL,NULL,NULL,NULL,NULL,'2013-04-25 14:54:14','2013-09-12 14:28:34','2013-09-12 14:25:22','Yes','2013-04-25_Thu_10.54-AM'),(2879,'test email from filtered table',NULL,NULL,NULL,NULL,NULL,'2013-04-29 13:12:21','2013-04-29 09:12:21','2013-04-29 09:12:23','Yes','test email from filtered table'),(2880,'  test two email  b',NULL,'Nevada',NULL,NULL,NULL,'2013-04-29 18:31:54','2013-09-16 09:50:50',NULL,'','test two email'),(2881,' test bcc cc. 2013-04-30_Tue_11.18-AM ','dash b',NULL,NULL,NULL,NULL,'2013-04-29 18:36:27','2013-09-19 13:44:15','2013-04-29 14:36:23','Yes','test bcc cc. 2013-04-30_Tue_11.18-AM'),(2882,'2013-05-02_Thu_13.22-PM test offline',NULL,NULL,NULL,NULL,NULL,'2013-05-02 17:24:06','2013-05-02 13:24:06','2013-05-02 13:22:23','Yes','2013-05-02_Thu_13.22-PM test offline'),(2883,'moved xampp from c p2 websw to c p2',NULL,NULL,NULL,NULL,NULL,'2013-05-02 19:37:30','2013-05-02 15:37:30',NULL,'Yes','moved xampp from c p2 websw to c p2'),(2884,'    testing mysql copy with xcopy    ',NULL,'Vermont',NULL,NULL,NULL,'2013-05-03 13:27:11','2013-09-13 11:15:39',NULL,'Yes','testing mysql copy with xcopy'),(2885,' going  home ',NULL,'District of Columbia',NULL,NULL,NULL,'2013-05-06 20:36:19','2013-09-12 13:41:26',NULL,'No','going  home'),(2886,'test',NULL,NULL,NULL,NULL,NULL,'2013-05-22 17:44:36','2013-08-01 12:14:00','0000-05-13 00:00:00','Yes','test'),(2887,'a',NULL,NULL,NULL,NULL,NULL,'2013-06-21 13:20:17','2013-06-21 09:20:17',NULL,'Yes','a'),(2888,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-01 16:02:11','2013-08-01 12:12:37','0000-05-23 00:00:00','Yes',NULL),(2889,'test',NULL,NULL,NULL,NULL,NULL,'2013-08-07 16:01:49','2013-08-07 12:01:49',NULL,NULL,'test'),(2890,' test default active = yes ','artsy','Florida',NULL,NULL,NULL,'2013-08-07 16:08:48','2013-09-11 10:52:30','2013-09-11 10:52:23','Yes','test default active = yes'),(2891,' a,2013-08-07_Wed_12.51-PM2013-08-15_Thu_11.11-AM ',NULL,'Maine',NULL,NULL,NULL,'2013-08-07 16:51:17','2013-09-11 10:13:47',NULL,'Yes','2013-08-07_Wed_12.51-PM'),(2892,'5,  12:15PM',NULL,NULL,NULL,NULL,NULL,'2013-09-04 16:15:50','2013-09-04 15:40:11',NULL,'Yes',NULL),(2893,' dash\r\n2013-09-16_Mon_15.35-PM ',NULL,'Hawaii',NULL,NULL,NULL,'2013-09-16 19:35:17','2013-09-16 15:35:57','2013-09-16 15:35:23','Yes',NULL),(2894,'d','d','Mississippi',NULL,NULL,NULL,'2013-09-17 13:57:38','2013-09-17 09:57:38','2013-09-17 09:57:23','',NULL),(2895,NULL,NULL,NULL,NULL,NULL,NULL,'2013-09-17 14:42:10','2013-09-17 10:42:10','2013-09-17 10:42:23','',NULL),(2896,NULL,NULL,NULL,NULL,NULL,NULL,'2013-09-17 14:42:22','2013-09-17 10:42:22','2013-09-17 10:42:23','',NULL),(2897,NULL,NULL,NULL,NULL,NULL,NULL,'2013-09-17 14:46:13','2013-09-17 10:46:13','2013-09-17 10:44:23',NULL,NULL),(2898,NULL,NULL,NULL,NULL,NULL,NULL,'2013-09-17 14:58:11','2013-09-17 10:58:11','2013-09-17 10:58:23',NULL,NULL),(2899,'  Yellow',NULL,'New Jersey',NULL,NULL,NULL,'2013-09-17 15:06:45','2013-09-19 14:53:58','2013-09-17 11:06:23','',NULL),(2900,'a','b','Vermont',NULL,NULL,NULL,'2013-09-17 15:20:44','2013-09-17 11:20:44','2013-09-17 11:20:23','Yes',NULL),(2901,'    Wish 2 ','sell','Rhode Island',NULL,NULL,NULL,'2013-09-17 15:42:50','2013-09-19 14:54:43','2013-09-17 11:42:23','Yes',NULL),(2902,'2013-09-17_Tue_12.24-PM',NULL,'Wisconsin',NULL,NULL,NULL,'2013-09-17 16:24:48','2013-09-17 12:24:48','2013-09-17 12:24:23','Yes',NULL),(2903,NULL,NULL,NULL,NULL,NULL,NULL,'2013-09-17 18:50:59','2013-09-17 14:50:59','2013-09-17 14:50:23','Yes',NULL),(2904,'Green','Gramm',NULL,NULL,NULL,NULL,'2013-09-19 18:55:30','2013-09-19 14:55:30','2013-09-19 14:54:23','Yes',NULL),(2905,' Henry ',NULL,'West Virginia',NULL,NULL,NULL,'2013-09-19 18:57:18','2013-09-19 15:00:22','2013-09-19 14:59:23','Yes',NULL),(2906,'Wash','am','Tennessee',NULL,NULL,NULL,'2013-09-20 12:57:30','2013-09-20 08:57:30','2013-09-20 08:56:23','Yes',NULL),(2907,'Leak','X','District of Columbia',NULL,NULL,NULL,'2013-09-20 20:09:53','2013-09-20 16:09:53','2013-09-20 16:08:23','Yes',NULL),(2908,' a ','a','Minnesota',NULL,NULL,NULL,'2013-09-23 20:11:32','2013-09-23 16:12:14','2013-09-23 16:11:23','Yes',NULL),(2909,'04:12PM',NULL,NULL,NULL,NULL,NULL,'2013-09-23 20:12:31','2013-09-23 16:12:31','2013-09-23 16:12:23','Yes',NULL),(2910,'b','computer problem, xataface, gustin, ','Indiana',NULL,NULL,NULL,'2013-11-26 19:26:57','2013-11-26 14:26:57','2013-11-26 14:26:23','Yes',NULL),(2911,'Test','computer problem, work, word, ','Massachusetts',NULL,NULL,NULL,'2014-03-04 15:48:24','2014-03-04 10:48:24','2014-03-04 10:47:23','Yes',NULL),(2912,'d','computer problem, ','West Virginia',NULL,NULL,NULL,'2014-06-04 19:31:31','2014-06-04 15:31:31','2014-06-04 15:31:23','No',NULL),(2913,'a','a','a',NULL,NULL,NULL,'2014-06-04 19:32:57','2014-06-04 15:32:57','2014-06-04 15:32:23','No',NULL),(2914,'b','b','b',NULL,NULL,NULL,'2014-06-04 19:33:54','2014-06-04 15:33:54','2014-06-04 15:33:23','Yes',NULL),(2915,'a','a','a',NULL,NULL,NULL,'2014-06-04 19:35:38','2014-06-04 15:35:38','2014-06-04 15:35:23','Yes',NULL),(2916,'a','q','q',NULL,NULL,NULL,'2014-06-04 19:44:16','2014-06-04 15:44:16','2014-06-04 15:35:23','Yes',NULL),(2917,'a','w','w',NULL,NULL,NULL,'2014-06-04 19:46:25','2014-06-04 15:46:25','2014-06-04 15:35:23','Yes',NULL),(2918,'a','w','w',NULL,NULL,NULL,'2014-06-04 19:47:48','2014-06-04 15:47:48','2014-06-04 15:35:23','Yes',NULL),(2919,'2015-07-08_Wed_16.44-PM',NULL,NULL,1,3,8,'2015-07-08 20:44:56','2015-07-08 16:44:56',NULL,'Yes',NULL),(2920,NULL,NULL,NULL,2,1,2,'2015-07-08 20:53:44','2015-07-08 16:53:44',NULL,'Yes',NULL),(2921,' 2015-07-08_Wed_19.29-PM ',NULL,NULL,2,1,11,'2015-07-08 23:29:43','2016-07-29 16:18:15',NULL,'Yes',NULL),(2922,NULL,NULL,NULL,NULL,NULL,NULL,'2015-07-09 20:16:07','2015-07-09 16:16:07',NULL,'Yes','2015-07-09'),(2923,NULL,NULL,NULL,NULL,NULL,NULL,'2015-07-09 20:17:07','2015-07-09 16:17:07',NULL,'Yes','2015-07-09_Thu_16.17-PM'),(2924,NULL,NULL,NULL,2,1,1,'2015-07-09 20:35:30','2015-07-09 16:35:07',NULL,'Yes',NULL),(2925,NULL,NULL,NULL,NULL,NULL,NULL,'2015-07-09 20:36:44','2015-07-09 16:36:21',NULL,'Yes',NULL),(2926,NULL,NULL,NULL,1,3,7,'2015-07-09 20:37:09','2015-07-09 16:36:46',NULL,'Yes',NULL),(2927,NULL,NULL,NULL,NULL,NULL,NULL,'2015-07-09 20:37:50','2015-07-09 16:37:27',NULL,'Yes',NULL),(9999,'2015-11-19_Thu_13.08-PM\r\ntest','','Detroit',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL),(10000,NULL,NULL,NULL,2,1,2,'2016-03-24 17:46:39','2016-03-24 13:46:16',NULL,'Yes',NULL),(10001,NULL,'computer problem, ',NULL,NULL,NULL,NULL,'2016-08-24 20:40:13','2016-08-24 16:40:13',NULL,'Yes',NULL),(10002,'a','computer problem, ',NULL,NULL,NULL,NULL,'2016-08-24 20:40:28','2016-08-24 16:40:28',NULL,'Yes','a');
/*!40000 ALTER TABLE `nte_note` ENABLE KEYS */;
UNLOCK TABLES;


