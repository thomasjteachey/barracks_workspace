-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 192.168.1.226    Database: classicmangos
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_teleport`
--

DROP TABLE IF EXISTS `areatrigger_teleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `required_level` tinyint unsigned NOT NULL DEFAULT '0',
  `required_item` mediumint unsigned NOT NULL DEFAULT '0',
  `required_item2` mediumint unsigned NOT NULL DEFAULT '0',
  `required_quest_done` int unsigned NOT NULL DEFAULT '0',
  `target_map` smallint unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  `status_failed_text` text,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `houseid` int unsigned NOT NULL DEFAULT '0',
  `itemguid` int unsigned NOT NULL DEFAULT '0',
  `item_template` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `item_count` int unsigned NOT NULL DEFAULT '0',
  `item_randompropertyid` int NOT NULL DEFAULT '0',
  `itemowner` int unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int NOT NULL DEFAULT '0',
  `time` bigint unsigned NOT NULL DEFAULT '0',
  `buyguid` int unsigned NOT NULL DEFAULT '0',
  `lastbid` int NOT NULL DEFAULT '0',
  `startbid` int NOT NULL DEFAULT '0',
  `deposit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battleground_events`
--

DROP TABLE IF EXISTS `battleground_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battleground_events` (
  `map` smallint NOT NULL,
  `event1` tinyint unsigned NOT NULL,
  `event2` tinyint unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`map`,`event1`,`event2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battleground_template`
--

DROP TABLE IF EXISTS `battleground_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battleground_template` (
  `id` mediumint unsigned NOT NULL,
  `MinPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint unsigned NOT NULL,
  `HordeStartLoc` mediumint unsigned NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `PlayerSkinReflootId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'reference_loot_template entry',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast_text`
--

DROP TABLE IF EXISTS `broadcast_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_text` (
  `Id` int NOT NULL COMMENT 'Identifier',
  `Text` text COMMENT 'Male text',
  `Text1` text COMMENT 'Female text',
  `ChatTypeID` int NOT NULL DEFAULT '0',
  `LanguageID` int NOT NULL DEFAULT '0' COMMENT 'Language of text',
  `ConditionID` int NOT NULL DEFAULT '0' COMMENT 'Unk',
  `EmotesID` int NOT NULL DEFAULT '0' COMMENT 'Unk',
  `Flags` int NOT NULL DEFAULT '0' COMMENT 'Unk',
  `SoundEntriesID1` int NOT NULL DEFAULT '0' COMMENT 'Sound on broadcast',
  `SoundEntriesID2` int NOT NULL DEFAULT '0' COMMENT 'Sound on broadcast',
  `EmoteID1` int NOT NULL DEFAULT '0' COMMENT 'Emote on gossip',
  `EmoteID2` int NOT NULL DEFAULT '0' COMMENT 'Emote on gossip',
  `EmoteID3` int NOT NULL DEFAULT '0' COMMENT 'Emote on gossip',
  `EmoteDelay1` int NOT NULL DEFAULT '0' COMMENT 'Emote delay on gossip',
  `EmoteDelay2` int NOT NULL DEFAULT '0' COMMENT 'Emote delay on gossip',
  `EmoteDelay3` int NOT NULL DEFAULT '0' COMMENT 'Emote delay on gossip',
  `VerifiedBuild` int NOT NULL COMMENT 'Build of bruteforce',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Broadcast Text System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast_text_locale`
--

DROP TABLE IF EXISTS `broadcast_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_text_locale` (
  `Id` int NOT NULL COMMENT 'Identifier',
  `Locale` varchar(10) NOT NULL COMMENT 'Locale',
  `Text_lang` text COMMENT 'Male text',
  `Text1_lang` text COMMENT 'Female text',
  `VerifiedBuild` int NOT NULL COMMENT 'Build of bruteforce',
  PRIMARY KEY (`Id`,`Locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Broadcast Text System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugreport` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Debug System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combat_condition`
--

DROP TABLE IF EXISTS `combat_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combat_condition` (
  `Id` int NOT NULL,
  `WorldStateExpressionID` int NOT NULL DEFAULT '0',
  `SelfConditionID` int NOT NULL DEFAULT '0',
  `TargetConditionID` int NOT NULL DEFAULT '0',
  `FriendConditionLogic` int NOT NULL DEFAULT '0',
  `EnemyConditionLogic` int NOT NULL DEFAULT '0',
  `FriendConditionID_0` int NOT NULL DEFAULT '0',
  `FriendConditionID_1` int NOT NULL DEFAULT '0',
  `FriendConditionOp_0` int NOT NULL DEFAULT '0',
  `FriendConditionOp_1` int NOT NULL DEFAULT '0',
  `FriendConditionCount_0` int NOT NULL DEFAULT '0',
  `FriendConditionCount_1` int NOT NULL DEFAULT '0',
  `EnemyConditionID_0` int NOT NULL DEFAULT '0',
  `EnemyConditionID_1` int NOT NULL DEFAULT '0',
  `EnemyConditionOp_0` int NOT NULL DEFAULT '0',
  `EnemyConditionOp_1` int NOT NULL DEFAULT '0',
  `EnemyConditionCount_0` int NOT NULL DEFAULT '0',
  `EnemyConditionCount_1` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Chat System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conditions` (
  `condition_entry` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT 'Type of the condition',
  `value1` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'data field one for the condition',
  `value2` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'data field two for the condition',
  `value3` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'data field three for the condition',
  `value4` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'data field four for the condition',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(500) DEFAULT '',
  PRIMARY KEY (`condition_entry`),
  UNIQUE KEY `unique_conditions` (`type`,`value1`,`value2`,`value3`,`value4`,`flags`)
) ENGINE=MyISAM AUTO_INCREMENT=5310011 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Condition System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `position_x` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `position_y` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `position_z` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `orientation` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `spawntimesecsmin` int unsigned NOT NULL DEFAULT '120' COMMENT 'Creature respawn time minimum',
  `spawntimesecsmax` int unsigned NOT NULL DEFAULT '120' COMMENT 'Creature respawn time maximum',
  `spawndist` float NOT NULL DEFAULT '5',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `index_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9000421 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_addon` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `stand_state` tinyint unsigned NOT NULL DEFAULT '0',
  `sheath_state` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `moveflags` int unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_scripts`
--

DROP TABLE IF EXISTS `creature_ai_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_ai_scripts` (
  `id` int NOT NULL COMMENT 'Identifier',
  `creature_id` int NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int unsigned NOT NULL DEFAULT '100',
  `event_flags` int unsigned NOT NULL DEFAULT '0',
  `event_param1` int NOT NULL DEFAULT '0',
  `event_param2` int NOT NULL DEFAULT '0',
  `event_param3` int NOT NULL DEFAULT '0',
  `event_param4` int NOT NULL DEFAULT '0',
  `event_param5` int NOT NULL DEFAULT '0',
  `event_param6` int NOT NULL DEFAULT '0',
  `action1_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int NOT NULL DEFAULT '0',
  `action1_param2` int NOT NULL DEFAULT '0',
  `action1_param3` int NOT NULL DEFAULT '0',
  `action2_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int NOT NULL DEFAULT '0',
  `action2_param2` int NOT NULL DEFAULT '0',
  `action2_param3` int NOT NULL DEFAULT '0',
  `action3_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int NOT NULL DEFAULT '0',
  `action3_param2` int NOT NULL DEFAULT '0',
  `action3_param3` int NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_summons`
--

DROP TABLE IF EXISTS `creature_ai_summons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_ai_summons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_ai_texts`
--

DROP TABLE IF EXISTS `creature_ai_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_ai_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `broadcast_text_id` int NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_battleground`
--

DROP TABLE IF EXISTS `creature_battleground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_battleground` (
  `guid` int unsigned NOT NULL COMMENT 'Creature''s GUID',
  `event1` tinyint unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature battleground indexing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_conditional_spawn`
--

DROP TABLE IF EXISTS `creature_conditional_spawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_conditional_spawn` (
  `Guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `EntryAlliance` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Alliance Creature Identifier',
  `EntryHorde` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Horde Creature Identifier',
  `Comments` varchar(255) NOT NULL,
  PRIMARY KEY (`Guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature System (Conditional Spawn)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_cooldowns`
--

DROP TABLE IF EXISTS `creature_cooldowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_cooldowns` (
  `Entry` mediumint unsigned NOT NULL,
  `SpellId` int unsigned NOT NULL,
  `CooldownMin` int unsigned NOT NULL,
  `CooldownMax` int unsigned NOT NULL,
  PRIMARY KEY (`Entry`,`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_equip_template`
--

DROP TABLE IF EXISTS `creature_equip_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_equip_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipentry1` mediumint unsigned NOT NULL DEFAULT '0',
  `equipentry2` mediumint unsigned NOT NULL DEFAULT '0',
  `equipentry3` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Creature System (Equipment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_immunities`
--

DROP TABLE IF EXISTS `creature_immunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_immunities` (
  `Entry` int unsigned NOT NULL COMMENT 'creature_template entry',
  `SetId` int unsigned NOT NULL DEFAULT '0' COMMENT 'immunity set ID',
  `Type` tinyint unsigned NOT NULL COMMENT 'enum SpellImmunity',
  `Value` int unsigned NOT NULL COMMENT 'value depending on type',
  PRIMARY KEY (`Entry`,`SetId`,`Type`,`Value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_involvedrelation`
--

DROP TABLE IF EXISTS `creature_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_linking`
--

DROP TABLE IF EXISTS `creature_linking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_linking` (
  `guid` int unsigned NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature Linking System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_linking_template`
--

DROP TABLE IF EXISTS `creature_linking_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_linking_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template.entry of the slave mob that is linked',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Id of map of the mobs',
  `master_entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'master to trigger events',
  `flag` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'flag - describing what should happen when',
  `search_range` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature Linking System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for player insignia loot',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_model_info`
--

DROP TABLE IF EXISTS `creature_model_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_model_info` (
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `SpeedWalk` float NOT NULL DEFAULT '1' COMMENT 'Default walking speed for any creature with model',
  `SpeedRun` float NOT NULL DEFAULT '1.14286' COMMENT 'Default running speed for any creature with model',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint unsigned NOT NULL DEFAULT '0',
  `modelid_other_team` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Creature System (Model related info)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_model_race`
--

DROP TABLE IF EXISTS `creature_model_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_model_race` (
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `racemask` mediumint unsigned NOT NULL DEFAULT '0',
  `creature_entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'option 1, modelid_N from creature_template',
  `modelid_racial` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'option 2, explicit modelid',
  PRIMARY KEY (`modelid`,`racemask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Model system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement`
--

DROP TABLE IF EXISTS `creature_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_movement` (
  `Id` int unsigned NOT NULL,
  `Point` mediumint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `WaitTime` int unsigned NOT NULL DEFAULT '0',
  `ScriptId` mediumint unsigned NOT NULL,
  `Comment` text,
  PRIMARY KEY (`Id`,`Point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement_template`
--

DROP TABLE IF EXISTS `creature_movement_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_movement_template` (
  `Entry` mediumint unsigned NOT NULL,
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `Point` mediumint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `WaitTime` int unsigned NOT NULL DEFAULT '0',
  `ScriptId` mediumint unsigned NOT NULL DEFAULT '0',
  `Comment` text,
  PRIMARY KEY (`Entry`,`PathId`,`Point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature waypoint system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_questrelation`
--

DROP TABLE IF EXISTS `creature_questrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_questrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spawn_data`
--

DROP TABLE IF EXISTS `creature_spawn_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spawn_data` (
  `Guid` int unsigned NOT NULL COMMENT 'guid of creature',
  `Id` int unsigned NOT NULL COMMENT 'ID of template',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spawn_data_template`
--

DROP TABLE IF EXISTS `creature_spawn_data_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spawn_data_template` (
  `Entry` int unsigned NOT NULL COMMENT 'ID of template',
  `NpcFlags` int NOT NULL DEFAULT '-1',
  `UnitFlags` bigint NOT NULL DEFAULT '-1',
  `Faction` int unsigned NOT NULL DEFAULT '0',
  `ModelId` mediumint unsigned NOT NULL DEFAULT '0',
  `EquipmentId` mediumint NOT NULL DEFAULT '-1',
  `CurHealth` int unsigned NOT NULL DEFAULT '0',
  `CurMana` int unsigned NOT NULL DEFAULT '0',
  `SpawnFlags` int unsigned NOT NULL DEFAULT '0',
  `RelayId` int unsigned NOT NULL DEFAULT '0' COMMENT 'dbscripts_on_relay',
  `StringId` int unsigned NOT NULL DEFAULT '0',
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`Entry`,`NpcFlags`,`UnitFlags`,`ModelId`,`EquipmentId`,`CurHealth`,`CurMana`,`SpawnFlags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spawn_entry`
--

DROP TABLE IF EXISTS `creature_spawn_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spawn_entry` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Creature System (Spawn Entry)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spell_list`
--

DROP TABLE IF EXISTS `creature_spell_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spell_list` (
  `Id` int NOT NULL COMMENT 'List ID',
  `Position` int NOT NULL COMMENT 'Position on list',
  `SpellId` int NOT NULL COMMENT 'Spell ID',
  `Flags` int NOT NULL COMMENT 'Spell Flags',
  `CombatCondition` int NOT NULL DEFAULT '-1',
  `TargetId` int NOT NULL COMMENT 'Targeting ID',
  `ScriptId` int NOT NULL COMMENT 'Dbscript to be launched on success',
  `Availability` int NOT NULL COMMENT 'Chance on spawn for spell to be included',
  `Probability` int NOT NULL COMMENT 'Weight of spell when multiple are available',
  `InitialMin` int NOT NULL COMMENT 'Initial delay minimum',
  `InitialMax` int NOT NULL COMMENT 'Initial delay maximum',
  `RepeatMin` int NOT NULL COMMENT 'Repeated delay minimum',
  `RepeatMax` int NOT NULL COMMENT 'Repeated delay maximum',
  `Comments` varchar(255) NOT NULL COMMENT 'Description of spell use',
  PRIMARY KEY (`Id`,`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spell_list_entry`
--

DROP TABLE IF EXISTS `creature_spell_list_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spell_list_entry` (
  `Id` int NOT NULL COMMENT 'List ID',
  `Name` varchar(200) NOT NULL COMMENT 'Description of usage',
  `ChanceSupportAction` int NOT NULL COMMENT 'Chance of support action per tick',
  `ChanceRangedAttack` int NOT NULL COMMENT 'Chance of ranged attack per tick',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_spell_targeting`
--

DROP TABLE IF EXISTS `creature_spell_targeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_spell_targeting` (
  `Id` int NOT NULL COMMENT 'Targeting ID',
  `Type` int NOT NULL COMMENT 'Type of targeting ID',
  `Param1` int NOT NULL COMMENT 'First parameter',
  `Param2` int NOT NULL COMMENT 'Second parameter',
  `Param3` int NOT NULL COMMENT 'Third parameter',
  `UnitCondition` int NOT NULL DEFAULT '-1',
  `Comments` varchar(255) NOT NULL COMMENT 'Description of target',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Name` char(100) NOT NULL DEFAULT '',
  `SubName` char(100) DEFAULT NULL,
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '1',
  `ModelId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId4` mediumint unsigned NOT NULL DEFAULT '0',
  `Faction` smallint unsigned NOT NULL DEFAULT '0',
  `Scale` float NOT NULL DEFAULT '1',
  `Family` tinyint NOT NULL DEFAULT '0',
  `CreatureType` tinyint unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint unsigned NOT NULL DEFAULT '3',
  `RegenerateStats` tinyint unsigned NOT NULL DEFAULT '3',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `NpcFlags` int unsigned NOT NULL DEFAULT '0',
  `UnitFlags` int unsigned NOT NULL DEFAULT '0',
  `DynamicFlags` int unsigned NOT NULL DEFAULT '0',
  `ExtraFlags` int unsigned NOT NULL DEFAULT '0',
  `CreatureTypeFlags` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags1` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags2` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags3` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags4` int unsigned NOT NULL DEFAULT '0',
  `SpeedWalk` float NOT NULL DEFAULT '0',
  `SpeedRun` float NOT NULL DEFAULT '0',
  `Detection` int unsigned NOT NULL DEFAULT '18',
  `CallForHelp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Range in which creature calls for help?',
  `Pursuit` int unsigned NOT NULL DEFAULT '0' COMMENT 'When exceeded during pursuit creature evades?',
  `Leash` int unsigned NOT NULL DEFAULT '0' COMMENT 'Leash range from combat start position',
  `Timeout` int unsigned NOT NULL DEFAULT '0' COMMENT 'Time for refreshing leashing before evade?',
  `UnitClass` tinyint unsigned NOT NULL DEFAULT '0',
  `Rank` tinyint unsigned NOT NULL DEFAULT '0',
  `HealthMultiplier` float NOT NULL DEFAULT '1',
  `PowerMultiplier` float NOT NULL DEFAULT '1',
  `DamageMultiplier` float NOT NULL DEFAULT '1',
  `DamageVariance` float NOT NULL DEFAULT '1',
  `ArmorMultiplier` float NOT NULL DEFAULT '1',
  `ExperienceMultiplier` float NOT NULL DEFAULT '1',
  `MinLevelHealth` int unsigned NOT NULL DEFAULT '0',
  `MaxLevelHealth` int unsigned NOT NULL DEFAULT '0',
  `MinLevelMana` int unsigned NOT NULL DEFAULT '0',
  `MaxLevelMana` int unsigned NOT NULL DEFAULT '0',
  `MinMeleeDmg` float NOT NULL DEFAULT '0',
  `MaxMeleeDmg` float NOT NULL DEFAULT '0',
  `MinRangedDmg` float NOT NULL DEFAULT '0',
  `MaxRangedDmg` float NOT NULL DEFAULT '0',
  `Armor` mediumint unsigned NOT NULL DEFAULT '0',
  `MeleeAttackPower` int unsigned NOT NULL DEFAULT '0',
  `RangedAttackPower` smallint unsigned NOT NULL DEFAULT '0',
  `MeleeBaseAttackTime` int unsigned NOT NULL DEFAULT '2000',
  `RangedBaseAttackTime` int unsigned NOT NULL DEFAULT '2000',
  `DamageSchool` tinyint NOT NULL DEFAULT '0',
  `MinLootGold` mediumint unsigned NOT NULL DEFAULT '0',
  `MaxLootGold` mediumint unsigned NOT NULL DEFAULT '0',
  `LootId` mediumint unsigned NOT NULL DEFAULT '0',
  `PickpocketLootId` mediumint unsigned NOT NULL DEFAULT '0',
  `SkinningLootId` mediumint unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `MechanicImmuneMask` int unsigned NOT NULL DEFAULT '0',
  `SchoolImmuneMask` int unsigned NOT NULL DEFAULT '0',
  `ResistanceHoly` smallint NOT NULL DEFAULT '0',
  `ResistanceFire` smallint NOT NULL DEFAULT '0',
  `ResistanceNature` smallint NOT NULL DEFAULT '0',
  `ResistanceFrost` smallint NOT NULL DEFAULT '0',
  `ResistanceShadow` smallint NOT NULL DEFAULT '0',
  `ResistanceArcane` smallint NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerType` tinyint NOT NULL DEFAULT '0',
  `TrainerSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `TrainerClass` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerRace` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `VendorTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `GossipMenuId` mediumint unsigned NOT NULL DEFAULT '0',
  `InteractionPauseTimer` int NOT NULL DEFAULT '-1',
  `CorpseDecay` int unsigned NOT NULL DEFAULT '0' COMMENT 'Time before corpse despawns',
  `SpellList` int NOT NULL DEFAULT '0' COMMENT 'creature_spell_list_entry',
  `StringId1` int unsigned NOT NULL DEFAULT '0',
  `StringId2` int unsigned NOT NULL DEFAULT '0',
  `EquipmentTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `Civilian` tinyint unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_addon`
--

DROP TABLE IF EXISTS `creature_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_addon` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `stand_state` tinyint unsigned NOT NULL DEFAULT '0',
  `sheath_state` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` mediumint unsigned NOT NULL DEFAULT '0',
  `moveflags` int unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_armor`
--

DROP TABLE IF EXISTS `creature_template_armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_armor` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Name` char(100) NOT NULL DEFAULT '',
  `SubName` char(100) DEFAULT NULL,
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '1',
  `ModelId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ModelId4` mediumint unsigned NOT NULL DEFAULT '0',
  `FactionAlliance` smallint unsigned NOT NULL DEFAULT '0',
  `FactionHorde` smallint unsigned NOT NULL DEFAULT '0',
  `Scale` float NOT NULL DEFAULT '1',
  `Family` tinyint NOT NULL DEFAULT '0',
  `CreatureType` tinyint unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint unsigned NOT NULL DEFAULT '3',
  `RegenerateStats` tinyint unsigned NOT NULL DEFAULT '3',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `NpcFlags` int unsigned NOT NULL DEFAULT '0',
  `UnitFlags` int unsigned NOT NULL DEFAULT '0',
  `DynamicFlags` int unsigned NOT NULL DEFAULT '0',
  `ExtraFlags` int unsigned NOT NULL DEFAULT '0',
  `CreatureTypeFlags` int unsigned NOT NULL DEFAULT '0',
  `SpeedWalk` float NOT NULL DEFAULT '1',
  `SpeedRun` float NOT NULL DEFAULT '1.14286',
  `UnitClass` tinyint unsigned NOT NULL DEFAULT '0',
  `Rank` tinyint unsigned NOT NULL DEFAULT '0',
  `HealthMultiplier` float NOT NULL DEFAULT '1',
  `PowerMultiplier` float NOT NULL DEFAULT '1',
  `DamageMultiplier` float NOT NULL DEFAULT '1',
  `DamageVariance` float NOT NULL DEFAULT '1',
  `ArmorMultiplier` float NOT NULL DEFAULT '1',
  `ExperienceMultiplier` float NOT NULL DEFAULT '1',
  `MinLevelHealth` int unsigned NOT NULL DEFAULT '0',
  `MaxLevelHealth` int unsigned NOT NULL DEFAULT '0',
  `MinLevelMana` int unsigned NOT NULL DEFAULT '0',
  `MaxLevelMana` int unsigned NOT NULL DEFAULT '0',
  `MinMeleeDmg` float NOT NULL DEFAULT '0',
  `MaxMeleeDmg` float NOT NULL DEFAULT '0',
  `MinRangedDmg` float NOT NULL DEFAULT '0',
  `MaxRangedDmg` float NOT NULL DEFAULT '0',
  `Armor` mediumint unsigned NOT NULL DEFAULT '0',
  `MeleeAttackPower` int unsigned NOT NULL DEFAULT '0',
  `RangedAttackPower` smallint unsigned NOT NULL DEFAULT '0',
  `MeleeBaseAttackTime` int unsigned NOT NULL DEFAULT '2000',
  `RangedBaseAttackTime` int unsigned NOT NULL DEFAULT '2000',
  `DamageSchool` tinyint NOT NULL DEFAULT '0',
  `MinLootGold` mediumint unsigned NOT NULL DEFAULT '0',
  `MaxLootGold` mediumint unsigned NOT NULL DEFAULT '0',
  `LootId` mediumint unsigned NOT NULL DEFAULT '0',
  `PickpocketLootId` mediumint unsigned NOT NULL DEFAULT '0',
  `SkinningLootId` mediumint unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `MechanicImmuneMask` int unsigned NOT NULL DEFAULT '0',
  `SchoolImmuneMask` int unsigned NOT NULL DEFAULT '0',
  `ResistanceHoly` smallint NOT NULL DEFAULT '0',
  `ResistanceFire` smallint NOT NULL DEFAULT '0',
  `ResistanceNature` smallint NOT NULL DEFAULT '0',
  `ResistanceFrost` smallint NOT NULL DEFAULT '0',
  `ResistanceShadow` smallint NOT NULL DEFAULT '0',
  `ResistanceArcane` smallint NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerType` tinyint NOT NULL DEFAULT '0',
  `TrainerSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `TrainerClass` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerRace` tinyint unsigned NOT NULL DEFAULT '0',
  `TrainerTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `VendorTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `GossipMenuId` mediumint unsigned NOT NULL DEFAULT '0',
  `EquipmentTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `Civilian` tinyint unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_classlevelstats`
--

DROP TABLE IF EXISTS `creature_template_classlevelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_classlevelstats` (
  `Level` tinyint NOT NULL,
  `Class` tinyint NOT NULL,
  `BaseHealthExp0` mediumint unsigned NOT NULL DEFAULT '1',
  `BaseMana` mediumint unsigned NOT NULL DEFAULT '0',
  `BaseDamageExp0` float NOT NULL DEFAULT '0',
  `BaseMeleeAttackPower` float NOT NULL DEFAULT '0',
  `BaseRangedAttackPower` float NOT NULL DEFAULT '0',
  `BaseArmor` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Level`,`Class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_spells`
--

DROP TABLE IF EXISTS `creature_template_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_spells` (
  `entry` mediumint unsigned NOT NULL,
  `setId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Id of set of spells',
  `spell1` mediumint unsigned NOT NULL,
  `spell2` mediumint unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint unsigned NOT NULL DEFAULT '0',
  `spell5` mediumint unsigned NOT NULL DEFAULT '0',
  `spell6` mediumint unsigned NOT NULL DEFAULT '0',
  `spell7` mediumint unsigned NOT NULL DEFAULT '0',
  `spell8` mediumint unsigned NOT NULL DEFAULT '0',
  `spell9` mediumint unsigned NOT NULL DEFAULT '0',
  `spell10` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`setId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Creature System (Spells used by creature)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_texts`
--

DROP TABLE IF EXISTS `custom_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `broadcast_text_id` int NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Custom Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_version` (
  `version` varchar(120) DEFAULT NULL,
  `creature_ai_version` varchar(120) DEFAULT NULL,
  `required_z2816_01_mangos_precision_decimal` bit(1) DEFAULT NULL,
  `content_4586_kirtonos_loot_2` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Used DB version notes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscript_random_templates`
--

DROP TABLE IF EXISTS `dbscript_random_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscript_random_templates` (
  `id` int unsigned NOT NULL COMMENT 'Id of template',
  `type` int unsigned NOT NULL COMMENT 'Type of template',
  `target_id` int NOT NULL DEFAULT '0' COMMENT 'Id of chanced element',
  `chance` int NOT NULL DEFAULT '0' COMMENT 'Chance for element to occur in %',
  `comments` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`,`type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='DBScript system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscript_string`
--

DROP TABLE IF EXISTS `dbscript_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscript_string` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `broadcast_text_id` int NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_creature_death`
--

DROP TABLE IF EXISTS `dbscripts_on_creature_death`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_creature_death` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` int unsigned NOT NULL DEFAULT '0',
  `search_radius` int unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_creature_movement`
--

DROP TABLE IF EXISTS `dbscripts_on_creature_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_creature_movement` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_event`
--

DROP TABLE IF EXISTS `dbscripts_on_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_event` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_go_template_use`
--

DROP TABLE IF EXISTS `dbscripts_on_go_template_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_go_template_use` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` int unsigned NOT NULL DEFAULT '0',
  `search_radius` int unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_go_use`
--

DROP TABLE IF EXISTS `dbscripts_on_go_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_go_use` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_gossip`
--

DROP TABLE IF EXISTS `dbscripts_on_gossip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_gossip` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_quest_end`
--

DROP TABLE IF EXISTS `dbscripts_on_quest_end`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_quest_end` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_quest_start`
--

DROP TABLE IF EXISTS `dbscripts_on_quest_start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_quest_start` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_relay`
--

DROP TABLE IF EXISTS `dbscripts_on_relay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_relay` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbscripts_on_spell`
--

DROP TABLE IF EXISTS `dbscripts_on_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbscripts_on_spell` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `datalong3` int unsigned NOT NULL DEFAULT '0',
  `buddy_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `search_radius` mediumint unsigned NOT NULL DEFAULT '0',
  `data_flags` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `dataint2` int NOT NULL DEFAULT '0',
  `dataint3` int NOT NULL DEFAULT '0',
  `dataint4` int NOT NULL DEFAULT '0',
  `datafloat` float NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `speed` float NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exploration_basexp`
--

DROP TABLE IF EXISTS `exploration_basexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exploration_basexp` (
  `level` tinyint NOT NULL DEFAULT '0',
  `basexp` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Exploration System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for junk loot at fishing fail (if allowed by config option)',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event` (
  `entry` mediumint unsigned NOT NULL COMMENT 'Entry of the game event',
  `schedule_type` int NOT NULL DEFAULT '0',
  `occurence` bigint unsigned NOT NULL DEFAULT '86400' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint unsigned NOT NULL DEFAULT '43200' COMMENT 'Length in minutes of the event',
  `holiday` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `linkedTo` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'This event starts only if defined LinkedTo event is started',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature`
--

DROP TABLE IF EXISTS `game_event_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_creature` (
  `guid` int unsigned NOT NULL,
  `event` smallint NOT NULL DEFAULT '0' COMMENT 'Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn.',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature_data`
--

DROP TABLE IF EXISTS `game_event_creature_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_creature_data` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `entry_id` mediumint unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint unsigned NOT NULL DEFAULT '0',
  `spell_start` mediumint unsigned NOT NULL DEFAULT '0',
  `spell_end` mediumint unsigned NOT NULL DEFAULT '0',
  `event` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_gameobject`
--

DROP TABLE IF EXISTS `game_event_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_gameobject` (
  `guid` int unsigned NOT NULL,
  `event` smallint NOT NULL DEFAULT '0' COMMENT 'Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn.',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_mail`
--

DROP TABLE IF EXISTS `game_event_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_mail` (
  `event` smallint NOT NULL DEFAULT '0' COMMENT 'Negatives value to send at event stop, positive value for send at event start.',
  `raceMask` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`,`raceMask`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_quest`
--

DROP TABLE IF EXISTS `game_event_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_quest` (
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'entry from quest_template',
  `event` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'entry from game_event',
  PRIMARY KEY (`quest`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Game event system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_time`
--

DROP TABLE IF EXISTS `game_event_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_time` (
  `entry` mediumint unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT 'Absolute end date, the event will never start after',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `ghost_loc` mediumint unsigned NOT NULL,
  `link_kind` tinyint unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_loc`,`link_kind`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_tele` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8mb3 COMMENT='Tele Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_weather` (
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Weather System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject` (
  `guid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint unsigned NOT NULL DEFAULT '1',
  `position_x` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `position_y` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `position_z` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `orientation` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `rotation0` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `rotation1` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `rotation2` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `rotation3` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000',
  `spawntimesecsmin` int NOT NULL DEFAULT '0' COMMENT 'Gameobject respawn time minimum',
  `spawntimesecsmax` int NOT NULL DEFAULT '0' COMMENT 'Gameobject respawn time maximum',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9000294 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_addon`
--

DROP TABLE IF EXISTS `gameobject_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_addon` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `animprogress` tinyint unsigned NOT NULL DEFAULT '100',
  `state` tinyint NOT NULL DEFAULT '-1',
  `StringId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_battleground`
--

DROP TABLE IF EXISTS `gameobject_battleground`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_battleground` (
  `guid` int unsigned NOT NULL COMMENT 'GameObject''s GUID',
  `event1` tinyint unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='GameObject battleground indexing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_involvedrelation`
--

DROP TABLE IF EXISTS `gameobject_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_questrelation`
--

DROP TABLE IF EXISTS `gameobject_questrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_questrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_spawn_entry`
--

DROP TABLE IF EXISTS `gameobject_spawn_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_spawn_entry` (
  `guid` int unsigned NOT NULL COMMENT 'Gameobject table guid',
  `entry` mediumint unsigned NOT NULL COMMENT 'Gameobject Template entry',
  PRIMARY KEY (`guid`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `ExtraFlags` int unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `data0` int unsigned NOT NULL DEFAULT '0',
  `data1` int NOT NULL DEFAULT '0',
  `data2` int unsigned NOT NULL DEFAULT '0',
  `data3` int unsigned NOT NULL DEFAULT '0',
  `data4` int unsigned NOT NULL DEFAULT '0',
  `data5` int unsigned NOT NULL DEFAULT '0',
  `data6` int NOT NULL DEFAULT '0',
  `data7` int unsigned NOT NULL DEFAULT '0',
  `data8` int unsigned NOT NULL DEFAULT '0',
  `data9` int unsigned NOT NULL DEFAULT '0',
  `data10` int unsigned NOT NULL DEFAULT '0',
  `data11` int unsigned NOT NULL DEFAULT '0',
  `data12` int unsigned NOT NULL DEFAULT '0',
  `data13` int unsigned NOT NULL DEFAULT '0',
  `data14` int unsigned NOT NULL DEFAULT '0',
  `data15` int unsigned NOT NULL DEFAULT '0',
  `data16` int unsigned NOT NULL DEFAULT '0',
  `data17` int unsigned NOT NULL DEFAULT '0',
  `data18` int unsigned NOT NULL DEFAULT '0',
  `data19` int unsigned NOT NULL DEFAULT '0',
  `data20` int unsigned NOT NULL DEFAULT '0',
  `data21` int unsigned NOT NULL DEFAULT '0',
  `data22` int unsigned NOT NULL DEFAULT '0',
  `data23` int unsigned NOT NULL DEFAULT '0',
  `CustomData1` int unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint unsigned NOT NULL DEFAULT '0',
  `StringId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template_addon`
--

DROP TABLE IF EXISTS `gameobject_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_template_addon` (
  `Entry` int unsigned NOT NULL COMMENT 'gameobject_template',
  `Artkit0` int NOT NULL DEFAULT '0',
  `Artkit1` int NOT NULL DEFAULT '0',
  `Artkit2` int NOT NULL DEFAULT '0',
  `Artkit3` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu`
--

DROP TABLE IF EXISTS `gossip_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_menu` (
  `entry` smallint unsigned NOT NULL DEFAULT '0',
  `text_id` mediumint unsigned NOT NULL DEFAULT '0',
  `script_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'script in `gossip_scripts` - will be executed on GossipHello',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`text_id`,`script_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_option`
--

DROP TABLE IF EXISTS `gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_menu_option` (
  `menu_id` smallint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `option_icon` mediumint unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `option_broadcast_text` int NOT NULL DEFAULT '0',
  `option_id` tinyint unsigned NOT NULL DEFAULT '0',
  `npc_option_npcflag` int unsigned NOT NULL DEFAULT '0',
  `action_menu_id` mediumint NOT NULL DEFAULT '0',
  `action_poi_id` mediumint unsigned NOT NULL DEFAULT '0',
  `action_script_id` mediumint unsigned NOT NULL DEFAULT '0',
  `box_coded` tinyint unsigned NOT NULL DEFAULT '0',
  `box_money` int unsigned NOT NULL DEFAULT '0',
  `box_text` text,
  `box_broadcast_text` int NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_texts`
--

DROP TABLE IF EXISTS `gossip_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Gossip Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_dungeon_encounters`
--

DROP TABLE IF EXISTS `instance_dungeon_encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_dungeon_encounters` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `MapId` int unsigned NOT NULL DEFAULT '0',
  `Difficulty` int unsigned NOT NULL DEFAULT '0',
  `EncounterData` int unsigned NOT NULL DEFAULT '0',
  `EncounterIndex` int unsigned NOT NULL DEFAULT '0',
  `CompleteWorldStateID` int unsigned NOT NULL DEFAULT '0',
  `EncounterName` text NOT NULL,
  `EncounterName2` text,
  `EncounterName3` text,
  `EncounterName4` text,
  `EncounterName5` text,
  `EncounterName6` text,
  `EncounterName7` text,
  `EncounterName8` text,
  `EncounterName9` text,
  `EncounterName10` text,
  `EncounterName11` text,
  `EncounterName12` text,
  `EncounterName13` text,
  `EncounterName14` text,
  `EncounterName15` text,
  `EncounterName16` text,
  `NameLangFlags` int unsigned NOT NULL DEFAULT '0',
  `SpellIconID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Export of .dbc DungeonEncounter.dbc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_encounters`
--

DROP TABLE IF EXISTS `instance_encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_encounters` (
  `entry` int unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint unsigned NOT NULL DEFAULT '0',
  `creditEntry` int unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_template` (
  `map` smallint unsigned NOT NULL,
  `parent` smallint unsigned NOT NULL DEFAULT '0',
  `levelMin` tinyint unsigned NOT NULL DEFAULT '0',
  `levelMax` tinyint unsigned NOT NULL DEFAULT '0',
  `maxPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `reset_delay` int unsigned NOT NULL DEFAULT '0' COMMENT 'Reset time in days',
  `ghostEntranceMap` smallint unsigned NOT NULL,
  `ghostEntranceX` float NOT NULL,
  `ghostEntranceY` float NOT NULL,
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  `mountAllowed` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_convert`
--

DROP TABLE IF EXISTS `item_convert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_convert` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_enchantment_template`
--

DROP TABLE IF EXISTS `item_enchantment_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `ench` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_expire_convert`
--

DROP TABLE IF EXISTS `item_expire_convert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_expire_convert` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item Convert System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_required_target`
--

DROP TABLE IF EXISTS `item_required_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_required_target` (
  `entry` mediumint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint unsigned NOT NULL DEFAULT '1',
  `BuyPrice` int unsigned NOT NULL DEFAULT '0',
  `SellPrice` int unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `AllowableClass` mediumint NOT NULL DEFAULT '-1',
  `AllowableRace` mediumint NOT NULL DEFAULT '-1',
  `ItemLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint unsigned NOT NULL DEFAULT '0',
  `maxcount` smallint unsigned NOT NULL DEFAULT '0',
  `stackable` smallint unsigned NOT NULL DEFAULT '1',
  `ContainerSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint NOT NULL DEFAULT '0',
  `stat_type2` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint NOT NULL DEFAULT '0',
  `stat_type3` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint NOT NULL DEFAULT '0',
  `stat_type4` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint NOT NULL DEFAULT '0',
  `stat_type5` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint NOT NULL DEFAULT '0',
  `stat_type6` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint NOT NULL DEFAULT '0',
  `stat_type7` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint NOT NULL DEFAULT '0',
  `stat_type8` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint NOT NULL DEFAULT '0',
  `stat_type9` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint NOT NULL DEFAULT '0',
  `stat_type10` tinyint unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint unsigned NOT NULL DEFAULT '0',
  `dmg_min3` float NOT NULL DEFAULT '0',
  `dmg_max3` float NOT NULL DEFAULT '0',
  `dmg_type3` tinyint unsigned NOT NULL DEFAULT '0',
  `dmg_min4` float NOT NULL DEFAULT '0',
  `dmg_max4` float NOT NULL DEFAULT '0',
  `dmg_type4` tinyint unsigned NOT NULL DEFAULT '0',
  `dmg_min5` float NOT NULL DEFAULT '0',
  `dmg_max5` float NOT NULL DEFAULT '0',
  `dmg_type5` tinyint unsigned NOT NULL DEFAULT '0',
  `armor` smallint unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint unsigned NOT NULL DEFAULT '0',
  `delay` smallint unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint unsigned NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` tinyint NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int NOT NULL DEFAULT '-1',
  `spellid_2` mediumint unsigned NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` tinyint NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int NOT NULL DEFAULT '-1',
  `spellid_3` mediumint unsigned NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` tinyint NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int NOT NULL DEFAULT '-1',
  `spellid_4` mediumint unsigned NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` tinyint NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int NOT NULL DEFAULT '-1',
  `spellid_5` mediumint unsigned NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` tinyint NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int NOT NULL DEFAULT '-1',
  `bonding` tinyint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint unsigned NOT NULL DEFAULT '0',
  `Material` tinyint NOT NULL DEFAULT '0',
  `sheath` tinyint unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint unsigned NOT NULL DEFAULT '0',
  `block` mediumint unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `Map` smallint NOT NULL DEFAULT '0',
  `BagFamily` mediumint NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `Duration` int unsigned NOT NULL DEFAULT '0' COMMENT 'Duration in seconds',
  `ExtraFlags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_areatrigger_teleport`
--

DROP TABLE IF EXISTS `locales_areatrigger_teleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_areatrigger_teleport` (
  `Entry` int unsigned NOT NULL COMMENT 'Entry of Areatrigger Teleport',
  `Text_loc1` longtext COMMENT 'Text of the status_failed locale 1',
  `Text_loc2` longtext COMMENT 'Text of the status_failed locale 2',
  `Text_loc3` longtext COMMENT 'Text of the status_failed locale 3',
  `Text_loc4` longtext COMMENT 'Text of the status_failed locale 4',
  `Text_loc5` longtext COMMENT 'Text of the status_failed locale 5',
  `Text_loc6` longtext COMMENT 'Text of the status_failed locale 6',
  `Text_loc7` longtext COMMENT 'Text of the status_failed locale 7',
  `Text_loc8` longtext COMMENT 'Text of the status_failed locale 8',
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Areatrigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_creature`
--

DROP TABLE IF EXISTS `locales_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_creature` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gameobject`
--

DROP TABLE IF EXISTS `locales_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_gameobject` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_gossip_menu_option`
--

DROP TABLE IF EXISTS `locales_gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_gossip_menu_option` (
  `menu_id` smallint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_item`
--

DROP TABLE IF EXISTS `locales_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_item` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_npc_text`
--

DROP TABLE IF EXISTS `locales_npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_npc_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_page_text`
--

DROP TABLE IF EXISTS `locales_page_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_page_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_points_of_interest`
--

DROP TABLE IF EXISTS `locales_points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_points_of_interest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_quest`
--

DROP TABLE IF EXISTS `locales_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_quest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_questgiver_greeting`
--

DROP TABLE IF EXISTS `locales_questgiver_greeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_questgiver_greeting` (
  `Entry` int unsigned NOT NULL COMMENT 'Entry of Questgiver',
  `Type` int unsigned NOT NULL COMMENT 'Type of entry',
  `Text_loc1` longtext COMMENT 'Text of the greeting locale 1',
  `Text_loc2` longtext COMMENT 'Text of the greeting locale 2',
  `Text_loc3` longtext COMMENT 'Text of the greeting locale 3',
  `Text_loc4` longtext COMMENT 'Text of the greeting locale 4',
  `Text_loc5` longtext COMMENT 'Text of the greeting locale 5',
  `Text_loc6` longtext COMMENT 'Text of the greeting locale 6',
  `Text_loc7` longtext COMMENT 'Text of the greeting locale 7',
  `Text_loc8` longtext COMMENT 'Text of the greeting locale 8',
  PRIMARY KEY (`Entry`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Quest and Gossip system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_trainer_greeting`
--

DROP TABLE IF EXISTS `locales_trainer_greeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_trainer_greeting` (
  `Entry` int unsigned NOT NULL COMMENT 'Entry of Trainer',
  `Text_loc1` longtext COMMENT 'Text of the greeting locale 1',
  `Text_loc2` longtext COMMENT 'Text of the greeting locale 2',
  `Text_loc3` longtext COMMENT 'Text of the greeting locale 3',
  `Text_loc4` longtext COMMENT 'Text of the greeting locale 4',
  `Text_loc5` longtext COMMENT 'Text of the greeting locale 5',
  `Text_loc6` longtext COMMENT 'Text of the greeting locale 6',
  `Text_loc7` longtext COMMENT 'Text of the greeting locale 7',
  `Text_loc8` longtext COMMENT 'Text of the greeting locale 8',
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Trainer system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_level_reward`
--

DROP TABLE IF EXISTS `mail_level_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_level_reward` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `raceMask` mediumint unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_loot_template`
--

DROP TABLE IF EXISTS `mail_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mangos_string`
--

DROP TABLE IF EXISTS `mangos_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangos_string` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_gossip`
--

DROP TABLE IF EXISTS `npc_gossip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_gossip` (
  `npc_guid` int unsigned NOT NULL DEFAULT '0',
  `textid` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_spellclick_spells`
--

DROP TABLE IF EXISTS `npc_spellclick_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int unsigned NOT NULL COMMENT 'spell which should be casted ',
  `quest_start` mediumint unsigned NOT NULL COMMENT 'reference to quest_template',
  `quest_start_active` tinyint unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint unsigned NOT NULL DEFAULT '0',
  `cast_flags` tinyint unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_text` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text_broadcast_text`
--

DROP TABLE IF EXISTS `npc_text_broadcast_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_text_broadcast_text` (
  `Id` mediumint unsigned NOT NULL COMMENT 'Identifier',
  `Prob0` float NOT NULL,
  `Prob1` float NOT NULL DEFAULT '0',
  `Prob2` float NOT NULL DEFAULT '0',
  `Prob3` float NOT NULL DEFAULT '0',
  `Prob4` float NOT NULL DEFAULT '0',
  `Prob5` float NOT NULL DEFAULT '0',
  `Prob6` float NOT NULL DEFAULT '0',
  `Prob7` float NOT NULL DEFAULT '0',
  `BroadcastTextId0` int NOT NULL,
  `BroadcastTextId1` int NOT NULL DEFAULT '0',
  `BroadcastTextId2` int NOT NULL DEFAULT '0',
  `BroadcastTextId3` int NOT NULL DEFAULT '0',
  `BroadcastTextId4` int NOT NULL DEFAULT '0',
  `BroadcastTextId5` int NOT NULL DEFAULT '0',
  `BroadcastTextId6` int NOT NULL DEFAULT '0',
  `BroadcastTextId7` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Broadcast Text npc_text equivalent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_trainer` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `spellcost` int unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint unsigned NOT NULL DEFAULT '0',
  `ReqAbility1` int unsigned DEFAULT NULL,
  `ReqAbility2` int unsigned DEFAULT NULL,
  `ReqAbility3` int unsigned DEFAULT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_trainer_template`
--

DROP TABLE IF EXISTS `npc_trainer_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_trainer_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `spellcost` int unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint unsigned NOT NULL DEFAULT '0',
  `ReqAbility1` int unsigned DEFAULT NULL,
  `ReqAbility2` int unsigned DEFAULT NULL,
  `ReqAbility3` int unsigned DEFAULT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_vendor` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_vendor_template`
--

DROP TABLE IF EXISTS `npc_vendor_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_vendor_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_text` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_familystats`
--

DROP TABLE IF EXISTS `pet_familystats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_familystats` (
  `family` mediumint unsigned NOT NULL DEFAULT '0',
  `healthModifier` float NOT NULL DEFAULT '1',
  `damageModifier` float NOT NULL DEFAULT '1',
  `armorModifier` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`family`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Pet System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores pet levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_levelstats_copy`
--

DROP TABLE IF EXISTS `pet_levelstats_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_levelstats_copy` (
  `creature_entry` mediumint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Stores pet levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_name_generation` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `half` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `petcreateinfo_spell`
--

DROP TABLE IF EXISTS `petcreateinfo_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petcreateinfo_spell` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Spell1` mediumint unsigned NOT NULL DEFAULT '0',
  `Spell2` mediumint unsigned NOT NULL DEFAULT '0',
  `Spell3` mediumint unsigned NOT NULL DEFAULT '0',
  `Spell4` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Pet Create Spells';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_classlevelstats`
--

DROP TABLE IF EXISTS `player_classlevelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_classlevelstats` (
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `basehp` smallint unsigned NOT NULL,
  `basemana` smallint unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_levelstats` (
  `race` tinyint unsigned NOT NULL,
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `str` tinyint unsigned NOT NULL,
  `agi` tinyint unsigned NOT NULL,
  `sta` tinyint unsigned NOT NULL,
  `inte` tinyint unsigned NOT NULL,
  `spi` tinyint unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='Stores levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_xp_for_level` (
  `lvl` int unsigned NOT NULL,
  `xp_for_next_level` int unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `button` smallint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint unsigned NOT NULL DEFAULT '0',
  `amount` tinyint unsigned NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_skills`
--

DROP TABLE IF EXISTS `playercreateinfo_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_skills` (
  `raceMask` int unsigned NOT NULL,
  `classMask` int unsigned NOT NULL,
  `skill` smallint unsigned NOT NULL,
  `step` smallint unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`skill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_of_interest` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint unsigned NOT NULL DEFAULT '0',
  `flags` mediumint unsigned NOT NULL DEFAULT '0',
  `data` mediumint unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_creature` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_creature_template`
--

DROP TABLE IF EXISTS `pool_creature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_creature_template` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_gameobject`
--

DROP TABLE IF EXISTS `pool_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_gameobject` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_gameobject_template`
--

DROP TABLE IF EXISTS `pool_gameobject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_gameobject_template` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_pool`
--

DROP TABLE IF EXISTS `pool_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_pool` (
  `pool_id` mediumint unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`pool_id`),
  KEY `pool_idx` (`mother_pool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_template`
--

DROP TABLE IF EXISTS `pool_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prospecting_loot_template`
--

DROP TABLE IF EXISTS `prospecting_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospecting_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi`
--

DROP TABLE IF EXISTS `quest_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_poi` (
  `questId` mediumint unsigned NOT NULL DEFAULT '0',
  `poiId` tinyint unsigned NOT NULL DEFAULT '0',
  `objIndex` int NOT NULL DEFAULT '0',
  `mapId` int unsigned NOT NULL DEFAULT '0',
  `mapAreaId` mediumint unsigned NOT NULL DEFAULT '0',
  `floorId` tinyint unsigned NOT NULL DEFAULT '0',
  `unk3` int unsigned NOT NULL DEFAULT '0',
  `unk4` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`questId`,`poiId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi_points`
--

DROP TABLE IF EXISTS `quest_poi_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_poi_points` (
  `questId` mediumint unsigned NOT NULL DEFAULT '0',
  `poiId` tinyint unsigned NOT NULL DEFAULT '0',
  `x` int NOT NULL DEFAULT '0',
  `y` int NOT NULL DEFAULT '0',
  KEY `idx_poip` (`questId`,`poiId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Method` tinyint unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint NOT NULL DEFAULT '0',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '255',
  `QuestLevel` smallint NOT NULL,
  `Type` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredClasses` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredCondition` int unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `LimitTime` int unsigned NOT NULL DEFAULT '0',
  `QuestFlags` smallint unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint NOT NULL DEFAULT '0',
  `NextQuestId` mediumint NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint NOT NULL DEFAULT '0',
  `BreadcrumbForQuestId` mediumint unsigned NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceId4` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId1` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId2` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId3` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId4` mediumint NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast1` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast2` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast3` mediumint unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` mediumint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` smallint unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemId1` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId2` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId3` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemId4` mediumint unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint NOT NULL DEFAULT '0',
  `RewRepValue2` mediumint NOT NULL DEFAULT '0',
  `RewRepValue3` mediumint NOT NULL DEFAULT '0',
  `RewRepValue4` mediumint NOT NULL DEFAULT '0',
  `RewRepValue5` mediumint NOT NULL DEFAULT '0',
  `RewOrReqMoney` int NOT NULL DEFAULT '0',
  `RewMoneyMaxLevel` int unsigned NOT NULL DEFAULT '0',
  `RewSpell` mediumint unsigned NOT NULL DEFAULT '0',
  `RewSpellCast` mediumint unsigned NOT NULL DEFAULT '0',
  `RewMailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `RewMailDelaySecs` int unsigned NOT NULL DEFAULT '0',
  `PointMapId` smallint unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` mediumint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote1` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `IncompleteEmote` smallint unsigned NOT NULL DEFAULT '0',
  `IncompleteEmoteDelay` int unsigned NOT NULL DEFAULT '0',
  `CompleteEmote` smallint unsigned NOT NULL DEFAULT '0',
  `CompleteEmoteDelay` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questgiver_greeting`
--

DROP TABLE IF EXISTS `questgiver_greeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questgiver_greeting` (
  `Entry` int unsigned NOT NULL COMMENT 'Entry of Questgiver',
  `Type` int unsigned NOT NULL COMMENT 'Type of entry',
  `Text` longtext COMMENT 'Text of the greeting',
  `EmoteId` int unsigned NOT NULL COMMENT 'Emote ID of greeting',
  `EmoteDelay` int unsigned NOT NULL COMMENT 'Emote delay of the greeting',
  PRIMARY KEY (`Entry`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Quest and Gossip system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_loot_template`
--

DROP TABLE IF EXISTS `reference_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_loot_template_names`
--

DROP TABLE IF EXISTS `reference_loot_template_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_loot_template_names` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Reference Loot Template Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_reward_rate`
--

DROP TABLE IF EXISTS `reputation_reward_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_spillover_template`
--

DROP TABLE IF EXISTS `reputation_spillover_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_spillover_template` (
  `faction` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max rank, above this will not give any spillover',
  `faction2` smallint unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint unsigned NOT NULL DEFAULT '0',
  `faction3` smallint unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint unsigned NOT NULL DEFAULT '0',
  `faction4` smallint unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reserved_name`
--

DROP TABLE IF EXISTS `reserved_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `script_texts`
--

DROP TABLE IF EXISTS `script_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `script_texts` (
  `entry` mediumint NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `language` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` smallint unsigned NOT NULL DEFAULT '0',
  `broadcast_text_id` int NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `script_waypoint`
--

DROP TABLE IF EXISTS `script_waypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `script_waypoint` (
  `Entry` mediumint unsigned NOT NULL,
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `Point` mediumint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `WaitTime` int unsigned NOT NULL DEFAULT '0',
  `ScriptId` mediumint unsigned NOT NULL DEFAULT '0',
  `Comment` text,
  PRIMARY KEY (`Entry`,`PathId`,`Point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scripted_areatrigger`
--

DROP TABLE IF EXISTS `scripted_areatrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scripted_areatrigger` (
  `entry` mediumint NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scripted_event_id`
--

DROP TABLE IF EXISTS `scripted_event_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scripted_event_id` (
  `id` mediumint NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Script library scripted events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_discovery_template`
--

DROP TABLE IF EXISTS `skill_discovery_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_extra_item_template`
--

DROP TABLE IF EXISTS `skill_extra_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_fishing_base_level`
--

DROP TABLE IF EXISTS `skill_fishing_base_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Fishing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `comments` varchar(300) DEFAULT '',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spam_records`
--

DROP TABLE IF EXISTS `spam_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spam_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `record` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='REGEX Spam records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spawn_group`
--

DROP TABLE IF EXISTS `spawn_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawn_group` (
  `Id` int NOT NULL COMMENT 'Spawn Group ID',
  `Name` varchar(200) NOT NULL COMMENT 'Description of usage',
  `Type` int NOT NULL COMMENT 'Creature or GO spawn group',
  `MaxCount` int NOT NULL DEFAULT '0' COMMENT 'Maximum total count of all spawns in a group',
  `WorldState` int NOT NULL DEFAULT '0' COMMENT 'Worldstate which enables spawning of given group',
  `WorldStateExpression` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0' COMMENT 'Flags for various behaviour',
  `StringId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spawn_group_entry`
--

DROP TABLE IF EXISTS `spawn_group_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawn_group_entry` (
  `Id` int NOT NULL COMMENT 'Spawn Group ID',
  `Entry` int NOT NULL COMMENT 'Entry of creature or GO',
  `MinCount` int NOT NULL DEFAULT '0' COMMENT 'Minimum count of entry in a group before random',
  `MaxCount` int NOT NULL DEFAULT '0' COMMENT 'Maximum total count of entry in a group',
  `Chance` int NOT NULL DEFAULT '0' COMMENT 'Chance for entry to be selected',
  PRIMARY KEY (`Id`,`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spawn_group_formation`
--

DROP TABLE IF EXISTS `spawn_group_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawn_group_formation` (
  `Id` int NOT NULL,
  `FormationType` tinyint NOT NULL DEFAULT '0' COMMENT 'Formation shape 0..6',
  `FormationSpread` float(11,0) NOT NULL DEFAULT '0' COMMENT 'Distance between formation members',
  `FormationOptions` int NOT NULL DEFAULT '0' COMMENT 'Keep formation compact (bit 1)',
  `PathId` int NOT NULL,
  `MovementType` tinyint NOT NULL COMMENT 'Same as creature table',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spawn_group_linked_group`
--

DROP TABLE IF EXISTS `spawn_group_linked_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawn_group_linked_group` (
  `Id` int NOT NULL COMMENT 'Spawn Group ID',
  `LinkedId` int NOT NULL COMMENT 'Linked Spawn Group ID',
  PRIMARY KEY (`Id`,`LinkedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spawn_group_spawn`
--

DROP TABLE IF EXISTS `spawn_group_spawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spawn_group_spawn` (
  `Id` int NOT NULL COMMENT 'Spawn Group ID',
  `Guid` int NOT NULL COMMENT 'Guid of creature or GO',
  `SlotId` tinyint NOT NULL DEFAULT '-1' COMMENT '0 is the leader, -1 not part of the formation',
  `Chance` int unsigned NOT NULL DEFAULT '0' COMMENT 'Chance for a spawn to occur',
  PRIMARY KEY (`Id`,`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_affect`
--

DROP TABLE IF EXISTS `spell_affect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_affect` (
  `entry` smallint unsigned NOT NULL DEFAULT '0',
  `effectId` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`effectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_area` (
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint NOT NULL DEFAULT '0',
  `racemask` mediumint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_bonus_data` (
  `entry` smallint unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_chain`
--

DROP TABLE IF EXISTS `spell_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_chain` (
  `spell_id` mediumint NOT NULL DEFAULT '0',
  `prev_spell` mediumint NOT NULL DEFAULT '0',
  `first_spell` mediumint NOT NULL DEFAULT '0',
  `rank` tinyint NOT NULL DEFAULT '0',
  `req_spell` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_cone`
--

DROP TABLE IF EXISTS `spell_cone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_cone` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `ConeDegrees` int NOT NULL DEFAULT '60',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ported down from later versions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_elixir`
--

DROP TABLE IF EXISTS `spell_elixir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_elixir` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of potion',
  `mask` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_facing`
--

DROP TABLE IF EXISTS `spell_facing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_facing` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID',
  `facingcasterflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'flag for facing state, usually 1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint unsigned NOT NULL DEFAULT '0',
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_loot_template`
--

DROP TABLE IF EXISTS `spell_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_loot_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint NOT NULL DEFAULT '1',
  `maxcount` tinyint unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_proc_event` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` bigint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` bigint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` bigint unsigned NOT NULL DEFAULT '0',
  `procFlags` int unsigned NOT NULL DEFAULT '0',
  `procEx` int unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc_item_enchant`
--

DROP TABLE IF EXISTS `spell_proc_item_enchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_proc_item_enchant` (
  `entry` mediumint unsigned NOT NULL,
  `ppmRate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_script_target`
--

DROP TABLE IF EXISTS `spell_script_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_script_target` (
  `entry` mediumint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint unsigned NOT NULL DEFAULT '0',
  `inverseEffectMask` mediumint unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_scripts` (
  `Id` int NOT NULL COMMENT 'Spell ID',
  `ScriptName` char(64) NOT NULL COMMENT 'Core Spell Script Name',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_target_position`
--

DROP TABLE IF EXISTS `spell_target_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_target_position` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_template`
--

DROP TABLE IF EXISTS `spell_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_template` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `School` int unsigned NOT NULL DEFAULT '0',
  `Category` int unsigned NOT NULL DEFAULT '0',
  `CastUI` int unsigned NOT NULL DEFAULT '0',
  `Dispel` int unsigned NOT NULL DEFAULT '0',
  `Mechanic` int unsigned NOT NULL DEFAULT '0',
  `Attributes` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int unsigned NOT NULL DEFAULT '0',
  `Stances` int unsigned NOT NULL DEFAULT '0',
  `StancesNot` int unsigned NOT NULL DEFAULT '0',
  `Targets` int unsigned NOT NULL DEFAULT '0',
  `TargetCreatureType` int unsigned NOT NULL DEFAULT '0',
  `RequiresSpellFocus` int unsigned NOT NULL DEFAULT '0',
  `CasterAuraState` int unsigned NOT NULL DEFAULT '0',
  `TargetAuraState` int unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int unsigned NOT NULL DEFAULT '0',
  `RecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcChance` int unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int unsigned NOT NULL DEFAULT '0',
  `MaxLevel` int unsigned NOT NULL DEFAULT '0',
  `BaseLevel` int unsigned NOT NULL DEFAULT '0',
  `SpellLevel` int unsigned NOT NULL DEFAULT '0',
  `DurationIndex` int unsigned NOT NULL DEFAULT '0',
  `PowerType` int unsigned NOT NULL DEFAULT '0',
  `ManaCost` int unsigned NOT NULL DEFAULT '0',
  `ManaCostPerlevel` int unsigned NOT NULL DEFAULT '0',
  `ManaPerSecond` int unsigned NOT NULL DEFAULT '0',
  `ManaPerSecondPerLevel` int unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int unsigned NOT NULL DEFAULT '1',
  `Speed` float NOT NULL DEFAULT '0',
  `ModalNextSpell` int unsigned NOT NULL DEFAULT '0',
  `StackAmount` int unsigned NOT NULL DEFAULT '0',
  `Totem1` int unsigned NOT NULL DEFAULT '0',
  `Totem2` int unsigned NOT NULL DEFAULT '0',
  `Reagent1` int NOT NULL DEFAULT '0',
  `Reagent2` int NOT NULL DEFAULT '0',
  `Reagent3` int NOT NULL DEFAULT '0',
  `Reagent4` int NOT NULL DEFAULT '0',
  `Reagent5` int NOT NULL DEFAULT '0',
  `Reagent6` int NOT NULL DEFAULT '0',
  `Reagent7` int NOT NULL DEFAULT '0',
  `Reagent8` int NOT NULL DEFAULT '0',
  `ReagentCount1` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount2` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount3` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount4` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount5` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount6` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount7` int unsigned NOT NULL DEFAULT '0',
  `ReagentCount8` int unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int NOT NULL DEFAULT '0',
  `Effect1` int unsigned NOT NULL DEFAULT '0',
  `Effect2` int unsigned NOT NULL DEFAULT '0',
  `Effect3` int unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int NOT NULL DEFAULT '0',
  `EffectDieSides2` int NOT NULL DEFAULT '0',
  `EffectDieSides3` int NOT NULL DEFAULT '0',
  `EffectBaseDice1` int unsigned NOT NULL DEFAULT '0',
  `EffectBaseDice2` int unsigned NOT NULL DEFAULT '0',
  `EffectBaseDice3` int unsigned NOT NULL DEFAULT '0',
  `EffectDicePerLevel1` float NOT NULL DEFAULT '0',
  `EffectDicePerLevel2` float NOT NULL DEFAULT '0',
  `EffectDicePerLevel3` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int NOT NULL DEFAULT '0',
  `EffectBasePoints2` int NOT NULL DEFAULT '0',
  `EffectBasePoints3` int NOT NULL DEFAULT '0',
  `EffectMechanic1` int unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` int unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` int unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude2` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude3` int unsigned NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectChainTarget1` int unsigned NOT NULL DEFAULT '0',
  `EffectChainTarget2` int unsigned NOT NULL DEFAULT '0',
  `EffectChainTarget3` int unsigned NOT NULL DEFAULT '0',
  `EffectItemType1` int unsigned NOT NULL DEFAULT '0',
  `EffectItemType2` int unsigned NOT NULL DEFAULT '0',
  `EffectItemType3` int unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue1` int NOT NULL DEFAULT '0',
  `EffectMiscValue2` int NOT NULL DEFAULT '0',
  `EffectMiscValue3` int NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int unsigned NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint1` float NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint2` float NOT NULL DEFAULT '0',
  `EffectPointsPerComboPoint3` float NOT NULL DEFAULT '0',
  `SpellVisual` int unsigned NOT NULL DEFAULT '0',
  `SpellIconID` int unsigned NOT NULL DEFAULT '0',
  `ActiveIconID` int unsigned NOT NULL DEFAULT '0',
  `SpellPriority` int unsigned NOT NULL DEFAULT '0',
  `SpellName` text NOT NULL,
  `SpellName2` text,
  `SpellName3` text,
  `SpellName4` text,
  `SpellName5` text,
  `SpellName6` text,
  `SpellName7` text,
  `SpellName8` text,
  `Rank1` text,
  `Rank2` text,
  `Rank3` text,
  `Rank4` text,
  `Rank5` text,
  `Rank6` text,
  `Rank7` text,
  `Rank8` text,
  `ManaCostPercentage` int unsigned NOT NULL DEFAULT '0',
  `StartRecoveryCategory` int unsigned NOT NULL DEFAULT '0',
  `StartRecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags` bigint unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int unsigned NOT NULL DEFAULT '0',
  `DmgClass` int unsigned NOT NULL DEFAULT '0',
  `PreventionType` int unsigned NOT NULL DEFAULT '0',
  `StanceBarOrder` int NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `MinFactionId` int unsigned NOT NULL DEFAULT '0',
  `MinReputation` int unsigned NOT NULL DEFAULT '0',
  `RequiredAuraVision` int unsigned NOT NULL DEFAULT '0',
  `IsServerSide` int unsigned NOT NULL DEFAULT '0',
  `AttributesServerside` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Export of .dbc Spell.dbc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_threat` (
  `entry` mediumint unsigned NOT NULL,
  `Threat` smallint NOT NULL,
  `multiplier` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `ap_bonus` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `string_id`
--

DROP TABLE IF EXISTS `string_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `string_id` (
  `Id` int unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxi_shortcuts`
--

DROP TABLE IF EXISTS `taxi_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxi_shortcuts` (
  `pathid` int unsigned NOT NULL COMMENT 'Flight path entry id',
  `takeoff` int unsigned NOT NULL COMMENT 'Amount of waypoints to skip in the beginning of the flight',
  `landing` int unsigned NOT NULL COMMENT 'Amount of waypoints to skip at the end of the flight',
  `comments` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pathid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Taxi System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trainer_greeting`
--

DROP TABLE IF EXISTS `trainer_greeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_greeting` (
  `Entry` int unsigned NOT NULL COMMENT 'Entry of Trainer',
  `Text` longtext COMMENT 'Text of the greeting',
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='Trainer system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Transports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit_condition`
--

DROP TABLE IF EXISTS `unit_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_condition` (
  `Id` int NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Variable_0` int unsigned NOT NULL DEFAULT '0',
  `Variable_1` int unsigned NOT NULL DEFAULT '0',
  `Variable_2` int unsigned NOT NULL DEFAULT '0',
  `Variable_3` int unsigned NOT NULL DEFAULT '0',
  `Variable_4` int unsigned NOT NULL DEFAULT '0',
  `Variable_5` int unsigned NOT NULL DEFAULT '0',
  `Variable_6` int unsigned NOT NULL DEFAULT '0',
  `Variable_7` int unsigned NOT NULL DEFAULT '0',
  `Op_0` int unsigned NOT NULL DEFAULT '0',
  `Op_1` int unsigned NOT NULL DEFAULT '0',
  `Op_2` int unsigned NOT NULL DEFAULT '0',
  `Op_3` int unsigned NOT NULL DEFAULT '0',
  `Op_4` int unsigned NOT NULL DEFAULT '0',
  `Op_5` int unsigned NOT NULL DEFAULT '0',
  `Op_6` int unsigned NOT NULL DEFAULT '0',
  `Op_7` int unsigned NOT NULL DEFAULT '0',
  `Value_0` int NOT NULL DEFAULT '0',
  `Value_1` int NOT NULL DEFAULT '0',
  `Value_2` int NOT NULL DEFAULT '0',
  `Value_3` int NOT NULL DEFAULT '0',
  `Value_4` int NOT NULL DEFAULT '0',
  `Value_5` int NOT NULL DEFAULT '0',
  `Value_6` int NOT NULL DEFAULT '0',
  `Value_7` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_accessory`
--

DROP TABLE IF EXISTS `vehicle_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_accessory` (
  `vehicle_entry` int unsigned NOT NULL COMMENT 'entry of the npc who has some accessory as vehicle',
  `seat` mediumint unsigned NOT NULL COMMENT 'onto which seat shall the passenger be boarded',
  `accessory_entry` int unsigned NOT NULL COMMENT 'entry of the passenger that is to be boarded',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`vehicle_entry`,`seat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Vehicle Accessory (passengers that are auto-boarded onto a vehicle)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warden_scans`
--

DROP TABLE IF EXISTS `warden_scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warden_scans` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT '0',
  `str` text,
  `data` text,
  `address` int DEFAULT '0',
  `length` int DEFAULT '0',
  `result` tinytext NOT NULL,
  `flags` smallint unsigned NOT NULL,
  `comment` tinytext NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waypoint_path`
--

DROP TABLE IF EXISTS `waypoint_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waypoint_path` (
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `Point` mediumint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  `WaitTime` int unsigned NOT NULL DEFAULT '0',
  `ScriptId` mediumint unsigned NOT NULL DEFAULT '0',
  `Comment` text,
  PRIMARY KEY (`PathId`,`Point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waypoint_path_name`
--

DROP TABLE IF EXISTS `waypoint_path_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waypoint_path_name` (
  `PathId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Path ID for entry',
  `Name` varchar(300) NOT NULL COMMENT 'Description of usage',
  PRIMARY KEY (`PathId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_safe_locs`
--

DROP TABLE IF EXISTS `world_safe_locs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_safe_locs` (
  `id` int unsigned NOT NULL,
  `map` int unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_template`
--

DROP TABLE IF EXISTS `world_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_template` (
  `map` smallint unsigned NOT NULL,
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldstate_expression`
--

DROP TABLE IF EXISTS `worldstate_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldstate_expression` (
  `Id` int NOT NULL,
  `Expression` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worldstate_name`
--

DROP TABLE IF EXISTS `worldstate_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worldstate_name` (
  `Id` int NOT NULL COMMENT 'Worldstate variable Id',
  `Name` varchar(200) NOT NULL COMMENT 'Name and use of variable',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 19:02:59
