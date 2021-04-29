-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 29 avr. 2021 à 08:37
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `it_training`
--

-- --------------------------------------------------------

--
-- Structure de la table `tbl_attendance`
--

DROP TABLE IF EXISTS `tbl_attendance`;
CREATE TABLE IF NOT EXISTS `tbl_attendance` (
  `pk_attendance` int(11) NOT NULL AUTO_INCREMENT,
  `fk_attendance_user` int(11) NOT NULL,
  `fk_attendance_session` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_present` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_attendance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_blame`
--

DROP TABLE IF EXISTS `tbl_blame`;
CREATE TABLE IF NOT EXISTS `tbl_blame` (
  `pk_blame` int(11) NOT NULL AUTO_INCREMENT,
  `fk_blame_trainer` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_blame`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_client`
--

DROP TABLE IF EXISTS `tbl_client`;
CREATE TABLE IF NOT EXISTS `tbl_client` (
  `pk_client` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_course`
--

DROP TABLE IF EXISTS `tbl_course`;
CREATE TABLE IF NOT EXISTS `tbl_course` (
  `pk_course` int(11) NOT NULL AUTO_INCREMENT,
  `fk_course_plan` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `program` text COLLATE utf8_bin NOT NULL,
  `certification` varchar(255) COLLATE utf8_bin NOT NULL,
  `audience` varchar(255) COLLATE utf8_bin NOT NULL,
  `lenght` varchar(255) COLLATE utf8_bin NOT NULL,
  `finance` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_grade`
--

DROP TABLE IF EXISTS `tbl_grade`;
CREATE TABLE IF NOT EXISTS `tbl_grade` (
  `pk_grade` int(11) NOT NULL AUTO_INCREMENT,
  `fk_grade_user` int(11) NOT NULL,
  `fk_grade_trainer` int(11) NOT NULL,
  `fk_grade_session` int(11) NOT NULL,
  `fk_grade_issue` int(11) NOT NULL,
  PRIMARY KEY (`pk_grade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_invoice`
--

DROP TABLE IF EXISTS `tbl_invoice`;
CREATE TABLE IF NOT EXISTS `tbl_invoice` (
  `pk_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `fk_invoice_client` int(11) NOT NULL,
  `fk_invoice_course` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_invoice_user` int(11) NOT NULL,
  PRIMARY KEY (`pk_invoice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_invoice_dt`
--

DROP TABLE IF EXISTS `tbl_invoice_dt`;
CREATE TABLE IF NOT EXISTS `tbl_invoice_dt` (
  `pk_invoice_dt` int(11) NOT NULL AUTO_INCREMENT,
  `nb_participants` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`pk_invoice_dt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_issue`
--

DROP TABLE IF EXISTS `tbl_issue`;
CREATE TABLE IF NOT EXISTS `tbl_issue` (
  `pk_issue` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_issue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_plan`
--

DROP TABLE IF EXISTS `tbl_plan`;
CREATE TABLE IF NOT EXISTS `tbl_plan` (
  `pk_plan` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_plan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_session`
--

DROP TABLE IF EXISTS `tbl_session`;
CREATE TABLE IF NOT EXISTS `tbl_session` (
  `pk_session` int(11) NOT NULL AUTO_INCREMENT,
  `fk_session_trainer` int(11) NOT NULL,
  `fk_session_course` int(11) NOT NULL,
  `fk_session_theme` int(11) NOT NULL,
  `is_remote` tinyint(1) NOT NULL,
  `room` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `is_ongoing` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk_session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_skill`
--

DROP TABLE IF EXISTS `tbl_skill`;
CREATE TABLE IF NOT EXISTS `tbl_skill` (
  `pk_skill` int(11) NOT NULL AUTO_INCREMENT,
  `fk_skill_trainer` int(11) NOT NULL,
  `fk_skill_theme` int(11) NOT NULL,
  `skill_exp` int(11) NOT NULL,
  PRIMARY KEY (`pk_skill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE IF NOT EXISTS `tbl_status` (
  `pk_status` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_theme`
--

DROP TABLE IF EXISTS `tbl_theme`;
CREATE TABLE IF NOT EXISTS `tbl_theme` (
  `pk_theme` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `parent_themes` varchar(255) COLLATE utf8_bin NOT NULL,
  `child_themes` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pk_theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_trainer`
--

DROP TABLE IF EXISTS `tbl_trainer`;
CREATE TABLE IF NOT EXISTS `tbl_trainer` (
  `pk_trainer` int(11) NOT NULL AUTO_INCREMENT,
  `fk_trainer_status` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `avg_grade` float NOT NULL,
  PRIMARY KEY (`pk_trainer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `pk_user` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user_status` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `fk_user_client` int(11) NOT NULL,
  PRIMARY KEY (`pk_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_warning`
--

DROP TABLE IF EXISTS `tbl_warning`;
CREATE TABLE IF NOT EXISTS `tbl_warning` (
  `pk_warning` int(11) NOT NULL AUTO_INCREMENT,
  `fk_warning_trainer` int(11) NOT NULL,
  `fk_warning_blame` int(11) NOT NULL,
  `fk_warning_issue` int(11) NOT NULL,
  PRIMARY KEY (`pk_warning`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tbl_wish`
--

DROP TABLE IF EXISTS `tbl_wish`;
CREATE TABLE IF NOT EXISTS `tbl_wish` (
  `pk_wish` int(11) NOT NULL AUTO_INCREMENT,
  `fk_wish_user` int(11) NOT NULL,
  `fk_wish_theme` int(11) NOT NULL,
  `is_granted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_wish`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
