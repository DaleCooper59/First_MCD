-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 19 avr. 2021 à 09:19
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `oto`
--

-- --------------------------------------------------------

--
-- Structure de la table `accessories_and_option`
--

DROP TABLE IF EXISTS `accessories_and_option`;
CREATE TABLE IF NOT EXISTS `accessories_and_option` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_type` varchar(50) NOT NULL,
  `acc_unit_price` int(11) NOT NULL,
  `acc_quantity` int(11) NOT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_new` binary(1) NOT NULL,
  `car_used` binary(1) NOT NULL,
  `car_category` varchar(50) NOT NULL,
  `car_brand` varchar(50) NOT NULL,
  `car_model` varchar(50) NOT NULL,
  `car_unit_price` int(11) NOT NULL,
  `car_quantity` int(11) NOT NULL,
  `uni_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `uni_id` (`uni_id`),
  KEY `com_id` (`com_id`),
  KEY `acc_id` (`acc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

DROP TABLE IF EXISTS `commercial`;
CREATE TABLE IF NOT EXISTS `commercial` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_name` varchar(50) NOT NULL,
  `com_firstname` varchar(50) NOT NULL,
  `com_telephone` varchar(50) NOT NULL,
  `com_mail` varchar(50) NOT NULL,
  `com_department` varchar(50) NOT NULL,
  `con_SIRET` int(11) NOT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE KEY `com_telephone` (`com_telephone`),
  UNIQUE KEY `com_mail` (`com_mail`),
  KEY `con_SIRET` (`con_SIRET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `concession`
--

DROP TABLE IF EXISTS `concession`;
CREATE TABLE IF NOT EXISTS `concession` (
  `con_SIRET` int(11) NOT NULL AUTO_INCREMENT,
  `con_adress` varchar(50) NOT NULL,
  `con_telephone` varchar(50) NOT NULL,
  `con_mail` varchar(50) NOT NULL,
  `con_Zipcode` int(11) NOT NULL,
  `con_city` varchar(50) NOT NULL,
  PRIMARY KEY (`con_SIRET`),
  UNIQUE KEY `con_mail` (`con_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_adress` varchar(50) NOT NULL,
  `cus_Zipcode` int(11) NOT NULL,
  `cus_country` varchar(50) NOT NULL,
  `cus_password` varchar(50) NOT NULL,
  `cus_telephone` varchar(20) NOT NULL,
  `cus_mail` varchar(50) NOT NULL,
  `cus_add` datetime NOT NULL,
  `cus_update` datetime NOT NULL,
  `cus_licence` int(11) NOT NULL,
  PRIMARY KEY (`cus_id`),
  UNIQUE KEY `cus_password` (`cus_password`),
  UNIQUE KEY `cus_telephone` (`cus_telephone`),
  UNIQUE KEY `cus_mail` (`cus_mail`),
  UNIQUE KEY `cus_licence` (`cus_licence`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`cus_id`, `cus_name`, `cus_firstname`, `cus_adress`, `cus_Zipcode`, `cus_country`, `cus_password`, `cus_telephone`, `cus_mail`, `cus_add`, `cus_update`, `cus_licence`) VALUES
(1, 'Cooper', 'Dale', 'GRAND NORTHERN HOTEL', 1345, 'United States', '4684481dbh', '555-26458', 'dalecooper@gmail.com', '2021-03-12 12:45:23', '2021-04-03 09:25:01', 1508646),
(2, 'Michel', 'jean', 'ailleurs', 59000, 'France', 'hgeyr@gerh15', '0615489752', 'jmaper@gmail.com', '2021-02-06 12:45:23', '2021-04-03 09:25:01', 1645426);

-- --------------------------------------------------------

--
-- Structure de la table `maintain`
--

DROP TABLE IF EXISTS `maintain`;
CREATE TABLE IF NOT EXISTS `maintain` (
  `rep_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`rep_id`,`com_id`),
  KEY `com_id` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `order_`
--

DROP TABLE IF EXISTS `order_`;
CREATE TABLE IF NOT EXISTS `order_` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_shipAdress` varchar(80) NOT NULL,
  `ord_shipCity` varchar(30) NOT NULL,
  `ord_shipName` varchar(30) NOT NULL,
  `ord_shipZipcode` int(11) NOT NULL,
  `ord_shipRegion` varchar(50) NOT NULL,
  `ord_shipVia` int(11) NOT NULL,
  `ord_date` datetime NOT NULL,
  `ord_type_paiement` varchar(50) NOT NULL,
  `ord_paiementMethod` varchar(50) NOT NULL,
  `ord_shippedDate` datetime NOT NULL,
  `ord_dateReceipt` datetime NOT NULL,
  `ord_orderReceipt` varchar(50) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  PRIMARY KEY (`ord_id`),
  UNIQUE KEY `ord_orderReceipt` (`ord_orderReceipt`),
  KEY `cus_id` (`cus_id`),
  KEY `com_id` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `repair_and_maintenance`
--

DROP TABLE IF EXISTS `repair_and_maintenance`;
CREATE TABLE IF NOT EXISTS `repair_and_maintenance` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT,
  `rep_type` varchar(50) NOT NULL,
  `rep_unit_price` varchar(50) NOT NULL,
  `rep_quantity` int(11) NOT NULL,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `unit_in_stocks`
--

DROP TABLE IF EXISTS `unit_in_stocks`;
CREATE TABLE IF NOT EXISTS `unit_in_stocks` (
  `uni_id` int(11) NOT NULL AUTO_INCREMENT,
  `uni_serialNumber` int(11) NOT NULL,
  `uni_kilometers` int(11) NOT NULL,
  `uni_CT` varchar(50) NOT NULL,
  `uni_fiscal_power` int(11) NOT NULL,
  `uni_carburant` varchar(50) NOT NULL,
  `uni_assurance_date` datetime NOT NULL,
  PRIMARY KEY (`uni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`uni_id`) REFERENCES `unit_in_stocks` (`uni_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`com_id`) REFERENCES `commercial` (`com_id`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`acc_id`) REFERENCES `accessories_and_option` (`acc_id`);

--
-- Contraintes pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD CONSTRAINT `commercial_ibfk_1` FOREIGN KEY (`con_SIRET`) REFERENCES `concession` (`con_SIRET`);

--
-- Contraintes pour la table `maintain`
--
ALTER TABLE `maintain`
  ADD CONSTRAINT `maintain_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `repair_and_maintenance` (`rep_id`),
  ADD CONSTRAINT `maintain_ibfk_2` FOREIGN KEY (`com_id`) REFERENCES `commercial` (`com_id`);

--
-- Contraintes pour la table `order_`
--
ALTER TABLE `order_`
  ADD CONSTRAINT `order__ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`),
  ADD CONSTRAINT `order__ibfk_2` FOREIGN KEY (`com_id`) REFERENCES `commercial` (`com_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
