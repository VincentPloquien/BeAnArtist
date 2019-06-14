-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 14 juin 2019 à 02:08
-- Version du serveur :  5.7.26
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `concours`
--

DROP TABLE IF EXISTS `concours`;
CREATE TABLE IF NOT EXISTS `concours` (
  `numConcours` int(11) NOT NULL AUTO_INCREMENT,
  `description` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `etat` enum('pas commencé','en cours','attente','évalué') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`numConcours`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `concours`
--

INSERT INTO `concours` (`numConcours`, `description`, `dateDebut`, `dateFin`, `etat`) VALUES
(1, 'l\'eau l\'été', '2018-06-01', '2018-08-31', 'en cours'),
(2, 'Le Bleu', '2019-05-20', '2019-07-04', 'en cours'),
(3, 'nature morte', '2019-01-15', '2019-02-28', 'en cours'),
(17, 'test', '2019-06-05', '2019-06-27', 'en cours');

-- --------------------------------------------------------

--
-- Structure de la table `dessin`
--

DROP TABLE IF EXISTS `dessin`;
CREATE TABLE IF NOT EXISTS `dessin` (
  `numDessin` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur` int(11) NOT NULL,
  `concours` int(11) NOT NULL,
  `commentaire` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `classement` int(11) DEFAULT NULL,
  `dateRemise` date NOT NULL,
  `leDessin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`numDessin`),
  KEY `utilisateur` (`utilisateur`),
  KEY `concours` (`concours`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dessin`
--

INSERT INTO `dessin` (`numDessin`, `utilisateur`, `concours`, `commentaire`, `classement`, `dateRemise`, `leDessin`) VALUES
(1, 2, 1, 'C1 - U2 - Dessin 1', 7, '2018-07-01', '<svg> DESSIN 1 </svg>'),
(2, 2, 1, 'C1 - U2 - Dessin 2', 5, '2018-07-03', '<svg> DESSIN 2 </svg>'),
(3, 2, 1, 'C1 - U2 - Dessin 3', 3, '2018-07-09', '<svg> DESSIN 3 </svg>'),
(4, 3, 1, 'C1 - U3 - Dessin 1', 2, '2018-08-01', '<svg> DESSIN 1 </svg>'),
(5, 3, 1, 'C1 - U3 - Dessin 2', 4, '2018-08-02', '<svg> DESSIN 2 </svg>'),
(6, 3, 1, 'C1 - U3 - Dessin 3', 8, '2018-08-20', '<svg> DESSIN 3 </svg>'),
(7, 4, 1, 'C1 - U4 - Dessin 1', 6, '2018-06-08', '<svg> DESSIN 1 </svg>'),
(8, 5, 1, 'C1 - U5 - Dessin 1', 1, '2018-06-14', '<svg> DESSIN 1 </svg>'),
(9, 10, 2, 'C2 - U10 - Dessin 1', NULL, '2019-05-23', '<svg> DESSIN 1 </svg>'),
(10, 10, 2, 'C2 - U10 - Dessin 2', NULL, '2019-05-24', '<svg> DESSIN 2 </svg>'),
(11, 10, 2, 'C2 - U10 - Dessin 3', NULL, '2019-05-28', '<svg> DESSIN 3 </svg>'),
(12, 9, 2, 'C2 - U9 - Dessin 1', NULL, '2019-06-02', '<svg> DESSIN 1 </svg>'),
(13, 9, 2, 'C2 - U9 - Dessin 2', NULL, '2019-07-01', '<svg> DESSIN 2 </svg>'),
(14, 6, 2, 'C2 - U6 - Dessin 1', NULL, '2019-06-18', '<svg> DESSIN 1 </svg>'),
(15, 2, 3, 'C1 - U2 - Dessin 1', 5, '2019-01-17', '<svg> DESSIN 1 </svg>'),
(16, 2, 3, 'C1 - U2 - Dessin 2', 2, '2019-01-18', '<svg> DESSIN 2 </svg>'),
(17, 2, 3, 'C1 - U2 - Dessin 3', 6, '2019-01-22', '<svg> DESSIN 3 </svg>'),
(18, 7, 3, 'C1 - U7 - Dessin 1', 3, '2019-01-16', '<svg> DESSIN 1 </svg>'),
(19, 7, 3, 'C1 - U7 - Dessin 2', 1, '2019-02-02', '<svg> DESSIN 2 </svg>'),
(20, 7, 3, 'C1 - U7 - Dessin 3', NULL, '2019-02-11', '<svg> DESSIN 3 </svg>'),
(21, 8, 3, 'C1 - U8 - Dessin 1', 4, '2019-01-28', '<svg> DESSIN 1 </svg>'),
(22, 8, 3, 'C1 - U8 - Dessin 2', NULL, '2019-02-04', '<svg> DESSIN 2 </svg>'),
(23, 9, 3, 'C1 - U9 - Dessin 1', NULL, '2019-02-08', '<svg> DESSIN 1 </svg>'),
(24, 9, 3, 'C1 - U9 - Dessin 2', NULL, '2019-02-16', '<svg> DESSIN 2 </svg>'),
(25, 10, 3, 'C1 - U10 - Dessin 1', NULL, '2019-02-27', '<svg> DESSIN 1 </svg>');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `utilisateur` int(11) NOT NULL,
  `dessin` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `commentaire` tinytext COLLATE utf8mb4_unicode_ci,
  `dateEvaluation` date DEFAULT NULL,
  PRIMARY KEY (`utilisateur`,`dessin`),
  KEY `dessin` (`dessin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`utilisateur`, `dessin`, `note`, `commentaire`, `dateEvaluation`) VALUES
(5, 15, 8, 'Bof', '2019-01-30'),
(5, 16, 15, 'Meh', '2019-01-30'),
(5, 17, 0, 'Disqualifié', '2019-02-01'),
(5, 19, 19, 'Mon préféré <3', '2019-02-01'),
(5, 21, 8, 'Ca pourrait être pire...', '2019-02-02'),
(6, 15, 4, 'C\'est nul', '2019-02-01'),
(6, 16, 16, 'Ca c\'est beau !', '2019-02-04'),
(6, 18, 10, NULL, '2019-02-02'),
(7, 1, 5, 'Bof', '2018-09-10'),
(7, 2, 10, 'Moyen', '2018-09-10'),
(7, 3, 11, 'Mieux', '2018-09-10'),
(7, 4, 14, 'Pas mal !', '2018-09-10'),
(7, 5, 11, 'Beaucoup moins bien', '2018-09-10'),
(7, 6, 0, 'Nul', '2018-09-10'),
(7, 7, 15, 'J\'adore (moins quelques points car hors sujet mais chut)', '2018-09-10'),
(7, 8, 20, 'Du génie', '2018-09-10'),
(8, 1, 6, 'Bof mouais', '2018-09-17'),
(8, 2, 9, 'Moyen bof', '2018-09-17'),
(8, 3, 11, 'Mieux', '2018-09-17'),
(8, 4, 16, 'Du joli travail', '2018-09-17'),
(8, 5, 10, 'Bah qu\'est-ce qu\'il se passe ?', '2018-09-17'),
(8, 6, 1, 'Pas au niveau', '2018-09-17'),
(8, 7, 3, 'Hors sujet', '2018-09-17'),
(8, 8, 20, 'Merveilleux', '2018-09-17');

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `utilisateur` int(11) NOT NULL,
  `concours` int(11) NOT NULL,
  `role` enum('président','jury','compétiteur') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`utilisateur`,`concours`),
  KEY `concours` (`concours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`utilisateur`, `concours`, `role`) VALUES
(1, 1, 'président'),
(1, 2, 'président'),
(1, 3, 'président'),
(2, 1, 'compétiteur'),
(2, 2, 'jury'),
(2, 3, 'compétiteur'),
(2, 17, 'compétiteur'),
(3, 1, 'compétiteur'),
(3, 2, 'jury'),
(4, 1, 'compétiteur'),
(4, 2, 'compétiteur'),
(5, 1, 'compétiteur'),
(5, 2, 'compétiteur'),
(5, 3, 'jury'),
(6, 1, 'compétiteur'),
(6, 2, 'compétiteur'),
(6, 3, 'jury'),
(7, 1, 'jury'),
(7, 3, 'compétiteur'),
(8, 1, 'jury'),
(8, 3, 'compétiteur'),
(9, 2, 'compétiteur'),
(9, 3, 'compétiteur'),
(10, 2, 'compétiteur'),
(10, 3, 'compétiteur'),
(43, 2, 'compétiteur'),
(43, 17, 'président');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `numUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motDePasse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numUtilisateur`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`numUtilisateur`, `nom`, `prenom`, `adresse`, `login`, `motDePasse`, `estAdmin`) VALUES
(1, 'Ploquien', 'Vincent', NULL, 'admin', 'network', 1),
(2, 'Test', 'Didié', NULL, 'test0', 'test', 0),
(3, 'Test', 'Lucas', NULL, 'test1', 'test', 0),
(4, 'Test', 'Roger', NULL, 'test2', 'test', 0),
(5, 'Test', 'David', NULL, 'test3', 'test', 0),
(6, 'Test', 'Marie', NULL, 'test4', 'test', 0),
(7, 'Test', 'Cindy', NULL, 'test5', 'test', 0),
(8, 'Test', 'Sarah', NULL, 'test6', 'test', 0),
(9, 'Test', 'Carol', NULL, 'test7', 'test', 0),
(10, 'Test', 'Nigau', NULL, 'test8', 'test', 0),
(11, 'Test', 'Marin', NULL, 'test9', 'test', 0),
(12, 'test', 'test', '', 'test', 'test', 1),
(43, 'Prévost', 'Thomas', '', 'tomtom', 'test', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dessin`
--
ALTER TABLE `dessin`
  ADD CONSTRAINT `Dessin_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `Dessin_ibfk_2` FOREIGN KEY (`concours`) REFERENCES `concours` (`numConcours`) ON DELETE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `Evaluation_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `Evaluation_ibfk_2` FOREIGN KEY (`dessin`) REFERENCES `dessin` (`numDessin`) ON DELETE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `Participation_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `Participation_ibfk_2` FOREIGN KEY (`concours`) REFERENCES `concours` (`numConcours`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
