-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für horrizon_rl
CREATE DATABASE IF NOT EXISTS `horrizon_rl` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `horrizon_rl`;

-- Exportiere Struktur von Tabelle horrizon_rl.account_data
CREATE TABLE IF NOT EXISTS `account_data` (
  `username` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `team_lv` varchar(255) DEFAULT NULL,
  `tutorial_played` varchar(255) DEFAULT NULL,
  `whitelisted` int(255) DEFAULT NULL,
  `banned` int(255) DEFAULT NULL,
  `lastlogout` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle horrizon_rl.account_data: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_data` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle horrizon_rl.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `modelid` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `rot` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle horrizon_rl.player_vehicles: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle horrizon_rl.server_atm
CREATE TABLE IF NOT EXISTS `server_atm` (
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `rot` int(11) DEFAULT NULL,
  `destructable` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle horrizon_rl.server_atm: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `server_atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_atm` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle horrizon_rl.server_settings
CREATE TABLE IF NOT EXISTS `server_settings` (
  `mode_whitelist` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle horrizon_rl.server_settings: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
REPLACE INTO `server_settings` (`mode_whitelist`) VALUES
	(0);
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle horrizon_rl.server_trader
CREATE TABLE IF NOT EXISTS `server_trader` (
  `skinid` int(11) DEFAULT NULL,
  `blipid` int(11) DEFAULT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `rot` int(11) DEFAULT NULL,
  `godmode` int(11) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `identifyer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle horrizon_rl.server_trader: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `server_trader` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_trader` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
