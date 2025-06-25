-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql-mywebtest.alwaysdata.net
-- Generation Time: Jun 25, 2025 at 01:12 PM
-- Server version: 10.11.13-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mywebtest_gestiontickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`id_categorie`, `nom_categorie`) VALUES
(2, 'Matériel'),
(1, 'Réseau');

-- --------------------------------------------------------

--
-- Table structure for table `Historique`
--

CREATE TABLE `Historique` (
  `id_historique` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `action` varchar(200) NOT NULL,
  `ancienne_valeur` text DEFAULT NULL,
  `nouvelle_valeur` text DEFAULT NULL,
  `date_action` datetime DEFAULT current_timestamp(),
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tickets`
--

CREATE TABLE `Tickets` (
  `id_ticket` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `statut` enum('ouvert','en cours','résolu') NOT NULL,
  `date_creation` datetime NOT NULL,
  `id_demandeur` int(11) NOT NULL,
  `id_technicien` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tickets`
--

INSERT INTO `Tickets` (`id_ticket`, `titre`, `description`, `statut`, `date_creation`, `id_demandeur`, `id_technicien`, `id_categorie`) VALUES
(1, 'Problème basique de messagerie', 'Depuis hier soir, je ne reçois plus mes e-mails sur mon téléphone. Vérifiez la configuration de mon compte.', 'ouvert', '2025-03-04 08:30:00', 1, 11, 1),
(2, 'Problème matériel simple', 'L’imprimante réseau affiche \'Toner faible\' et refuse d’imprimer. Besoin d’un remplacement.', 'en cours', '2025-03-04 09:15:00', 2, 12, 2),
(3, 'Logistique IT', 'Mon ordinateur portable et mon badge, commandés il y a une semaine, ne sont toujours pas arrivés.', 'ouvert', '2025-03-04 10:00:00', 3, 11, 2),
(4, 'Erreur de livraison', 'La livraison d’hier contenait des câbles Ethernet au lieu des disques SSD commandés. Problème réglé avec le fournisseur.', 'résolu', '2025-03-03 16:45:00', 4, 12, 2),
(5, 'Problème d’accès réseau', 'Impossible d’accéder au serveur partagé \'COMMUNICATION\'. Erreur : \'Accès refusé\'.', 'ouvert', '2025-03-04 11:20:00', 5, 6, 1),
(6, 'Panne réseau', 'Le switch du 3ème étage est en panne. Perte de connexion pour plusieurs utilisateurs.', 'en cours', '2025-03-04 07:50:00', 6, 11, 2),
(7, 'Bug applicatif', 'L’application de gestion des congés renvoie une erreur HTTP 500. Plusieurs utilisateurs concernés.', 'ouvert', '2025-03-04 13:10:00', 7, 12, 1),
(8, 'Récupération de données', 'Un dossier partagé sensible a été supprimé par erreur. Restauration urgente depuis la sauvegarde.', 'en cours', '2025-03-04 10:40:00', 8, 6, 1),
(9, 'Performance', 'Mon PC est très lent. Les fichiers Excel/Word mettent plusieurs minutes à s’ouvrir.', 'ouvert', '2025-03-04 14:00:00', 9, 11, 2),
(10, 'Sécurité', 'Alertes de sécurité sur le firewall. Analyse des logs requise pour détecter une intrusion.', 'ouvert', '2025-03-04 15:30:00', 10, 6, 1),
(11, 'Problème d’impression réseau', 'L’imprimante du 2ème étage n’apparaît plus dans la liste des périphériques. Problème résolu après redémarrage du spooler.', 'résolu', '2025-03-15 09:00:00', 1, 1, 1),
(12, 'Problème de connexion VPN', 'Impossible de se connecter au VPN depuis mon domicile. Erreur : \"Authentification échouée\".', 'en cours', '2025-03-20 14:30:00', 2, 2, 2),
(13, 'Mise à jour logicielle', 'Demande de mise à jour de l’antivirus sur tous les postes du service IT.', 'ouvert', '2025-04-01 10:15:00', 3, 3, 2),
(14, 'Panne de disque dur', 'Disque dur de mon poste de travail HS. Remplacement effectué.', 'résolu', '2025-04-10 11:45:00', 4, 1, 1),
(15, 'Problème d’accès Wi-Fi', 'Le Wi-Fi se déconnecte toutes les 10 minutes sur mon poste.', 'ouvert', '2025-04-15 13:20:00', 5, 2, 1),
(16, 'Erreur d’application métier', 'L’application RH plante lors de l’export des données vers Excel.', 'en cours', '2025-04-20 08:50:00', 6, 3, 2),
(17, 'Problème de sauvegarde', 'La sauvegarde quotidienne du serveur échoue depuis hier.', 'ouvert', '2025-04-25 16:00:00', 7, 2, 2),
(18, 'Remplacement d’écran', 'L’écran de mon poste affiche des lignes horizontales. Remplacement effectué.', 'résolu', '2025-05-01 10:30:00', 8, 1, 1),
(19, 'Mise à jour réseau', 'Demande de mise à jour du firmware des routeurs Cisco.', 'en cours', '2025-05-10 09:45:00', 9, 3, 1),
(20, 'Problème de messagerie avancé', 'Problème de synchronisation des dossiers partagés dans Outlook.', 'ouvert', '2025-05-15 14:20:00', 1, 2, 2),
(21, 'Test', 'Test', 'ouvert', '0000-00-00 00:00:00', 999, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `Id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `role` enum('technicien','demandeur') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Id_utilisateur`, `nom`, `email`, `telephone`, `role`) VALUES
(1, 'Alice Dupont', 'alice@example.com', '0612345678', 'demandeur'),
(2, 'Bob Martin', 'bob@example.com', '0623456789', 'demandeur'),
(3, 'Charlie Durand', 'charlie@example.com', '0634567890', 'demandeur'),
(4, 'Diane Leroy', 'diane@example.com', '0645678901', 'demandeur'),
(5, 'Éric Morel', 'eric@example.com', '0656789012', 'demandeur'),
(6, 'Fatima Ben', 'fatima@example.com', '0667890123', 'demandeur'),
(7, 'Georges Lemaire', 'georges@example.com', '0678901234', 'demandeur'),
(8, 'Hélène Dubois', 'helene@example.com', '0689012345', 'demandeur'),
(9, 'Ismael Cohen', 'ismael@example.com', '0690123456', 'demandeur'),
(10, 'Julie Fabre', 'julie@example.com', '0601234567', 'demandeur'),
(11, 'Thomas Richard', 'technicien1@example.com', '0611223344', 'technicien'),
(12, 'Claire Petit', 'technicien2@example.com', '0622334455', 'technicien'),
(13, 'Luc Moreau', 'technicien3@example.com', '0633445566', 'technicien');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id_categorie`),
  ADD UNIQUE KEY `nom_categorie` (`nom_categorie`);

--
-- Indexes for table `Historique`
--
ALTER TABLE `Historique`
  ADD PRIMARY KEY (`id_historique`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_technicien` (`id_technicien`),
  ADD KEY `id_demandeur` (`id_demandeur`);

--
-- Indexes for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`Id_utilisateur`),
  ADD UNIQUE KEY `numero` (`telephone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Historique`
--
ALTER TABLE `Historique`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Tickets`
--
ALTER TABLE `Tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Historique`
--
ALTER TABLE `Historique`
  ADD CONSTRAINT `Historique_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `Tickets` (`id_ticket`),
  ADD CONSTRAINT `Historique_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateurs` (`Id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
