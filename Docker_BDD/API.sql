-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 17 fév. 2023 à 13:43
-- Version du serveur : 8.0.32
-- Version de PHP : 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `API`
--

-- --------------------------------------------------------

--
-- Structure de la table `DataTable`
--

CREATE TABLE `DataTable` (
  `ID` int NOT NULL,
  `Task` varchar(50) DEFAULT NULL,
  `Importance` varchar(20) DEFAULT NULL,
  `Completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `DataTable`
--

INSERT INTO `DataTable` (`ID`, `Task`, `Importance`, `Completed`) VALUES
(3, 'Todo update', 'update', 0),
(4, 'Test Task', 'low', 0),
(10, 'True', 'high', 1),
(11, 'Updated Test Task', 'high', 1),
(12, '1', 'high', 1),
(13, 'Test Task', 'low', 0),
(14, 'True', 'high', 1),
(15, '1', 'high', 1),
(16, 'True', 'high', 1),
(17, 'Updated Test Task', 'high', 1),
(18, 'Updated Test Task', 'high', 1),
(19, 'MissBoolean', 'high', 1),
(20, 'MissBoolean', 'high', 1),
(21, 'MissBoolean', 'high', 1),
(22, 'MissBoolean', 'high', 1),
(23, '1', 'high', 1),
(24, 'MissBoolean', 'high', 1),
(25, 'MissBoolean', 'high', 1),
(26, '1', 'high', 1),
(27, 'MissBoolean', 'high', 1),
(28, 'MissBoolean', 'high', 1),
(29, 'True', 'high', 1),
(30, 'MissBoolean', 'high', 1),
(31, '1', 'high', 1),
(32, 'Test Task', 'low', 0),
(33, 'True', 'high', 1),
(34, 'MissBoolean', 'high', 1),
(35, '1', 'high', 1),
(36, 'Test Task', 'low', 0),
(37, 'MissBoolean', 'high', 1),
(38, 'MissBoolean', 'high', 1),
(39, 'MissBoolean', 'high', 1),
(40, 'True', 'high', 1),
(41, 'MissBoolean', 'high', 1),
(42, '1', 'high', 1),
(43, 'Test Task', 'low', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `DataTable`
--
ALTER TABLE `DataTable`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `DataTable`
--
ALTER TABLE `DataTable`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
