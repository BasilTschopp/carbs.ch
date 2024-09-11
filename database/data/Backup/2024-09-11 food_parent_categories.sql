-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Sep 2024 um 19:05
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `carbs.ch`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `food_parent_categories`
--

CREATE TABLE `food_parent_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ParentCategoryName` varchar(255) NOT NULL,
  `Order` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `food_parent_categories`
--

INSERT INTO `food_parent_categories` (`id`, `ParentCategoryName`, `Order`, `Active`) VALUES
(1, 'Getränke', 10, 1),
(2, 'Obst & Gemüse', 20, 1),
(3, 'Getreide & Backwaren', 30, 1),
(4, 'Milchprodukte & Milchersatz', 50, 1),
(5, 'Fleisch & Fisch', 60, 1),
(6, 'Fast Food', 70, 1),
(7, 'Sacks & Süsses', 80, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `food_parent_categories`
--
ALTER TABLE `food_parent_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `food_parent_categories`
--
ALTER TABLE `food_parent_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
