-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: rezervacka
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(60) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `region` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_cities_region_idx` (`region`),
  KEY `fk_cities_district_idx` (`district`),
  CONSTRAINT `fk_cities_district` FOREIGN KEY (`district`) REFERENCES `city_district` (`id_district`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cities_region` FOREIGN KEY (`region`) REFERENCES `city_region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_district`
--

DROP TABLE IF EXISTS `city_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_district` (
  `id_district` int(11) NOT NULL,
  `district` varchar(60) NOT NULL,
  PRIMARY KEY (`id_district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_district`
--

LOCK TABLES `city_district` WRITE;
/*!40000 ALTER TABLE `city_district` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_region`
--

DROP TABLE IF EXISTS `city_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_region` (
  `id_region` int(11) NOT NULL,
  `region` varchar(60) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_region`
--

LOCK TABLES `city_region` WRITE;
/*!40000 ALTER TABLE `city_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_order_teams`
--

DROP TABLE IF EXISTS `comp_order_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_order_teams` (
  `id_competition` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `food` tinyint(1) NOT NULL DEFAULT '1',
  `comment` varchar(200) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_competition`,`id_team`),
  KEY `fk_comp_order_teams_team_idx` (`id_team`),
  KEY `fk_comp_order_teams_cb_idx` (`created_by`),
  CONSTRAINT `fk_comp_order_teams_cb` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_order_teams_comp` FOREIGN KEY (`id_competition`) REFERENCES `competitions` (`id_competition`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_order_teams_team` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_order_teams`
--

LOCK TABLES `comp_order_teams` WRITE;
/*!40000 ALTER TABLE `comp_order_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_order_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_times`
--

DROP TABLE IF EXISTS `comp_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_times` (
  `id_competition` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `attempt_no` int(11) NOT NULL,
  `attempt_type` smallint(1) NOT NULL,
  `time_1` time DEFAULT NULL,
  `time_2` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_competition`,`id_team`,`attempt_no`,`attempt_type`),
  KEY `fk_comp_times_team_idx` (`id_team`),
  KEY `fk_comp_times_cb_idx` (`created_by`),
  CONSTRAINT `fk_comp_times_cb` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_times_comp` FOREIGN KEY (`id_competition`) REFERENCES `competitions` (`id_competition`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_times_team` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_times`
--

LOCK TABLES `comp_times` WRITE;
/*!40000 ALTER TABLE `comp_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_managers`
--

DROP TABLE IF EXISTS `competition_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_managers` (
  `id_user` int(11) NOT NULL,
  `id_competition` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_user`,`id_competition`),
  KEY `fk_competition_managers_comp_idx` (`id_competition`),
  CONSTRAINT `fk_competition_managers_cb` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_competition_managers_comp` FOREIGN KEY (`id_competition`) REFERENCES `competitions` (`id_competition`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_competition_managers_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_managers`
--

LOCK TABLES `competition_managers` WRITE;
/*!40000 ALTER TABLE `competition_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `competition_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitions` (
  `id_competition` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `city` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `self_registration` tinyint(1) NOT NULL,
  `start_registration` datetime DEFAULT NULL,
  `end_registration` datetime DEFAULT NULL,
  `max_teams` int(11) NOT NULL,
  `food_select` tinyint(1) NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_competition`),
  KEY `fk_competitions_city_idx` (`city`),
  KEY `fk_competitions_cb_idx` (`created_by`),
  CONSTRAINT `fk_competitions_cb` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_competitions_city` FOREIGN KEY (`city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_managers`
--

DROP TABLE IF EXISTS `team_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_managers` (
  `id_user` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_user`,`id_team`),
  KEY `fk_team_managers_team_idx` (`id_team`),
  CONSTRAINT `fk_team_managers_cb` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_managers_team` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_managers_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_managers`
--

LOCK TABLES `team_managers` WRITE;
/*!40000 ALTER TABLE `team_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `city` int(11) NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `logo_path` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id_team`),
  KEY `fk_teams_cb_idx` (`created_by`),
  KEY `fk_teams_city_idx` (`city`),
  CONSTRAINT `fk_teams_cb` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_city` FOREIGN KEY (`city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `day_of_birth` date DEFAULT NULL,
  `id_city` int(11) NOT NULL,
  `id_team` int(11) DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_users_city_idx` (`id_city`),
  KEY `fk_users_team_idx` (`id_team`),
  CONSTRAINT `fk_users_city` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_team` FOREIGN KEY (`id_team`) REFERENCES `teams` (`id_team`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-24  0:07:40
