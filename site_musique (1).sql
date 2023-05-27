-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 09 déc. 2022 à 16:24
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_musique`
--

-- --------------------------------------------------------

--
-- Structure de la table `all_commande`
--

DROP TABLE IF EXISTS `all_commande`;
CREATE TABLE IF NOT EXISTS `all_commande` (
  `ALL_CMD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALL_CMD_USER_ID` int(11) NOT NULL,
  `ALL_CMD_DATE` date NOT NULL,
  `ALL_CMD_PRIX_TOTAL` int(11) NOT NULL,
  PRIMARY KEY (`ALL_CMD_ID`),
  KEY `BDC_USER-ID` (`ALL_CMD_USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `all_commande`
--

INSERT INTO `all_commande` (`ALL_CMD_ID`, `ALL_CMD_USER_ID`, `ALL_CMD_DATE`, `ALL_CMD_PRIX_TOTAL`) VALUES
(1, 2, '2022-12-09', 40);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLE_NAME` varchar(100) NOT NULL,
  `ARTICLE_CONTENT` varchar(250) NOT NULL,
  `ARTICLE_AUTOR` int(100) DEFAULT NULL,
  `ARTICLE_DATE` date DEFAULT NULL,
  `ARTICLE_CAT` int(11) DEFAULT NULL,
  `ARTICLE_COMMENT` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ARTICLE_ID`),
  KEY `ARTICLE_CAT` (`ARTICLE_CAT`),
  KEY `ARTICLE_AUTOR` (`ARTICLE_AUTOR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ARTICLE_ID`, `ARTICLE_NAME`, `ARTICLE_CONTENT`, `ARTICLE_AUTOR`, `ARTICLE_DATE`, `ARTICLE_CAT`, `ARTICLE_COMMENT`) VALUES
(1, 'article1', 'contenu1', NULL, NULL, 1, NULL),
(2, 'article2', 'contenu2', NULL, NULL, 2, NULL),
(3, 'article3', 'contenu3', NULL, NULL, 3, NULL),
(4, 'article4', 'contenu4', NULL, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `AUTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTOR_NAME` varchar(100) NOT NULL,
  `AUTOR_MAIL` varchar(100) NOT NULL,
  `AUTOR_PASSWORD` varchar(256) NOT NULL,
  PRIMARY KEY (`AUTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`AUTOR_ID`, `AUTOR_NAME`, `AUTOR_MAIL`, `AUTOR_PASSWORD`) VALUES
(1, 'aurelsan', 'aurelsan@', '1234'),
(2, 'metallica', '@', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `bon-de-commande`
--

DROP TABLE IF EXISTS `bon-de-commande`;
CREATE TABLE IF NOT EXISTS `bon-de-commande` (
  `COMMANDE_ID` int(11) NOT NULL,
  `ARTICLE_ID` int(11) NOT NULL,
  `BDC_QUANTITY` int(11) NOT NULL,
  `PRIT_UNITAIRE` int(11) NOT NULL,
  KEY `ARTICLE_ID` (`ARTICLE_ID`),
  KEY `COMMANDE_ID` (`COMMANDE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_CAT` varchar(100) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_NAME` (`CATEGORY_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`CATEGORY_ID`, `CATEGORY_CAT`) VALUES
(7, 'classique'),
(3, 'disco'),
(4, 'electro'),
(5, 'pop'),
(1, 'rap'),
(2, 'rock/metal'),
(8, 'soundtrack'),
(6, 'variété');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `RESERVATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `RESERVATION_QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`RESERVATION_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(100) NOT NULL,
  `USER_LASTNAME` varchar(100) DEFAULT NULL,
  `USER_MAIL` varchar(250) NOT NULL,
  `USER_DATE` date DEFAULT NULL,
  `USER_PASSWORD` varchar(256) NOT NULL,
  `USER_ROLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `USER_LASTNAME`, `USER_MAIL`, `USER_DATE`, `USER_PASSWORD`, `USER_ROLE`) VALUES
(1, 'bruce', 'wayne', 'wayne@', NULL, '1234', NULL),
(2, 'clark', 'kent', 'kent@', NULL, '1234', NULL),
(3, 'diana', 'prince', 'kent@', NULL, '1234', NULL),
(4, 'arthur', 'curry', 'curry@', NULL, '1234', NULL),
(5, 'john', 'stuart', 'gl@', NULL, '1234', NULL),
(6, 'barry', 'allen', 'flash@', NULL, '1234', NULL),
(7, 'leo', NULL, 'bidule@', NULL, '1234', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `all_commande`
--
ALTER TABLE `all_commande`
  ADD CONSTRAINT `all_commande_ibfk_1` FOREIGN KEY (`ALL_CMD_USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `DELETE_AUTOR` FOREIGN KEY (`ARTICLE_AUTOR`) REFERENCES `auteur` (`AUTOR_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `DELETE_CAT` FOREIGN KEY (`ARTICLE_CAT`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE SET NULL;

--
-- Contraintes pour la table `bon-de-commande`
--
ALTER TABLE `bon-de-commande`
  ADD CONSTRAINT `DELETE_COMMANDE` FOREIGN KEY (`COMMANDE_ID`) REFERENCES `all_commande` (`ALL_CMD_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `bon-de-commande_ibfk_1` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `article` (`ARTICLE_ID`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
