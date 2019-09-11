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

-- Dump completed on 2019-05-15 20:30:05
