-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Mer 15 Avril 2020 à 23:56
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `BDPSI`
--

-- --------------------------------------------------------

--
-- Structure de la table `association_groupe`
--
CREATE DATABASE BDPSI;
USE BDPSI;


CREATE TABLE `association_groupe` (
  `id_association` int(11) NOT NULL,
  `fid_groupe_1` int(11) NOT NULL,
  `fid_groupe_2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `composante`
--

CREATE TABLE `composante` (
  `id_composante` bigint(20) NOT NULL,
  `libelle_composante` varchar(255) DEFAULT NULL,
  `code_composante` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `composante`
--

INSERT INTO `composante` (`id_composante`, `libelle_composante`, `code_composante`) VALUES
(1, 'Droit et Science Politique (DSP)', 'DSP'),
(2, 'Langues et Cultures Étrangères (LCE)', 'LCE'),
(3, 'Philosophie, Information-Communication, Langage, Littérature, Arts du Spectacle (PHILLIA)', 'PHILLIA'),
(4, 'Sciences Économiques, Gestion, Mathématiques, Informatique', 'SEGMI'),
(5, 'Systèmes Industriels et Techniques de Communication', 'SITEC'),
(6, 'Sciences Psychologiques et Sciences de l''Éducation (SPSE)', 'SPSE'),
(7, 'Sciences Sociales et Administration (SSA)', 'SSA'),
(8, 'Sciences et Techniques des Activités Physiques et Sportives (STAPS)', 'STAPS'),
(9, 'IUT Ville d''Avray / Saint-Cloud / Nanterre', 'IUT'),
(10, 'Institut de Préparation à l''Administration Générale (IPAG)', 'IPAG');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id_cours` bigint(20) NOT NULL,
  `libelle_cours` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id_formation` bigint(20) NOT NULL,
  `libelle_formation` varchar(255) DEFAULT NULL,
  `VET` varchar(255) DEFAULT NULL,
  `fid_composante` bigint(20) DEFAULT NULL,
  `code_formation` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`id_formation`, `libelle_formation`, `VET`, `fid_composante`, `code_formation`) VALUES
(1, 'Méthodes informatiques appliquées à la gestion des entreprises\r\n', NULL, 4, 'MIAGE'),
(2, 'Mathématiques et informatiques appliquées aux sciences humaines et sociales', NULL, 4, 'MIASHS');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` bigint(20) NOT NULL,
  `libelle_groupe` varchar(255) DEFAULT NULL,
  `fid_formation` bigint(20) DEFAULT NULL,
  `fid_modalite` bigint(20) DEFAULT NULL,
  `fid_niveau` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`id_groupe`, `libelle_groupe`, `fid_formation`, `fid_modalite`, `fid_niveau`) VALUES
(3, 'L3_MIAGE_APP', 1, 2, 3),
(4, 'L2_MIASHS', 2, 3, 2),
(9, 'L1_MIASHS', 2, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_individu`
--

CREATE TABLE `groupe_individu` (
  `fid_groupe` bigint(20) NOT NULL,
  `fid_individu` bigint(20) NOT NULL,
  `annee` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupe_individu`
--

INSERT INTO `groupe_individu` (`fid_groupe`, `fid_individu`, `annee`) VALUES
(3, 340007, 2019),
(3, 340008, 2019),
(3, 340009, 2019),
(3, 340010, 2019),
(3, 340011, 2019),
(3, 340015, 2020),
(3, 340016, 2020),
(3, 340017, 2020),
(3, 340020, 2019),
(3, 340021, 2019),
(3, 340022, 2019),
(3, 340023, 2019),
(3, 340024, 2019),
(3, 340025, 2019),
(3, 340026, 2019),
(4, 340001, 2019),
(4, 340002, 2019),
(4, 340003, 2019),
(4, 340004, 2019),
(4, 340005, 2019),
(4, 340006, 2019),
(4, 340012, 2020),
(4, 340013, 2020),
(4, 340014, 2020),
(4, 340018, 2020),
(4, 340019, 2020),
(9, 340027, 2020),
(9, 340028, 2020),
(9, 340029, 2020),
(9, 340030, 2020),
(9, 340031, 2020),
(9, 340032, 2020),
(9, 340033, 2019),
(9, 340034, 2019),
(9, 340035, 2019),
(9, 340036, 2019),
(9, 340037, 2019),
(9, 340038, 2019),
(9, 340039, 2019),
(9, 340040, 2019);

-- --------------------------------------------------------

--
-- Structure de la table `individu`
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

--
-- Contenu de la table `individu`
--

INSERT INTO `individu` (`id_individu`, `annuaire`, `nom_individu`, `prenom_individu`, `mail_individu`, `tel_individu`, `fid_type_individu`) VALUES
(404, 1, 'Non defini', 'Non defini', NULL, NULL, 1),
(34100, 1, 'LE ROUX', 'Annaig', NULL, NULL, 1),
(34101, 1, 'Bouchakhchoukha', 'Adel', NULL, NULL, 1),
(34102, 1, 'BELLINI', 'Béatrice', NULL, NULL, 1),
(34103, 1, 'Hardouin Ceccantini', 'Cécile', NULL, NULL, 1),
(34104, 1, 'Mesnager', 'Laurent', NULL, NULL, 1),
(34105, 1, 'Le Cun', 'Bertrand', NULL, NULL, 1),
(34106, 1, 'Hanen', 'Claire', NULL, NULL, 1),
(34107, 1, 'Guyon', 'Thomas', NULL, NULL, 1),
(34108, 1, 'Ben Hamida Mrabet', 'Sana', NULL, NULL, 1),
(34109, 1, 'Ikken', 'Sonia', NULL, NULL, 1),
(34110, 1, 'Gervais', 'Marie-Pierre', NULL, NULL, 1),
(34111, 1, 'Duvernet', 'Laurent', NULL, NULL, 1),
(34112, 1, 'Castillo_', 'Alberto', NULL, NULL, 1),
(34113, 1, 'Baarir', 'Souheib', NULL, NULL, 1),
(34114, 1, 'Delbot', 'François', NULL, NULL, 1),
(34115, 1, 'Azhar-Arnal', 'Juliette', NULL, NULL, 1),
(34116, 1, 'Rukoz-Castillo', 'Marta', NULL, NULL, 1),
(34117, 1, 'Legond-Aubry', 'Fabrice', NULL, NULL, 1),
(34118, 1, 'Quinio', 'Bernard', NULL, NULL, 1),
(34119, 1, 'Pradat-Peyre', 'Jean-François', NULL, NULL, 1),
(34120, 1, 'Ameur', 'Yannick', NULL, NULL, 1),
(34121, 1, 'Décallonne', 'Marc', NULL, NULL, 1),
(34122, 1, 'Dubois', 'Aloîs', NULL, NULL, 1),
(34123, 1, 'Duriez', 'Nathalie', NULL, NULL, 1),
(34124, 1, 'Florea', 'Paul', NULL, NULL, 1),
(34125, 1, 'Isoard', 'Thierry Michel', NULL, NULL, 1),
(34126, 1, 'Latif', 'Youssef', NULL, NULL, 1),
(34127, 1, 'Leloir', 'Nicole', NULL, NULL, 1),
(34128, 1, 'Novelli', 'Emmanuelle', NULL, NULL, 1),
(34129, 1, 'Pujol', 'Nicolas', NULL, NULL, 1),
(34130, 1, 'Renaud', 'Francis', NULL, NULL, 1),
(34131, 1, 'Serdoun', 'Samy', NULL, NULL, 1),
(34132, 1, 'Starck', 'Monia', NULL, NULL, 1),
(34133, 1, 'Thomas', 'Aurélie', NULL, NULL, 1),
(34134, 1, 'Tourvieille', 'Marc', NULL, NULL, 1),
(34135, 1, 'Zamfirou', 'Michel', NULL, NULL, 1),
(34136, 1, 'Zilova', 'Jana', NULL, NULL, 1),
(34137, 1, 'Menouer', 'Tarek', NULL, NULL, 1),
(34138, 1, 'Rodier', 'Lise', NULL, NULL, 1),
(34139, 1, 'Angarita Arocha', 'Rafael Enrique', NULL, NULL, 1),
(34140, 1, 'Ait Salaht', 'Farah', NULL, NULL, 1),
(34141, 1, 'Rousseau', 'Pierre', NULL, NULL, 1),
(34142, 1, 'Medjek', 'Sarah', NULL, NULL, 1),
(34143, 1, 'Guézou', 'Xavier', NULL, NULL, 1),
(34144, 1, 'D_Alfonso', 'Giovanna', NULL, NULL, 1),
(34145, 1, 'KELLOU-MENOUER', 'Kenza', NULL, NULL, 1),
(34146, 1, 'Oulhaci', 'Faiza', NULL, NULL, 1),
(34147, 1, 'Poizat', 'Pascal', NULL, NULL, 1),
(34148, 1, 'SADDEM', 'Rim ', NULL, NULL, 1),
(34149, 1, 'BENAMMAR', 'Nassima ', NULL, NULL, 1),
(34150, 1, 'ARFAOUI', 'Khadija', NULL, NULL, 1),
(34151, 1, 'Walter', 'Jean-Marc', NULL, NULL, 1),
(34152, 1, 'Bendraou', 'Reda', NULL, NULL, 1),
(34153, 1, 'Cojean', 'Bruno', NULL, NULL, 1),
(34154, 1, 'Abrantes', 'Pedro', NULL, NULL, 1),
(34155, 1, 'Zouari', 'Belhassen', NULL, NULL, 1),
(34156, 1, 'HOUHOU', 'Sara ', NULL, NULL, 1),
(34157, 1, 'GUEHIS-SAADAOUI', 'Sonia', NULL, NULL, 1),
(34158, 1, 'Hillah', 'Lom Messan', NULL, NULL, 1),
(34159, 1, 'Hmedeh', 'Zeinab', NULL, NULL, 1),
(34160, 1, 'Gherbi', 'Tahar', NULL, NULL, 1),
(34161, 1, 'Alaoui', 'Malek', NULL, NULL, 1),
(34163, 1, 'Pierre', 'Laurent', NULL, NULL, 1),
(34164, 1, 'Hyon', 'Emmanuel', NULL, NULL, 1),
(340001, 2, 'Ahmed', 'Noufeine', NULL, NULL, 2),
(340002, 2, 'Ait akli', 'Litissia', NULL, NULL, 2),
(340003, 2, 'Ba', 'Adja', NULL, NULL, 2),
(340004, 2, 'Binous', 'Wassim', NULL, NULL, 2),
(340005, 2, 'Bocoum', 'Idy', NULL, NULL, 2),
(340006, 2, 'Brochado', 'Alexandre', NULL, NULL, 2),
(340007, 2, 'Clebien', 'Nangninta', NULL, NULL, 2),
(340008, 2, 'Das', 'Rahul', NULL, NULL, 2),
(340009, 2, 'Elarj', 'Aniss', NULL, NULL, 2),
(340010, 2, 'Fall', 'Seynabou', NULL, NULL, 2),
(340011, 2, 'Jestin', 'Gabriel', NULL, NULL, 2),
(340012, 2, 'Keloute ndamukong', 'Ubald', NULL, NULL, 2),
(340013, 2, 'Khalfi', 'Sofian', NULL, NULL, 2),
(340014, 2, 'Le men', 'Yann', NULL, NULL, 2),
(340015, 2, 'Mboup', 'Gaye', NULL, NULL, 2),
(340016, 2, 'Mouzouri', 'Ilhame', NULL, NULL, 2),
(340017, 2, 'Ndiaye', 'Moussa', NULL, NULL, 2),
(340018, 2, 'Quellec', 'Nathan', NULL, NULL, 2),
(340019, 2, 'Rajaratnam', 'Sarujan', NULL, NULL, 2),
(340020, 2, 'Raypoulet', 'Hemanath', NULL, NULL, 2),
(340021, 2, 'Sakho', 'Assane', NULL, NULL, 2),
(340022, 2, 'Schauffler', 'Ophelie', NULL, NULL, 2),
(340023, 2, 'Si-mohammed', 'Samy', NULL, NULL, 2),
(340024, 2, 'Sidate', 'Alexis', NULL, NULL, 2),
(340025, 2, 'Zemali', 'Lynda', NULL, NULL, 2),
(340026, 2, 'Abalil', 'Rizlane', NULL, NULL, 2),
(340027, 2, 'Achou', 'Sara', NULL, NULL, 2),
(340028, 2, 'Akkoura', 'Aniesse', NULL, NULL, 2),
(340029, 2, 'Ali', 'Ikram-masjid', NULL, NULL, 2),
(340030, 2, 'Ali', 'Faiz', NULL, NULL, 2),
(340031, 2, 'Ali', 'Ikram-masjid', NULL, NULL, 2),
(340032, 2, 'Alouda', 'Lidao', NULL, NULL, 2),
(340033, 2, 'Alouda', 'Lidao', NULL, NULL, 2),
(340034, 2, 'Askar', 'Mohammad', NULL, NULL, 2),
(340035, 2, 'Auger', 'Antoine', NULL, NULL, 2),
(340036, 2, 'Auger', 'Antoine', NULL, NULL, 2),
(340037, 2, 'Balde', 'Mamadou saliou', NULL, NULL, 2),
(340038, 2, 'Baro', 'Mohamed', NULL, NULL, 2),
(340039, 2, 'Barolle', 'Romain', NULL, NULL, 2),
(340040, 2, 'Barolle', 'Romain', NULL, NULL, 2),
(340041, 2, 'Barry', 'Aissatou', NULL, NULL, 2),
(340042, 2, 'Belhaimeur', 'Mohamed', NULL, NULL, 2),
(340043, 2, 'Benaissa', 'Adam', NULL, NULL, 2),
(340044, 2, 'Benali', 'Ahmed', NULL, NULL, 2),
(340045, 2, 'Berte', 'Ulrich', NULL, NULL, 2),
(340046, 2, 'Berte', 'Ulrich', NULL, NULL, 2),
(340047, 2, 'Beyaz', 'Sefkan', NULL, NULL, 2),
(340048, 2, 'Bodart', 'Valentin', NULL, NULL, 2),
(340049, 2, 'Boucamus', 'Cassandra', NULL, NULL, 2),
(340050, 2, 'Boumaza', 'Karim', NULL, NULL, 2),
(340051, 2, 'Bouzekri', 'Ryan', NULL, NULL, 2),
(340052, 2, 'Bouzekri', 'Ryan', NULL, NULL, 2),
(340053, 2, 'Callet', 'Theo', NULL, NULL, 2),
(340054, 2, 'Callet', 'Theo', NULL, NULL, 2),
(340055, 2, 'Cazenave', 'Louis', NULL, NULL, 2),
(340056, 2, 'Chatillon', 'Julien', NULL, NULL, 2),
(340057, 2, 'Chatillon', 'Julien', NULL, NULL, 2),
(340058, 2, 'Chen', 'Juline', NULL, NULL, 2),
(340059, 2, 'Chen', 'Juline', NULL, NULL, 2),
(340060, 2, 'Crentsil', 'Robert', NULL, NULL, 2),
(340061, 2, 'Crentsil', 'Robert', NULL, NULL, 2),
(340062, 2, 'Dandeu', 'Tom', NULL, NULL, 2),
(340063, 2, 'Dandeu', 'Tom', NULL, NULL, 2),
(340064, 2, 'Delaporte', 'Lucie', NULL, NULL, 2),
(340065, 2, 'Delaporte', 'Lucie', NULL, NULL, 2),
(340066, 2, 'Diop', 'Maguette', NULL, NULL, 2),
(340067, 2, 'Djamaldine ben', 'Hadji', NULL, NULL, 2),
(340068, 2, 'Dubois', 'Dorian', NULL, NULL, 2),
(340069, 2, 'El amrani', 'Amine', NULL, NULL, 2),
(340070, 2, 'Esmel', 'Nome', NULL, NULL, 2),
(340071, 2, 'Fahim', 'Aymane', NULL, NULL, 2),
(340072, 2, 'Fekih', 'Kevin', NULL, NULL, 2),
(340073, 2, 'Feugier', 'Augustin', NULL, NULL, 2),
(340074, 2, 'Gac', 'Kevin', NULL, NULL, 2),
(340075, 2, 'Ganeshn', 'Haresh', NULL, NULL, 2),
(340076, 2, 'Gavalda', 'Clement', NULL, NULL, 2),
(340077, 2, 'Gilbert', 'Cyprien', NULL, NULL, 2),
(340078, 2, 'Gilbert', 'Cyprien', NULL, NULL, 2),
(340079, 2, 'Gorlicki', 'Paul', NULL, NULL, 2),
(340080, 2, 'Goyet', 'Camille', NULL, NULL, 2),
(340081, 2, 'Goyet', 'Camille', NULL, NULL, 2),
(340082, 2, 'Grandelaude', 'Mathias', NULL, NULL, 2),
(340083, 2, 'Hadjara', 'Celina', NULL, NULL, 2),
(340084, 2, 'Houhou', 'Sara', NULL, NULL, 2),
(340085, 2, 'Igoudjilene', 'Kenza', NULL, NULL, 2),
(340086, 2, 'Jalloh', 'Yusuf', NULL, NULL, 2),
(340087, 2, 'Jardin', 'Samy', NULL, NULL, 2),
(340088, 2, 'Jardin', 'Samy', NULL, NULL, 2),
(340089, 2, 'Jules', 'Julissa', NULL, NULL, 2),
(340090, 2, 'Kadi', 'Imane', NULL, NULL, 2),
(340091, 2, 'Kadri', 'Nassim', NULL, NULL, 2),
(340092, 2, 'Kende', 'Emmanuela', NULL, NULL, 2),
(340093, 2, 'Kouhafa', 'Latifa', NULL, NULL, 2),
(340094, 2, 'Lacom', 'Marveen', NULL, NULL, 2),
(340095, 2, 'Le', 'Phong sac', NULL, NULL, 2),
(340096, 2, 'Le lorier', 'Lucas', NULL, NULL, 2),
(340097, 2, 'Legendre', 'Angele', NULL, NULL, 2),
(340098, 2, 'Lemaza kunday ndjuka', 'Revelle', NULL, NULL, 2),
(340099, 2, 'Limbasse', 'Noemie', NULL, NULL, 2),
(340100, 2, 'Limbasse', 'Noemie', NULL, NULL, 2),
(340101, 2, 'Lin', 'Xinlei', NULL, NULL, 2),
(340102, 2, 'Louveau', 'Christophe', NULL, NULL, 2),
(340103, 2, 'Malinvaud', 'Paul', NULL, NULL, 2),
(340104, 2, 'Martin', 'Vanessa', NULL, NULL, 2),
(340105, 2, 'Medaoud', 'Salim', NULL, NULL, 2),
(340106, 2, 'Mousset', 'Pierre', NULL, NULL, 2),
(340107, 2, 'Mousset', 'Pierre', NULL, NULL, 2),
(340108, 2, 'Nanquette', 'Olivier', NULL, NULL, 2),
(340109, 2, 'Nanquette', 'Olivier', NULL, NULL, 2),
(340110, 2, 'Nass', 'Julien', NULL, NULL, 2),
(340111, 2, 'Nass', 'Julien', NULL, NULL, 2),
(340112, 2, 'Noursaid', 'Lahcen', NULL, NULL, 2),
(340113, 2, 'Oumbe oumbe', 'David', NULL, NULL, 2),
(340114, 2, 'Pires', 'Dany', NULL, NULL, 2),
(340115, 2, 'Pires', 'Dany', NULL, NULL, 2),
(340116, 2, 'Quenum', 'Heloise', NULL, NULL, 2),
(340117, 2, 'Quenum', 'Heloise', NULL, NULL, 2),
(340118, 2, 'Rageh', 'Nydel', NULL, NULL, 2),
(340119, 2, 'Rageh', 'Nydel', NULL, NULL, 2),
(340120, 2, 'Ripert', 'Alexandre', NULL, NULL, 2),
(340121, 2, 'Sadat', 'Halima', NULL, NULL, 2),
(340122, 2, 'Sardaoui', 'Amine', NULL, NULL, 2),
(340123, 2, 'Sereir', 'Zohra', NULL, NULL, 2),
(340124, 2, 'Sharma', 'Aurelien', NULL, NULL, 2),
(340125, 2, 'Sintes', 'Manon', NULL, NULL, 2),
(340126, 2, 'Smahi', 'Lydia', NULL, NULL, 2),
(340127, 2, 'Soleil', 'Emilie', NULL, NULL, 2),
(340128, 2, 'Soumare', 'Fatimata', NULL, NULL, 2),
(340129, 2, 'Sun', 'Jialei', NULL, NULL, 2),
(340130, 2, 'Tahir', 'Mohamed - imrane', NULL, NULL, 2),
(340131, 2, 'Tissot', 'Guilhem', NULL, NULL, 2),
(340132, 2, 'Tliba', 'Ahmed', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `modalite`
--

CREATE TABLE `modalite` (
  `id_modalite` bigint(20) NOT NULL,
  `libelle_modalite` varchar(255) DEFAULT NULL,
  `code_modalite` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `modalite`
--

INSERT INTO `modalite` (`id_modalite`, `libelle_modalite`, `code_modalite`) VALUES
(1, 'Mixte', 'Mixte'),
(2, 'Apprentissage', 'APP'),
(3, 'Formation initiale', 'FI'),
(4, 'Formation continue', 'FC'),
(5, 'Enseignement à distance', 'EAD'),
(6, 'Contrat de professionnalisation', 'CP');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` bigint(20) NOT NULL,
  `libelle_niveau` varchar(255) DEFAULT NULL,
  `code_niveau` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `libelle_niveau`, `code_niveau`) VALUES
(1, 'Licence 1', 'L1'),
(2, 'Licence 2', 'L2'),
(3, 'Licence 3', 'L3'),
(4, 'Master 1', 'M1'),
(5, 'Master 2', 'M2');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` bigint(20) NOT NULL,
  `numero_salle` varchar(200) DEFAULT NULL,
  `capacite_salle` bigint(20) DEFAULT NULL,
  `nb_postes` bigint(20) DEFAULT NULL,
  `projecteur` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `numero_salle`, `capacite_salle`, `nb_postes`, `projecteur`) VALUES
(1, 'G21', NULL, NULL, NULL),
(2, 'G203', NULL, NULL, NULL),
(3, 'FA', NULL, NULL, NULL),
(4, 'F103', NULL, NULL, NULL),
(5, 'E104', NULL, NULL, NULL),
(6, 'G101', NULL, NULL, NULL),
(7, 'F102', NULL, NULL, NULL),
(8, 'F103', NULL, NULL, NULL),
(9, 'G505', NULL, NULL, NULL),
(10, 'F404', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id_seance` bigint(20) NOT NULL,
  `fid_salle` bigint(20) DEFAULT NULL,
  `fid_type_seance` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `fid_salle`, `fid_type_seance`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 2),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance_groupe`
--

CREATE TABLE `seance_groupe` (
  `date_debut_seance` datetime NOT NULL,
  `date_fin_seance` datetime NOT NULL,
  `fid_seance` bigint(20) NOT NULL,
  `fid_groupe` bigint(20) NOT NULL,
  `fid_individu` bigint(20) NOT NULL,
  `fid_cours` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_individu`
--

CREATE TABLE `type_individu` (
  `id_type_individu` bigint(20) NOT NULL,
  `libelle_type_individu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_individu`
--

INSERT INTO `type_individu` (`id_type_individu`, `libelle_type_individu`) VALUES
(1, 'Enseignant'),
(2, 'Etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `type_seance`
--

CREATE TABLE `type_seance` (
  `id_type_seance` bigint(20) NOT NULL,
  `libelle_type_seance` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_seance`
--

INSERT INTO `type_seance` (`id_type_seance`, `libelle_type_seance`) VALUES
(1, 'TD'),
(2, 'CM'),
(3, 'Examen');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `association_groupe`
--
ALTER TABLE `association_groupe`
  ADD PRIMARY KEY (`id_association`);

--
-- Index pour la table `composante`
--
ALTER TABLE `composante`
  ADD PRIMARY KEY (`id_composante`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id_cours`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`),
  ADD KEY `fid_composante` (`fid_composante`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`),
  ADD KEY `fid_formation` (`fid_formation`),
  ADD KEY `fid_modalite` (`fid_modalite`),
  ADD KEY `fid_niveau` (`fid_niveau`);

--
-- Index pour la table `groupe_individu`
--
ALTER TABLE `groupe_individu`
  ADD PRIMARY KEY (`fid_groupe`,`fid_individu`),
  ADD KEY `fid_individu` (`fid_individu`);

--
-- Index pour la table `individu`
--
ALTER TABLE `individu`
  ADD PRIMARY KEY (`id_individu`),
  ADD KEY `fid_type_individu` (`fid_type_individu`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modalite`
--
ALTER TABLE `modalite`
  ADD PRIMARY KEY (`id_modalite`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `fid_salle` (`fid_salle`),
  ADD KEY `fid_type_seance` (`fid_type_seance`);

--
-- Index pour la table `seance_groupe`
--
ALTER TABLE `seance_groupe`
  ADD PRIMARY KEY (`date_debut_seance`,`date_fin_seance`,`fid_seance`,`fid_groupe`,`fid_individu`,`fid_cours`),
  ADD KEY `fid_groupe` (`fid_groupe`),
  ADD KEY `fid_individu` (`fid_individu`),
  ADD KEY `fid_cours` (`fid_cours`);

--
-- Index pour la table `type_individu`
--
ALTER TABLE `type_individu`
  ADD PRIMARY KEY (`id_type_individu`);

--
-- Index pour la table `type_seance`
--
ALTER TABLE `type_seance`
  ADD PRIMARY KEY (`id_type_seance`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `association_groupe`
--
ALTER TABLE `association_groupe`
  MODIFY `id_association` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `composante`
--
ALTER TABLE `composante`
  MODIFY `id_composante` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id_cours` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_formation` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `modalite`
--
ALTER TABLE `modalite`
  MODIFY `id_modalite` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `type_seance`
--
ALTER TABLE `type_seance`
  MODIFY `id_type_seance` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
