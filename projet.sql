-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u5
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 13 Juin 2019 à 13:55
-- Version du serveur :  5.5.62-0+deb8u1
-- Version de PHP :  5.6.40-0+deb8u2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `Concours`
--

CREATE TABLE IF NOT EXISTS `Concours` (
`numConcours` int(11) NOT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `etat` enum('pas commencé','en cours','attente','évalué') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Concours`
--

INSERT INTO `Concours` (`numConcours`, `description`, `dateDebut`, `dateFin`, `etat`) VALUES
(1, 'l''eau l''été', '2018-06-01', '2018-08-31', 'évalué'),
(2, 'Le Bleu', '2019-05-20', '2019-07-04', 'en cours'),
(3, 'nature morte', '2019-01-15', '2019-02-28', 'attente'),
(17, 'test', '2019-06-05', '2019-06-27', 'pas commencé');

-- --------------------------------------------------------

--
-- Structure de la table `Dessin`
--

CREATE TABLE IF NOT EXISTS `Dessin` (
`numDessin` int(11) NOT NULL,
  `utilisateur` int(11) NOT NULL,
  `concours` int(11) NOT NULL,
  `commentaire` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `classement` int(11) DEFAULT NULL,
  `dateRemise` date NOT NULL,
  `leDessin` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Dessin`
--

INSERT INTO `Dessin` (`numDessin`, `utilisateur`, `concours`, `commentaire`, `classement`, `dateRemise`, `leDessin`) VALUES
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
-- Structure de la table `Evaluation`
--

CREATE TABLE IF NOT EXISTS `Evaluation` (
  `utilisateur` int(11) NOT NULL,
  `dessin` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `commentaire` tinytext COLLATE utf8mb4_unicode_ci,
  `dateEvaluation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Evaluation`
--

INSERT INTO `Evaluation` (`utilisateur`, `dessin`, `note`, `commentaire`, `dateEvaluation`) VALUES
(5, 15, 8, 'Bof', '2019-01-30'),
(5, 16, 15, 'Meh', '2019-01-30'),
(5, 17, 0, 'Disqualifié', '2019-02-01'),
(5, 19, 19, 'Mon préféré <3', '2019-02-01'),
(5, 21, 8, 'Ca pourrait être pire...', '2019-02-02'),
(6, 15, 4, 'C''est nul', '2019-02-01'),
(6, 16, 16, 'Ca c''est beau !', '2019-02-04'),
(6, 18, 10, NULL, '2019-02-02'),
(7, 1, 5, 'Bof', '2018-09-10'),
(7, 2, 10, 'Moyen', '2018-09-10'),
(7, 3, 11, 'Mieux', '2018-09-10'),
(7, 4, 14, 'Pas mal !', '2018-09-10'),
(7, 5, 11, 'Beaucoup moins bien', '2018-09-10'),
(7, 6, 0, 'Nul', '2018-09-10'),
(7, 7, 15, 'J''adore (moins quelques points car hors sujet mais chut)', '2018-09-10'),
(7, 8, 20, 'Du génie', '2018-09-10'),
(8, 1, 6, 'Bof mouais', '2018-09-17'),
(8, 2, 9, 'Moyen bof', '2018-09-17'),
(8, 3, 11, 'Mieux', '2018-09-17'),
(8, 4, 16, 'Du joli travail', '2018-09-17'),
(8, 5, 10, 'Bah qu''est-ce qu''il se passe ?', '2018-09-17'),
(8, 6, 1, 'Pas au niveau', '2018-09-17'),
(8, 7, 3, 'Hors sujet', '2018-09-17'),
(8, 8, 20, 'Merveilleux', '2018-09-17');

-- --------------------------------------------------------

--
-- Structure de la table `Participation`
--

CREATE TABLE IF NOT EXISTS `Participation` (
  `utilisateur` int(11) NOT NULL,
  `concours` int(11) NOT NULL,
  `role` enum('président','jury','compétiteur') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Participation`
--

INSERT INTO `Participation` (`utilisateur`, `concours`, `role`) VALUES
(1, 1, 'président'),
(1, 2, 'président'),
(1, 3, 'président'),
(2, 1, 'compétiteur'),
(2, 2, 'jury'),
(2, 3, 'compétiteur'),
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
(43, 17, 'président');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
`numUtilisateur` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motDePasse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`numUtilisateur`, `nom`, `prenom`, `adresse`, `login`, `motDePasse`, `estAdmin`) VALUES
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
-- Index pour les tables exportées
--

--
-- Index pour la table `Concours`
--
ALTER TABLE `Concours`
 ADD PRIMARY KEY (`numConcours`);

--
-- Index pour la table `Dessin`
--
ALTER TABLE `Dessin`
 ADD PRIMARY KEY (`numDessin`), ADD KEY `utilisateur` (`utilisateur`), ADD KEY `concours` (`concours`);

--
-- Index pour la table `Evaluation`
--
ALTER TABLE `Evaluation`
 ADD PRIMARY KEY (`utilisateur`,`dessin`), ADD KEY `dessin` (`dessin`);

--
-- Index pour la table `Participation`
--
ALTER TABLE `Participation`
 ADD PRIMARY KEY (`utilisateur`,`concours`), ADD KEY `concours` (`concours`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
 ADD PRIMARY KEY (`numUtilisateur`), ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Concours`
--
ALTER TABLE `Concours`
MODIFY `numConcours` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `Dessin`
--
ALTER TABLE `Dessin`
MODIFY `numDessin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
MODIFY `numUtilisateur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Dessin`
--
ALTER TABLE `Dessin`
ADD CONSTRAINT `Dessin_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
ADD CONSTRAINT `Dessin_ibfk_2` FOREIGN KEY (`concours`) REFERENCES `Concours` (`numConcours`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Evaluation`
--
ALTER TABLE `Evaluation`
ADD CONSTRAINT `Evaluation_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
ADD CONSTRAINT `Evaluation_ibfk_2` FOREIGN KEY (`dessin`) REFERENCES `Dessin` (`numDessin`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Participation`
--
ALTER TABLE `Participation`
ADD CONSTRAINT `Participation_ibfk_1` FOREIGN KEY (`utilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`) ON DELETE CASCADE,
ADD CONSTRAINT `Participation_ibfk_2` FOREIGN KEY (`concours`) REFERENCES `Concours` (`numConcours`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
