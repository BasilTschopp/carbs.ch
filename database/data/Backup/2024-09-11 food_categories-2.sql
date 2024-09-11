-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Sep 2024 um 19:04
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
-- Tabellenstruktur für Tabelle `food_categories`
--

CREATE TABLE `food_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ParentID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Order` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `food_categories`
--

INSERT INTO `food_categories` (`id`, `ParentID`, `CategoryName`, `Order`, `Active`) VALUES
(1, 1, 'Kaffee', 10, 1),
(2, 1, 'Tee', 20, 0),
(3, 1, 'Softdrinks', 60, 1),
(4, 1, 'Säfte', 30, 1),
(5, 1, 'Bier', 70, 1),
(6, 1, 'Wein', 80, 0),
(7, 1, 'Drinks', 90, 0),
(8, 1, 'Milch', 40, 0),
(9, 1, 'Milchersatz', 50, 0),
(10, 2, 'Frisches Obst & Gemüse', 10, 1),
(11, 2, 'Trockenfrüchte', 30, 1),
(12, 2, 'Aus Konserven', 20, 1),
(13, 3, 'Brot & Brötchen', 10, 1),
(14, 3, 'Teigwaren', 20, 1),
(15, 3, 'Reis', 30, 1),
(16, 3, 'Müsli & Cornflakes', 40, 1),
(17, 4, 'Käse', 10, 0),
(18, 4, 'Joghurt', 20, 0),
(19, 4, 'Milch', 30, 1),
(20, 4, 'Milchersatz', 40, 1),
(21, 5, 'Fleischgerichte', 30, 1),
(22, 5, 'Wurstwaren', 31, 1),
(23, 5, 'Fischgerichte', 32, 1),
(24, 6, 'Pizza', 10, 1),
(25, 6, 'McDonalds', 20, 1),
(26, 6, 'Burger King', 30, 0),
(27, 7, 'Kekse & Gebäck', 40, 1),
(28, 7, 'Salziges', 30, 1),
(29, 7, 'Nüsse', 10, 1),
(30, 7, 'Kuchen & Torten', 50, 1),
(31, 7, 'Popcorn & Chips', 20, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `food_categories`
--
ALTER TABLE `food_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `food_categories`
--
ALTER TABLE `food_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
