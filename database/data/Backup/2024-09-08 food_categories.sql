-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 08. Sep 2024 um 23:09
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
  `CategoryName` varchar(255) NOT NULL,
  `Parent` int(11) NOT NULL,
  `Icon` varchar(255) NOT NULL,
  `Order` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `food_categories`
--

INSERT INTO `food_categories` (`id`, `CategoryName`, `Parent`, `Icon`, `Order`, `Active`) VALUES
(1, 'Alle Kategorien', 0, '', 1, 1),
(2, 'Getränke | Softdrinks', 0, '', 21, 1),
(3, 'Getränke | Bier, Wein, Drinks', 0, '', 24, 1),
(4, 'Essen | Obst & Gemüse', 0, '', 40, 1),
(5, 'Essen | Brot', 0, '', 42, 1),
(6, 'Essen | Gerichte', 0, '', 41, 1),
(7, 'Fast Food | McDonalds', 0, '', 70, 1),
(8, 'Süsses, Salziges, Dessert', 0, '', 80, 0),
(11, 'Essen | Nüsse', 0, '', 41, 1),
(12, 'Getränke | Kaffee', 0, '', 22, 1),
(13, 'Getränke | Milch und Milchersatz', 0, '', 23, 1),
(14, 'Getränke | Saft', 0, '', 20, 1),
(15, 'Gebäck | Kuchen und Torten', 0, '', 90, 1);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
