-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2025 at 04:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservation_voitures`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `username`, `password`) VALUES
(3, 'admin', 'admin'),
(4, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `motDePasse` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`idClient`, `nom`, `prenom`, `email`, `motDePasse`) VALUES
(12, 'test', 'test', 'test@test.test', '123');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `idReservation` int(11) NOT NULL,
  `idClient` int(11) DEFAULT NULL,
  `idVoiture` int(11) DEFAULT NULL,
  `dateReservation` date DEFAULT NULL,
  `statut` varchar(20) DEFAULT 'attente'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`idReservation`, `idClient`, `idVoiture`, `dateReservation`, `statut`) VALUES
(13, 8, 13, '2025-01-16', 'Acceptee'),
(12, 9, 13, '2025-01-16', 'Acceptee'),
(11, 8, 11, '2025-12-05', 'Acceptee'),
(10, 7, 8, '2025-01-30', 'Acceptee'),
(14, 10, 13, '2025-05-02', 'Acceptee'),
(15, 10, 13, '2025-12-05', 'attente'),
(16, 10, 14, '2025-12-02', 'attente'),
(17, 12, 14, '2025-02-05', 'Acceptee');

-- --------------------------------------------------------

--
-- Table structure for table `voitures`
--

CREATE TABLE `voitures` (
  `idVoiture` int(11) NOT NULL,
  `img` varchar(15000) NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voitures`
--

INSERT INTO `voitures` (`idVoiture`, `img`, `marque`, `modele`, `prix`, `disponible`) VALUES
(13, 'https://www.topgear.com/sites/default/files/2024/10/Audi_RS_3_Sportback_kyalamigreen_5419.jpg', 'Audi', 'RS3', 200.00, 0),
(14, 'https://s1.cdn.autoevolution.com/images/models/VOLKSWAGEN_Golf-2024_main.jpg', 'Volkswagen', 'Golf 7', 200.00, 1),
(15, 'https://media.cnn.com/api/v1/images/stellar/prod/7646-2018beetle-copy.jpg?c=16x9&q=h_833,w_1480,c_fill', 'Volkswagen', 'New Beetle', 150.00, 1),
(16, 'https://media.auto-ies.com/_cms_/_prod_/media%2F1127%2Fdownload%2F2019-renault-twingo.jpg%3Fv%3D1%26inline%3D1?ci_url_encoded=1func=cropfit&w=540&h=468', 'Renault', 'Twingo', 100.00, 1),
(17, 'https://www.automobile-magazine.fr/asset/cms/173719/config/122489/2020-renault-clio-e-tech-tests-drive-26.jpg', 'Renault', 'Clio5', 120.00, 1),
(18, 'https://fr.web.img4.acsta.net/c_310_420/pictures/21/08/02/16/08/1706767.jpg', 'test', 'test', 130.00, 1),
(12, 'https://hips.hearstapps.com/hmg-prod/images/2024-audi-rs7-performance-beach-front-2-1669663938.jpg?crop=0.433xw:0.432xh;0.439xw,0.355xh&resize=768:*', 'Audi', 'RS7', 350.00, 1),
(11, 'https://www.motortrend.com/uploads/2022/02/2022-Mercedes-Benz-G-Class-AMG-G63-22.jpg?w=768&width=768&q=75&format=webp', 'Mercedes', 'G-Class', 450.00, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idVoiture` (`idVoiture`);

--
-- Indexes for table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`idVoiture`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `voitures`
--
ALTER TABLE `voitures`
  MODIFY `idVoiture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
