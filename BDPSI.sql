-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 22, 2020 at 12:14 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BDPSI`
--

-- --------------------------------------------------------

--
-- Table structure for table `Composante`
--

CREATE TABLE `Composante` (
  `id_composante` bigint(20) NOT NULL,
  `libelle_composante` varchar(255) DEFAULT NULL,
  `code_composante` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Composante`
--

INSERT INTO `Composante` (`id_composante`, `libelle_composante`, `code_composante`) VALUES
(1, 'Droit et Science Politique (DSP)', 'DSP'),
(2, 'Langues et Cultures Étrangères (LCE)', 'LCE'),
(3, 'Philosophie, Information-Communication, Langage, Littérature, Arts du Spectacle (PHILLIA)', 'PHILLIA'),
(4, 'Sciences Économiques, Gestion, Mathématiques, Informatique (SEGMI)', 'SEGMI'),
(5, 'Systèmes Industriels et Techniques de Communication (SITEC)', 'SITEC'),
(6, 'Sciences Psychologiques et Sciences de l\'Éducation (SPSE)', 'SPSE'),
(7, 'Sciences Sociales et Administration (SSA)', 'SSA'),
(8, 'Sciences et Techniques des Activités Physiques et Sportives (STAPS)', 'STAPS'),
(9, 'IUT Ville d\'Avray / Saint-Cloud / Nanterre', 'IUT'),
(10, 'Institut de Préparation à l\'Administration Générale (IPAG)', 'IPAG');

-- --------------------------------------------------------

--
-- Table structure for table `Cours`
--

CREATE TABLE `Cours` (
  `id_cours` bigint(20) NOT NULL,
  `libelle_cours` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Formation`
--

CREATE TABLE `Formation` (
  `id_formation` bigint(20) NOT NULL,
  `libelle_formation` varchar(255) DEFAULT NULL,
  `VET` varchar(255) DEFAULT NULL,
  `fid_composante` bigint(20) DEFAULT NULL,
  `fid_niveau` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Formation`
--

INSERT INTO `Formation` (`id_formation`, `libelle_formation`, `VET`, `fid_composante`, `fid_niveau`) VALUES
(1, 'Miage', NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Groupe`
--

CREATE TABLE `Groupe` (
  `id_groupe` bigint(20) NOT NULL,
  `libelle_groupe` varchar(255) DEFAULT NULL,
  `annee` varchar(255) DEFAULT NULL,
  `fid_formation` bigint(20) DEFAULT NULL,
  `fid_modalite` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Groupe`
--

INSERT INTO `Groupe` (`id_groupe`, `libelle_groupe`, `annee`, `fid_formation`, `fid_modalite`) VALUES
(1, NULL, '2019-2020', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Groupe_Individu`
--

CREATE TABLE `Groupe_Individu` (
  `fid_groupe` bigint(20) NOT NULL,
  `fid_individu` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `individu`
--

CREATE TABLE `individu` (
  `id_individu` bigint(20) NOT NULL,
  `annuaire` bigint(20) DEFAULT NULL,
  `nom_individu` varchar(255) DEFAULT NULL,
  `prenom_individu` varchar(255) DEFAULT NULL,
  `mail_individu` varchar(255) DEFAULT NULL,
  `tel_individu` varchar(255) DEFAULT NULL,
  `fid_type_individu` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Modalite`
--

CREATE TABLE `Modalite` (
  `id_modalite` bigint(20) NOT NULL,
  `libelle_modalite` varchar(255) DEFAULT NULL,
  `code_modalite` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Modalite`
--

INSERT INTO `Modalite` (`id_modalite`, `libelle_modalite`, `code_modalite`) VALUES
(1, 'Mixte', 'Mixte'),
(2, 'APP (Apprentissage)', 'APP'),
(3, 'FI (Formation initiale)', 'FI');

-- --------------------------------------------------------

--
-- Table structure for table `Niveau`
--

CREATE TABLE `Niveau` (
  `id_niveau` bigint(20) NOT NULL,
  `libelle_niveau` varchar(255) DEFAULT NULL,
  `code_niveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Niveau`
--

INSERT INTO `Niveau` (`id_niveau`, `libelle_niveau`, `code_niveau`) VALUES
(1, 'Licence 3', 'L3');

-- --------------------------------------------------------

--
-- Table structure for table `Salle`
--

CREATE TABLE `Salle` (
  `id_salle` bigint(20) NOT NULL,
  `numero_salle` bigint(20) DEFAULT NULL,
  `capacite_salle` bigint(20) DEFAULT NULL,
  `nb_postes` bigint(20) DEFAULT NULL,
  `projecteur` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Seance`
--

CREATE TABLE `Seance` (
  `id_seance` bigint(20) NOT NULL,
  `fid_salle` bigint(20) DEFAULT NULL,
  `fid_type_seance` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Seance_Groupe`
--

CREATE TABLE `Seance_Groupe` (
  `date_debut_seance` datetime DEFAULT NULL,
  `date_fin_seance` datetime DEFAULT NULL,
  `fid_seance` bigint(20) NOT NULL,
  `fid_groupe` bigint(20) NOT NULL,
  `fid_individu` bigint(20) NOT NULL,
  `fid_cours` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Type_Individu`
--

CREATE TABLE `Type_Individu` (
  `id_type_individu` bigint(20) NOT NULL,
  `libelle_type_individu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Type_Seance`
--

CREATE TABLE `Type_Seance` (
  `id_type_seance` bigint(20) NOT NULL,
  `libelle_type_seance` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Composante`
--
ALTER TABLE `Composante`
  ADD PRIMARY KEY (`id_composante`);

--
-- Indexes for table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Indexes for table `Formation`
--
ALTER TABLE `Formation`
  ADD PRIMARY KEY (`id_formation`),
  ADD KEY `fid_composante` (`fid_composante`),
  ADD KEY `fid_niveau` (`fid_niveau`);

--
-- Indexes for table `Groupe`
--
ALTER TABLE `Groupe`
  ADD PRIMARY KEY (`id_groupe`),
  ADD KEY `fid_formation` (`fid_formation`),
  ADD KEY `fid_modalite` (`fid_modalite`);

--
-- Indexes for table `Groupe_Individu`
--
ALTER TABLE `Groupe_Individu`
  ADD PRIMARY KEY (`fid_groupe`,`fid_individu`),
  ADD KEY `fid_individu` (`fid_individu`);

--
-- Indexes for table `individu`
--
ALTER TABLE `individu`
  ADD PRIMARY KEY (`id_individu`),
  ADD KEY `fid_type_individu` (`fid_type_individu`);

--
-- Indexes for table `Modalite`
--
ALTER TABLE `Modalite`
  ADD PRIMARY KEY (`id_modalite`);

--
-- Indexes for table `Niveau`
--
ALTER TABLE `Niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Indexes for table `Salle`
--
ALTER TABLE `Salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Indexes for table `Seance`
--
ALTER TABLE `Seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `fid_salle` (`fid_salle`),
  ADD KEY `fid_type_seance` (`fid_type_seance`);

--
-- Indexes for table `Seance_Groupe`
--
ALTER TABLE `Seance_Groupe`
  ADD PRIMARY KEY (`fid_seance`,`fid_groupe`,`fid_individu`,`fid_cours`),
  ADD KEY `fid_groupe` (`fid_groupe`),
  ADD KEY `fid_individu` (`fid_individu`),
  ADD KEY `fid_cours` (`fid_cours`);

--
-- Indexes for table `Type_Individu`
--
ALTER TABLE `Type_Individu`
  ADD PRIMARY KEY (`id_type_individu`);

--
-- Indexes for table `Type_Seance`
--
ALTER TABLE `Type_Seance`
  ADD PRIMARY KEY (`id_type_seance`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Composante`
--
ALTER TABLE `Composante`
  MODIFY `id_composante` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Cours`
--
ALTER TABLE `Cours`
  MODIFY `id_cours` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Formation`
--
ALTER TABLE `Formation`
  MODIFY `id_formation` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Groupe`
--
ALTER TABLE `Groupe`
  MODIFY `id_groupe` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Modalite`
--
ALTER TABLE `Modalite`
  MODIFY `id_modalite` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Niveau`
--
ALTER TABLE `Niveau`
  MODIFY `id_niveau` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Salle`
--
ALTER TABLE `Salle`
  MODIFY `id_salle` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Seance`
--
ALTER TABLE `Seance`
  MODIFY `id_seance` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Type_Seance`
--
ALTER TABLE `Type_Seance`
  MODIFY `id_type_seance` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Formation`
--
ALTER TABLE `Formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`fid_composante`) REFERENCES `Composante` (`id_composante`),
  ADD CONSTRAINT `formation_ibfk_2` FOREIGN KEY (`fid_niveau`) REFERENCES `Formation` (`id_formation`);

--
-- Constraints for table `Groupe`
--
ALTER TABLE `Groupe`
  ADD CONSTRAINT `groupe_ibfk_1` FOREIGN KEY (`fid_formation`) REFERENCES `Formation` (`id_formation`),
  ADD CONSTRAINT `groupe_ibfk_2` FOREIGN KEY (`fid_modalite`) REFERENCES `Modalite` (`id_modalite`);

--
-- Constraints for table `Groupe_Individu`
--
ALTER TABLE `Groupe_Individu`
  ADD CONSTRAINT `groupe_individu_ibfk_1` FOREIGN KEY (`fid_groupe`) REFERENCES `Groupe` (`id_groupe`),
  ADD CONSTRAINT `groupe_individu_ibfk_2` FOREIGN KEY (`fid_individu`) REFERENCES `Individu` (`id_individu`);

--
-- Constraints for table `individu`
--
ALTER TABLE `individu`
  ADD CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`fid_type_individu`) REFERENCES `Type_Individu` (`id_type_individu`);

--
-- Constraints for table `Seance`
--
ALTER TABLE `Seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`fid_salle`) REFERENCES `Salle` (`id_salle`),
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`fid_type_seance`) REFERENCES `Type_Seance` (`id_type_seance`);

--
-- Constraints for table `Seance_Groupe`
--
ALTER TABLE `Seance_Groupe`
  ADD CONSTRAINT `seance_groupe_ibfk_1` FOREIGN KEY (`fid_seance`) REFERENCES `Seance` (`id_seance`),
  ADD CONSTRAINT `seance_groupe_ibfk_2` FOREIGN KEY (`fid_groupe`) REFERENCES `Groupe` (`id_groupe`),
  ADD CONSTRAINT `seance_groupe_ibfk_3` FOREIGN KEY (`fid_individu`) REFERENCES `Individu` (`id_individu`),
  ADD CONSTRAINT `seance_groupe_ibfk_4` FOREIGN KEY (`fid_cours`) REFERENCES `Cours` (`id_cours`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
