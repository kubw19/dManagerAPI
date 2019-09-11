-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: dManagerNewDB
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

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
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contests` (
  `contestId` int(11) NOT NULL AUTO_INCREMENT,
  `stadiumId` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `finished` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`contestId`),
  KEY `fk_contest_stadium` (`stadiumId`),
  CONSTRAINT `fk_contest_stadium` FOREIGN KEY (`stadiumId`) REFERENCES `stadiums` (`stadiumID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
INSERT INTO `contests` VALUES (19,7,'jjj',0,'2019-03-30');
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `taken` int(11) DEFAULT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afganistan',0),(2,'Albania',0),(3,'Algieria',0),(4,'Andora',0),(5,'Angola',0),(6,'Anguilla',0),(7,'Antigua i Barbuda',0),(8,'Arabia Saudyjska',0),(9,'Argentyna',1),(10,'Armenia',0),(11,'Aruba',0),(12,'Australia',0),(13,'Austria',0),(14,'Azerbejdżan',0),(15,'Bahamy',0),(16,'Bahrajn',0),(17,'Bangladesz',0),(18,'Barbados',0),(19,'Belgia',1),(20,'Belize',0),(21,'Benin',1),(22,'Bermudy',0),(23,'Bhutan',0),(24,'Białoruś',0),(25,'Boliwia',0),(26,'Bonaire',0),(27,'Bośnia i Hercegowina',0),(28,'Botswana',0),(29,'Brazylia',0),(30,'Brunei',0),(31,'Brytyjskie Wyspy Dziewicze',0),(32,'Bułgaria',0),(33,'Burkina Faso',0),(34,'Burundi',0),(35,'Chile',0),(36,'Chiny',0),(37,'Chorwacja',0),(38,'Curaçao',0),(39,'Cypr',0),(40,'Czad',0),(41,'Czarnogóra',0),(42,'Czechy',0),(43,'Dania',0),(44,'Demokratyczna Republika Konga',0),(45,'Dominika',0),(46,'Dominikana',0),(47,'Dżibuti',0),(48,'Egipt',0),(49,'Ekwador',0),(50,'Erytrea',0),(51,'Estonia',0),(52,'Etiopia',0),(53,'Falklandy',0),(54,'Fidżi',0),(55,'Filipiny',0),(56,'Finlandia',0),(57,'Francja',0),(58,'Gabon',0),(59,'Gambia',0),(60,'Ghana',0),(61,'Gibraltar',0),(62,'Grecja',0),(63,'Grenada',0),(64,'Grenlandia',0),(65,'Gruzja',0),(66,'Guam',0),(67,'Guernsey',0),(68,'Gujana',0),(69,'Gujana Francuska',0),(70,'Gwadelupa',0),(71,'Gwatemala',0),(72,'Gwinea',0),(73,'Gwinea Bissau',0),(74,'Gwinea Równikowa',0),(75,'Haiti',0),(76,'Hiszpania',1),(77,'Holandia',0),(78,'Honduras',0),(79,'Hongkong',0),(80,'Indie',0),(81,'Indonezja',0),(82,'Irak',0),(83,'Iran',0),(84,'Irlandia',0),(85,'Islandia',0),(86,'Izrael',0),(87,'Jamajka',0),(88,'Japonia',0),(89,'Jemen',0),(90,'Jersey',0),(91,'Jordania',0),(92,'Kajmany',0),(93,'Kambodża',0),(94,'Kamerun',0),(95,'Kanada',0),(96,'Katar',0),(97,'Kazachstan',0),(98,'Kenia',0),(99,'Kirgistan',0),(100,'Kiribati',0),(101,'Kolumbia',0),(102,'Komory',0),(103,'Kongo',0),(104,'Korea Południowa',0),(105,'Korea Północna',0),(106,'Kostaryka',0),(107,'Kuba',0),(108,'Kuwejt',0),(109,'Laos',0),(110,'Lesotho',0),(111,'Liban',0),(112,'Liberia',0),(113,'Libia',0),(114,'Liechtenstein',0),(115,'Litwa',0),(116,'Luksemburg',0),(117,'Łotwa',0),(118,'Macedonia',0),(119,'Madagaskar',0),(120,'Majotta',0),(121,'Makau',0),(122,'Malawi',0),(123,'Malediwy',0),(124,'Malezja',0),(125,'Mali',0),(126,'Malta',0),(127,'Mariany Północne',0),(128,'Maroko',0),(129,'Martynika',0),(130,'Mauretania',0),(131,'Mauritius',0),(132,'Meksyk',0),(133,'Mikronezja',0),(134,'Mjanma',0),(135,'Mołdawia',0),(136,'Monako',0),(137,'Mongolia',0),(138,'Montserat',0),(139,'Mozambik',0),(140,'Namibia',0),(141,'Nauru',0),(142,'Nepal',0),(143,'Niemcy',0),(144,'Niger',0),(145,'Nigeria',0),(146,'Nikaragua',0),(147,'Niue',0),(148,'Norfolk',0),(149,'Norwegia',0),(150,'Nowa Kaledonia',0),(151,'Nowa Zelandia',0),(152,'Oman',0),(153,'Pakistan',0),(154,'Palau',0),(155,'Panama',0),(156,'Papua-Nowa Gwinea',0),(157,'Paragwaj',0),(158,'Peru',0),(159,'Pitcairn',0),(160,'Polinezja Francuska',0),(161,'Polska',1),(162,'Portoryko',0),(163,'Portugalia',0),(164,'Republika Południowej Afryki',0),(165,'Republika Środkowoafrykańska',0),(166,'Republika Zielonego Przylądka',0),(167,'Reunion',0),(168,'Rosja',0),(169,'Rumunia',0),(170,'Rwanda',0),(171,'Saba',0),(172,'Sahara Zachodnia',0),(173,'Saint Kitts i Nevis',0),(174,'Saint Lucia',0),(175,'Saint Vincent i Grenadyny',0),(176,'Saint-Barthélemy',0),(177,'Saint-Martin',0),(178,'Saint-Pierre i Miquelon',0),(179,'Salwador',0),(180,'Samoa',0),(181,'Samoa Amerykańskie',0),(182,'San Marino',0),(183,'Senegal',0),(184,'Serbia',0),(185,'Seszele',0),(186,'Sierra Leone',0),(187,'Singapur',0),(188,'Sint Eustatius',0),(189,'Sint Maarten',0),(190,'Słowacja',0),(191,'Słowenia',0),(192,'Somalia',0),(193,'Sri Lanka',0),(194,'Stany Zjednoczone',0),(195,'Strefa Gazy',0),(196,'Suazi',0),(197,'Sudan',0),(198,'Surinam',0),(199,'Svalbard',0),(200,'Syria',0),(201,'Szwajcaria',0),(202,'Szwecja',0),(203,'Święta Helena',0),(204,'Tadżykistan',0),(205,'Tajlandia',0),(206,'Tajwan',0),(207,'Tanzania',0),(208,'Timor Wschodni',0),(209,'Togo',0),(210,'Tokelau',0),(211,'Tonga',0),(212,'Trynidad i Tobago',0),(213,'Tunezja',0),(214,'Turcja',0),(215,'Turkmenistan',0),(216,'Turks i Caicos',0),(217,'Tuvalu',0),(218,'Uganda',0),(219,'Ukraina',0),(220,'Urugwaj',0),(221,'Uzbekistan',0),(222,'Vanuatu',0),(223,'Wallis i Futuna',0),(224,'Watykan',0),(225,'Wenezuela',0),(226,'Węgry',0),(227,'Wielka Brytania',0),(228,'Wietnam',0),(229,'Włochy',0),(230,'Wybrzeże Kości Słoniowej',0),(231,'Wyspa Bożego Narodzenia',0),(232,'Wyspa Man',0),(233,'Wyspy Cooka',0),(234,'Wyspy Dziewicze Stanów Zjednoczonych',0),(235,'Wyspy Kokosowe',0),(236,'Wyspy Marshalla',0),(237,'Wyspy Owcze',0),(238,'Wyspy Salomona',0),(239,'Wyspy Świętego Tomasza i Książęca',0),(240,'Zachodni Brzeg',0),(241,'Zambia',0),(242,'Zimbabwe',0),(243,'Zjednoczone Emiraty Arabskie',0),(244,'Anglia',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `countryGroup`
--

DROP TABLE IF EXISTS `countryGroup`;
/*!50001 DROP VIEW IF EXISTS `countryGroup`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `countryGroup` AS SELECT 
 1 AS `country`,
 1 AS `cId`,
 1 AS `group`,
 1 AS `groupId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!50001 DROP VIEW IF EXISTS `goals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goals` AS SELECT 
 1 AS `id`,
 1 AS `matchId`,
 1 AS `playerId`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `countryId`,
 1 AS `countryName`,
 1 AS `groupId`,
 1 AS `groupName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `groupData`
--

DROP TABLE IF EXISTS `groupData`;
/*!50001 DROP VIEW IF EXISTS `groupData`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `groupData` AS SELECT 
 1 AS `country`,
 1 AS `cid`,
 1 AS `group`,
 1 AS `groupId`,
 1 AS `M`,
 1 AS `W`,
 1 AS `P`,
 1 AS `R`,
 1 AS `BP`,
 1 AS `BM`,
 1 AS `Bilans`,
 1 AS `Points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `groupdataBase`
--

DROP TABLE IF EXISTS `groupdataBase`;
/*!50001 DROP VIEW IF EXISTS `groupdataBase`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `groupdataBase` AS SELECT 
 1 AS `country`,
 1 AS `cid`,
 1 AS `group`,
 1 AS `groupId`,
 1 AS `M`,
 1 AS `W`,
 1 AS `P`,
 1 AS `R`,
 1 AS `BP`,
 1 AS `BM`,
 1 AS `Bilans`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `phaseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  KEY `fk_group_phase` (`phaseId`),
  CONSTRAINT `fk_group_phase` FOREIGN KEY (`phaseId`) REFERENCES `phases` (`phaseId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (4,'null',6);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humanPlayers`
--

DROP TABLE IF EXISTS `humanPlayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humanPlayers` (
  `humanPlayerId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`humanPlayerId`),
  KEY `fk_humanPlayer_country` (`countryId`),
  CONSTRAINT `fk_humanPlayer_country` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanPlayers`
--

LOCK TABLES `humanPlayers` WRITE;
/*!40000 ALTER TABLE `humanPlayers` DISABLE KEYS */;
INSERT INTO `humanPlayers` VALUES (1,'Jakub','Włodarczyk',9),(2,'Mikołaj','Wysocki',19),(3,'Jan','Kowalski',21),(4,'Michał','Wrzosek',76),(5,'Stanisław','Zyga',161);
/*!40000 ALTER TABLE `humanPlayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!50001 DROP VIEW IF EXISTS `injuries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `injuries` AS SELECT 
 1 AS `id`,
 1 AS `matchId`,
 1 AS `playerId`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `countryId`,
 1 AS `countryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `matchId` int(11) NOT NULL AUTO_INCREMENT,
  `t1` int(11) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `p1` int(11) DEFAULT NULL,
  `p2` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `played` int(11) DEFAULT NULL,
  PRIMARY KEY (`matchId`),
  KEY `fk_t1_countries` (`t1`),
  KEY `fk_t2_countries` (`t2`),
  KEY `fk_p1_countries` (`p1`),
  KEY `fk_p2_countries` (`p2`),
  KEY `fk_matches_group` (`groupId`),
  CONSTRAINT `fk_matches_group` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_p1_countries` FOREIGN KEY (`p1`) REFERENCES `humanPlayers` (`humanPlayerId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_p2_countries` FOREIGN KEY (`p2`) REFERENCES `humanPlayers` (`humanPlayerId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_t1_countries` FOREIGN KEY (`t1`) REFERENCES `countries` (`countryId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_t2_countries` FOREIGN KEY (`t2`) REFERENCES `countries` (`countryId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,19,9,2,1,4,0);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `matchesTable`
--

DROP TABLE IF EXISTS `matchesTable`;
/*!50001 DROP VIEW IF EXISTS `matchesTable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `matchesTable` AS SELECT 
 1 AS `matchId`,
 1 AS `p1Id`,
 1 AS `p1Name`,
 1 AS `p1Surname`,
 1 AS `p2Id`,
 1 AS `p2Name`,
 1 AS `p2Surname`,
 1 AS `c1Id`,
 1 AS `c1`,
 1 AS `c2Id`,
 1 AS `c2`,
 1 AS `groupId`,
 1 AS `group`,
 1 AS `phaseId`,
 1 AS `phase`,
 1 AS `contestId`,
 1 AS `contest`,
 1 AS `played`,
 1 AS `goalsD1`,
 1 AS `goalsD2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `phases`
--

DROP TABLE IF EXISTS `phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phases` (
  `phaseId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `contestId` int(11) DEFAULT NULL,
  `groupPhase` int(11) DEFAULT NULL,
  PRIMARY KEY (`phaseId`),
  KEY `fk_phase_contest` (`contestId`),
  CONSTRAINT `fk_phase_contest` FOREIGN KEY (`contestId`) REFERENCES `contests` (`contestId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phases`
--

LOCK TABLES `phases` WRITE;
/*!40000 ALTER TABLE `phases` DISABLE KEYS */;
INSERT INTO `phases` VALUES (6,'kk',19,0);
/*!40000 ALTER TABLE `phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `playerId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerId`),
  KEY `fk_players_countries` (`countryId`),
  CONSTRAINT `fk_players_countries` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Joe','Hart',244,0),(2,'Tom','Heaton',244,0),(3,'Jack','Butland',244,0),(4,'Garry','Cahill',244,1),(5,'John','Stones',244,1),(6,'Roby','Keane',244,1),(7,'Eric','Dier',244,1),(8,'Vinnie','Jones',244,1),(9,'Kyle','Walker',244,2),(10,'Nathaniel','Clyne',244,2),(11,'Danny','Rose',244,3),(12,'Ryan','Bertrand',244,3),(13,'Jordan','Henderson',244,4),(14,'Adam','Lallana',244,5),(15,'Jake','Livermore',244,5),(16,'Alex','Oxlade-Chamberlain',244,6),(17,'Jesse','Lingard',244,6),(18,'Marcus','Rashford',244,7),(19,'Dele','Alli',244,8),(20,'Harry','Kane',244,9),(21,'Danny','Welbeck',244,9),(22,'Jamie','Vardy',244,9),(23,'Rahem','Sterling',244,10),(24,'Sergio','Romero',9,0),(25,'Augustin','Marchesin',9,0),(26,'Jonathan','Guzman',9,0),(27,'German','Pazzella',9,1),(28,'Javier','Mascherano',9,1),(29,'Nicolas','Otamendi',9,1),(30,'Federico','Fazio',9,1),(31,'Matias','Kranevitter',9,4),(32,'Diego','Perez',9,5),(33,'Leonardo','Peredes',9,5),(34,'Emiliano','Rigoni',9,6),(35,'Eduardo','Salvio',9,6),(36,'Ever','Banega',9,8),(37,'Giovani','Lo Celso',9,8),(38,'Paulo','Dybala',9,8),(39,'Sergio','Aguero',9,9),(40,'Mario','Gomez',9,9),(41,'Dario','Benedetto',9,9),(42,'Mauro','Icardi',9,9),(43,'Diego','Perotti',9,10),(44,'Lionel','Messi',9,11),(45,'Angel','Di Marria',9,11),(46,'Francisco','Pavon',9,11),(47,'Thibaut','Courtois',19,0),(48,'Simon','Mignolet',19,0),(49,'Koen','Casteels',19,0),(50,'Vincent','Kompany',19,1),(51,'Jan','Vertonghen',19,1),(52,'Toby','Alderweireld',19,1),(53,'Thomas','Vermaelen',19,1),(54,'Thomas','Meunier',19,3),(55,'Leander','Dendoncker',19,4),(56,'Ousmane','Dembele',19,5),(57,'Axel','Witsel',19,5),(58,'Youri','Tielemans',19,5),(59,'Marouane','Fellaini',19,5),(60,'Steven','Defour',19,5),(61,'Yannick','Carrasco',19,7),(62,'Nacer','Chadli',19,7),(63,'Kevin','de Bruyne',19,8),(64,'Romelu','Lukaku',19,9),(65,'Christian','Benteke',19,9),(66,'Michy','Batshuayi',19,9),(67,'Dries','Mertens',19,9),(68,'Thorgan','Hazard',19,9),(69,'Eden','Hazard',19,10),(70,'Becker','Alisson',29,0),(71,'Moraes','Ederson',29,0),(72,'Norberto','Neto',29,0),(73,'Joao','Miranda',29,1),(74,'Marcos','Marquinhos',29,1),(75,'David','Silva',29,1),(76,'Carlos','Gil',29,1),(77,'Dani','Alves',29,2),(78,'Filipe','Luis',29,3),(79,'Vieira','Mercelo',29,3),(80,'Carlos','Casemiro',29,4),(81,'Fernando','Fernandinho',29,4),(82,'Jose','Paulinho',29,5),(83,'Renato','Augusto',29,5),(84,'Barcellos','Taison',29,7),(85,'Diego','Costa',29,7),(86,'Victor','Giuliano',29,8),(87,'Emboaba','Oscar',29,8),(88,'Gabriel','Jesus',29,9),(89,'Roberto','Firmino',29,9),(90,'','Neymar',29,10),(91,'Philippe','Coutinho',29,10),(92,'','Wilian',29,11),(93,'Hugo','Lloris',57,0),(94,'Steve','Mandanda',57,0),(95,'Benoit','Costil',57,0),(96,'Laurent','Koscielny',57,1),(97,'Samuel','Umtiti',57,1),(98,'Raphael','Varane',57,1),(99,'Presnel','Kimpembe',57,1),(100,'Djibril','Sidibe',57,2),(101,'Christophe','Jallet',57,2),(102,'Layvin','Kurzawa',57,3),(103,'Lucas','Digne',57,3),(104,'N\'Golo','Kanta',57,4),(105,'Blaise','Matuidi',57,4),(106,'Paul','Pogba',57,5),(107,'Corentin','Tolisso',57,5),(108,'Adrien','Rabiot',57,5),(109,'Kingsley','Coman',57,6),(110,'Thomas','Lemar',57,7),(111,'Antoine','Griezmann',57,9),(112,'Olivier','Giroud',57,9),(113,'Kylian','Mbappe',57,8),(114,'Alexandre','Lacazette',57,9),(115,'Dimitri','Payet',57,10),(116,'David','de Gea',76,0),(117,'Pepe','Reina',76,0),(118,'Kepa','Arrizabalage',76,0),(119,'Gerard','Pique',76,1),(120,'Sergio','Ramos',76,1),(121,'Roberto','Fernandez',76,1),(122,'Daniel','Carvajal',76,2),(123,'Jordi','Alba',76,3),(124,'Sergio','Busquets',76,4),(125,'Jorge','\"Koke\" Merodio',76,5),(126,'Andres','Iniesta',76,5),(127,'Francisco','\"Isco\" Suarez',76,5),(128,'Alcantara','Thiago',76,5),(129,'Asier','Illarramendi',76,5),(130,'Victor','\"Vitolo\" Perez',76,7),(131,'David','Silva',76,8),(132,'Marco','Asensio',76,8),(133,'Alvaro','Morata',76,9),(134,'Moreno','Rodrigo',76,9),(135,'Luis','Alberto',76,9),(136,'Iago','Aspas',76,12),(137,'Jesus','\"Suso\" Saez de la Torre',76,12),(138,'Jose','Callejon',76,12),(139,'Jasper','Cillessen',77,0),(140,'Jeroen','Zoet',77,0),(141,'Maarten','Stekelenburg',77,0),(142,'Nathan','Ake',77,1),(143,'Virgil','van Dijk',77,1),(144,'Stefan','de Vrij',77,1),(145,'Matthijs','de Ligt',77,1),(146,'Bruno','Martins Indi',77,1),(147,'Kenny','Tete',77,2),(148,'Joel','Veltman',77,2),(149,'Daley','Blind',77,3),(150,'Davy','Propper',77,5),(151,'Kevin','Strootman',77,5),(152,'Georginio','Wijnaldum',77,5),(153,'Tonny','Vilhena',77,5),(154,'Davy','Klaassen',77,5),(155,'Marco','van Ginkel',77,5),(156,'Quincy','Promes',77,6),(157,'Rayan','Babel',77,7),(158,'Bas','Dost',77,9),(159,'Vincent','Janssen',77,9),(160,'Robin','van Persie',77,9),(161,'Memphis','Depay',77,11),(162,'Manuel','Neuer',143,0),(163,'Marc Andre','ter Stegen',143,0),(164,'Bernd','Leno',143,0),(165,'Jerome','Boateng',143,1),(166,'Mats','Hummels',143,1),(167,'Niklas','Sule',143,1),(168,'Shkodran','Mustafi',143,1),(169,'Benedikt','Howedes',143,1),(170,'Jonathan','Tah',143,1),(171,'Joshua','Kimmich',143,2),(172,'Julian','Weigl',143,4),(173,'Jonas','Hector',143,4),(174,'Sami','Khadira',143,5),(175,'Toni','Kroos',143,5),(176,'Emre','Can',143,5),(177,'Karim','Bellarabi',143,6),(178,'Andre','Schurrle',143,7),(179,'Julian','Brandt',143,7),(180,'Mesut','Ozil',143,8),(181,'Max','Meyer',143,8),(182,'Mario','Gomez',143,9),(183,'Thomas','Muller',143,9),(184,'Julian','Draxler',143,10),(185,'Wojciech','Szczęsny',161,0),(186,'Łukasz','Fabiański',161,0),(187,'Łukasz','Skorupski',161,0),(188,'Kamil','Glik',161,1),(189,'Michał','Pazdan',161,1),(190,'Thiago','Cionek',161,1),(191,'Łukasz','Piszczek',161,2),(192,'Bartosz','Bereszyński',161,2),(193,'Artur','Jędrzejczyk',161,2),(194,'Tomasz','Kędziora',161,2),(195,'Maciej','Rybus',161,3),(196,'Grzegorz','Krychowiak',161,4),(197,'Krzysztof','Mączyński',161,4),(198,'Jacek','Góralski',161,4),(199,'Piotr','Zieliński',161,5),(200,'Rafał','Wolski',161,5),(201,'Jakub','Błaszczykowski',161,6),(202,'Rafał','Wolski',161,6),(203,'Damian','Kądzior',161,6),(204,'Kamil','Grosicki',161,7),(205,'Robert','Lewandowski',161,9),(206,'Łukasz','Teodorczyk',161,9),(207,'Paweł','Wszołek',161,11);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reds`
--

DROP TABLE IF EXISTS `reds`;
/*!50001 DROP VIEW IF EXISTS `reds`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reds` AS SELECT 
 1 AS `id`,
 1 AS `matchId`,
 1 AS `playerId`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `countryId`,
 1 AS `countryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `shooters`
--

DROP TABLE IF EXISTS `shooters`;
/*!50001 DROP VIEW IF EXISTS `shooters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `shooters` AS SELECT 
 1 AS `playerId`,
 1 AS `contestId`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `goals`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadiums` (
  `stadiumID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adress` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `icon` int(11) NOT NULL,
  PRIMARY KEY (`stadiumID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (7,'Marsa','Marsa 124','1936-12-05',0);
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `statisticId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(3) COLLATE utf8_polish_ci DEFAULT NULL,
  `matchId` int(11) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`statisticId`),
  KEY `fk_statistics_player` (`playerId`),
  KEY `fk_statistic_match` (`matchId`),
  CONSTRAINT `fk_statistic_match` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_statistics_player` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `yellows`
--

DROP TABLE IF EXISTS `yellows`;
/*!50001 DROP VIEW IF EXISTS `yellows`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `yellows` AS SELECT 
 1 AS `id`,
 1 AS `matchId`,
 1 AS `playerId`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `countryId`,
 1 AS `countryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `countryGroup`
--

/*!50001 DROP VIEW IF EXISTS `countryGroup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `countryGroup` AS select `mt`.`c1` AS `country`,`mt`.`c1Id` AS `cId`,`mt`.`group` AS `group`,`mt`.`groupId` AS `groupId` from `matchesTable` `mt` union select `mt`.`c2` AS `country`,`mt`.`c2Id` AS `cId`,`mt`.`group` AS `group`,`mt`.`groupId` AS `groupId` from `matchesTable` `mt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goals`
--

/*!50001 DROP VIEW IF EXISTS `goals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goals` AS select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName`,`gr`.`groupId` AS `groupId`,`gr`.`name` AS `groupName` from ((((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) join `groups` `gr` on((`gr`.`groupId` = `m`.`groupId`))) where (`s`.`type` = 'GOL') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `groupData`
--

/*!50001 DROP VIEW IF EXISTS `groupData`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `groupData` AS select `gdb`.`country` AS `country`,`gdb`.`cid` AS `cid`,`gdb`.`group` AS `group`,`gdb`.`groupId` AS `groupId`,`gdb`.`M` AS `M`,`gdb`.`W` AS `W`,`gdb`.`P` AS `P`,`gdb`.`R` AS `R`,`gdb`.`BP` AS `BP`,`gdb`.`BM` AS `BM`,`gdb`.`Bilans` AS `Bilans`,((`gdb`.`W` * 3) + `gdb`.`R`) AS `Points` from `groupdataBase` `gdb` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `groupdataBase`
--

/*!50001 DROP VIEW IF EXISTS `groupdataBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `groupdataBase` AS select `c`.`country` AS `country`,`c`.`cId` AS `cid`,`c`.`group` AS `group`,`c`.`groupId` AS `groupId`,(select count(0) from `matches` `m` where ((`m`.`groupId` = `c`.`groupId`) and ((`m`.`t1` = `c`.`cId`) or (`m`.`t2` = `c`.`cId`)))) AS `M`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1Id` = `c`.`cId`) and (`matchesTable`.`goalsD1` > `matchesTable`.`goalsD2`)) or ((`matchesTable`.`c2Id` = `c`.`cId`) and (`matchesTable`.`goalsD2` > `matchesTable`.`goalsD1`))) and (`matchesTable`.`groupId` = `c`.`groupId`))) AS `W`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1Id` = `c`.`cId`) and (`matchesTable`.`goalsD1` < `matchesTable`.`goalsD2`)) or ((`matchesTable`.`c2Id` = `c`.`cId`) and (`matchesTable`.`goalsD2` < `matchesTable`.`goalsD1`))) and (`matchesTable`.`groupId` = `c`.`groupId`))) AS `P`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1Id` = `c`.`cId`) and (`matchesTable`.`goalsD1` = `matchesTable`.`goalsD2`)) or ((`matchesTable`.`c2Id` = `c`.`cId`) and (`matchesTable`.`goalsD2` = `matchesTable`.`goalsD1`))) and (`matchesTable`.`groupId` = `c`.`groupId`))) AS `R`,(select count(0) from `goals` where ((`goals`.`countryId` = `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) AS `BP`,(select count(0) from (`goals` join `matches` `m2` on((`m2`.`matchId` = `goals`.`matchId`))) where (((`m2`.`t1` = `c`.`cId`) or (`m2`.`t2` = `c`.`cId`)) and (`goals`.`countryId` <> `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) AS `BM`,((select count(0) from `goals` where ((`goals`.`countryId` = `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) - (select count(0) from (`goals` join `matches` `m2` on((`m2`.`matchId` = `goals`.`matchId`))) where (((`m2`.`t1` = `c`.`cId`) or (`m2`.`t2` = `c`.`cId`)) and (`goals`.`countryId` <> `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`)))) AS `Bilans` from `countryGroup` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `injuries`
--

/*!50001 DROP VIEW IF EXISTS `injuries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `injuries` AS select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'KON') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `matchesTable`
--

/*!50001 DROP VIEW IF EXISTS `matchesTable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `matchesTable` AS select `m`.`matchId` AS `matchId`,`p1`.`humanPlayerId` AS `p1Id`,`p1`.`name` AS `p1Name`,`p1`.`surname` AS `p1Surname`,`p2`.`humanPlayerId` AS `p2Id`,`p2`.`name` AS `p2Name`,`p2`.`surname` AS `p2Surname`,`c1`.`countryId` AS `c1Id`,`c1`.`name` AS `c1`,`c2`.`countryId` AS `c2Id`,`c2`.`name` AS `c2`,`g`.`groupId` AS `groupId`,`g`.`name` AS `group`,`ph`.`phaseId` AS `phaseId`,`ph`.`name` AS `phase`,`co`.`contestId` AS `contestId`,`co`.`name` AS `contest`,`m`.`played` AS `played`,(select count(0) from `goals` where ((`goals`.`countryId` = `c1`.`countryId`) and (`goals`.`matchId` = `m`.`matchId`))) AS `goalsD1`,(select count(0) from `goals` where ((`goals`.`countryId` = `c2`.`countryId`) and (`goals`.`matchId` = `m`.`matchId`))) AS `goalsD2` from (((((((`matches` `m` join `humanPlayers` `p1` on((`m`.`p1` = `p1`.`humanPlayerId`))) join `humanPlayers` `p2` on((`m`.`p2` = `p2`.`humanPlayerId`))) join `countries` `c1` on((`m`.`t1` = `c1`.`countryId`))) join `countries` `c2` on((`m`.`t2` = `c2`.`countryId`))) join `groups` `g` on((`m`.`groupId` = `g`.`groupId`))) join `phases` `ph` on((`g`.`phaseId` = `ph`.`phaseId`))) join `contests` `co` on((`ph`.`contestId` = `co`.`contestId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reds`
--

/*!50001 DROP VIEW IF EXISTS `reds`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reds` AS select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'CZE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shooters`
--

/*!50001 DROP VIEW IF EXISTS `shooters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shooters` AS select `pil`.`playerId` AS `playerId`,`con`.`contestId` AS `contestId`,`pil`.`name` AS `name`,`pil`.`surname` AS `surname`,count(0) AS `goals` from ((((((`statistics` `s` join `players` `pil` on((`s`.`playerId` = `pil`.`playerId`))) join `countries` `cou` on((`pil`.`countryId` = `cou`.`countryId`))) join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `groups` `gr` on((`m`.`groupId` = `gr`.`groupId`))) join `phases` `ph` on((`ph`.`phaseId` = `gr`.`phaseId`))) join `contests` `con` on((`con`.`contestId` = `ph`.`contestId`))) where (`s`.`type` = 'GOL') group by `pil`.`playerId`,`con`.`contestId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `yellows`
--

/*!50001 DROP VIEW IF EXISTS `yellows`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `yellows` AS select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'ZOL') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-15 20:25:27
