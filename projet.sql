-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u5
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 13 Juin 2019 à 13:39
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
`numConcours` int(5) NOT NULL,
  `refPresident` int(5) NOT NULL,
  `etat` enum('pas commence','en cours','attente','evalue') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Dessin`
--

CREATE TABLE IF NOT EXISTS `Dessin` (
`numDessin` int(5) NOT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci,
  `leDessin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `classement` int(2) DEFAULT NULL,
  `refConcours` int(5) NOT NULL,
  `refUtilisateur` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Evaluation`
--

CREATE TABLE IF NOT EXISTS `Evaluation` (
  `refDessin` int(5) NOT NULL,
  `refUtilisateur` int(5) NOT NULL,
  `dateEvaluation` date DEFAULT NULL,
  `note` int(2) DEFAULT NULL,
  `commentaire` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Jury`
--

CREATE TABLE IF NOT EXISTS `Jury` (
  `refUtilisateur` int(5) NOT NULL,
  `refConcours` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Participe`
--

CREATE TABLE IF NOT EXISTS `Participe` (
  `refUtilisateur` int(5) NOT NULL,
  `refConcours` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
`numUtilisateur` int(5) NOT NULL,
  `nom` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motDePasse` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`numUtilisateur`, `nom`, `prenom`, `adresse`, `login`, `motDePasse`) VALUES
(1, 'admin', 'admin', 'eseo', 'admin', 'admin'),
(2, 'de la fouchardiere', 'constantin', 'angers', 'delafoco', 'delafoco\r\n');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Concours`
--
ALTER TABLE `Concours`
 ADD PRIMARY KEY (`numConcours`), ADD KEY `refPresident` (`refPresident`);

--
-- Index pour la table `Dessin`
--
ALTER TABLE `Dessin`
 ADD PRIMARY KEY (`numDessin`), ADD KEY `refConcours` (`refConcours`), ADD KEY `refUtilisateur` (`refUtilisateur`);

--
-- Index pour la table `Evaluation`
--
ALTER TABLE `Evaluation`
 ADD PRIMARY KEY (`refDessin`,`refUtilisateur`), ADD KEY `refUtilisateur` (`refUtilisateur`);

--
-- Index pour la table `Jury`
--
ALTER TABLE `Jury`
 ADD PRIMARY KEY (`refUtilisateur`,`refConcours`), ADD KEY `refConcours` (`refConcours`);

--
-- Index pour la table `Participe`
--
ALTER TABLE `Participe`
 ADD PRIMARY KEY (`refUtilisateur`,`refConcours`), ADD KEY `refConcours` (`refConcours`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
 ADD PRIMARY KEY (`numUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Concours`
--
ALTER TABLE `Concours`
MODIFY `numConcours` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Dessin`
--
ALTER TABLE `Dessin`
MODIFY `numDessin` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
MODIFY `numUtilisateur` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1299;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Concours`
--
ALTER TABLE `Concours`
ADD CONSTRAINT `Concours_ibfk_1` FOREIGN KEY (`refPresident`) REFERENCES `Utilisateur` (`numUtilisateur`);

--
-- Contraintes pour la table `Dessin`
--
ALTER TABLE `Dessin`
ADD CONSTRAINT `Dessin_ibfk_1` FOREIGN KEY (`refConcours`) REFERENCES `Concours` (`numConcours`),
ADD CONSTRAINT `Dessin_ibfk_2` FOREIGN KEY (`refUtilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`);

--
-- Contraintes pour la table `Evaluation`
--
ALTER TABLE `Evaluation`
ADD CONSTRAINT `Evaluation_ibfk_1` FOREIGN KEY (`refDessin`) REFERENCES `Dessin` (`numDessin`),
ADD CONSTRAINT `Evaluation_ibfk_2` FOREIGN KEY (`refUtilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`);

--
-- Contraintes pour la table `Jury`
--
ALTER TABLE `Jury`
ADD CONSTRAINT `Jury_ibfk_1` FOREIGN KEY (`refUtilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`),
ADD CONSTRAINT `Jury_ibfk_2` FOREIGN KEY (`refConcours`) REFERENCES `Concours` (`numConcours`);

--
-- Contraintes pour la table `Participe`
--
ALTER TABLE `Participe`
ADD CONSTRAINT `Participe_ibfk_1` FOREIGN KEY (`refUtilisateur`) REFERENCES `Utilisateur` (`numUtilisateur`),
ADD CONSTRAINT `Participe_ibfk_2` FOREIGN KEY (`refConcours`) REFERENCES `Concours` (`numConcours`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
