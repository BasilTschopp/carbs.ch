-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 04. Sep 2024 um 21:37
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
-- Tabellenstruktur für Tabelle `food_servings`
--

CREATE TABLE `food_servings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ServingName` varchar(255) NOT NULL,
  `ServingSize` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `food_servings`
--

INSERT INTO `food_servings` (`id`, `ServingName`, `ServingSize`) VALUES
(1, 'Kleine Portion', 250),
(2, 'Mittelgrosse Portion', 350),
(3, 'Grosse Portion', 450),
(4, 'Kleine Scheibe', 60),
(5, 'Mittelgrosse Scheibe', 85),
(6, 'Grosse Scheibe', 125),
(7, 'Kleines Glas', 200),
(8, 'Mittelgrosses Glas', 300),
(9, 'Grosses Glas', 500),
(10, 'Kleiner Apfel', 125),
(11, 'Mittelgrosser Apfel', 175),
(12, 'Grosser Apfel', 225),
(13, 'Kleines Stück', 60),
(14, 'Mittelgrosses Stück', 85),
(15, 'Grosses Stück', 125),
(16, 'Kleine Portion', 125),
(17, 'Mittelgrosse Portion', 175),
(18, 'Grosse Portion', 225),
(19, 'Kleines Glas', 200),
(20, 'Mittelgrosses Glas', 300),
(21, 'Grosses Glas', 500),
(22, 'Kleine Aprikose', 35),
(23, 'Mittelgrosse Aprikose', 45),
(24, 'Grosse Aprikose', 60),
(25, 'Kleines Stück', 60),
(26, 'Mittelgrosses Stück', 85),
(27, 'Grosses Stück', 125),
(28, 'Kleine Avocado', 125),
(29, 'Mittelgrosse Avocado', 175),
(30, 'Grosse Avocado', 225),
(31, 'Kleine Banane', 100),
(32, 'Mittelgrosse Banane', 140),
(33, 'Grosse Banane', 170),
(34, 'Ein Stück', 30),
(35, 'Drei Stück', 90),
(36, 'Kleine Scheibe', 40),
(37, 'Mittelgrosse Scheibe', 60),
(38, 'Grosse Scheibe', 80),
(39, 'Eine Handvoll', 30),
(40, 'Ein Stück', 70),
(41, 'Ein Stück', 100),
(42, 'Kleines Bierglas', 300),
(43, 'Grosses Bierglas', 500),
(44, 'Kleine Portion', 200),
(45, 'Mittelgrosse Portion', 300),
(46, 'Grosse Portion', 400),
(47, 'Kleine Birne', 125),
(48, 'Mittelgrosse Birne', 175),
(49, 'Grosse Birne', 225),
(50, 'Kleines Stück', 90),
(51, 'Mittelgrosses Stück', 135),
(52, 'Grosses Stück', 180),
(53, 'Kleines Stück', 250),
(54, 'Mittelgrosses Stück', 400),
(55, 'Grosses Stück', 500),
(56, 'Ein Stück', 50),
(57, 'Ein Stück', 50),
(58, 'Ein Stück', 50),
(59, 'Eine Scheibe', 50),
(60, 'Eine Tasse', 200),
(61, '1 Stück', 10),
(62, 'Ein Stück', 200),
(63, 'Eine Portion', 50),
(64, 'Ein Stück', 100),
(65, 'Ein Stück', 100),
(66, 'Mittelgrosses Glas', 300),
(67, 'Grosses Glas', 500),
(68, 'Ein Stück', 100),
(69, 'Ein Stück', 50),
(70, 'Ein Stück', 25),
(71, 'Ein Stück', 50),
(72, 'Ein Stück', 150),
(73, 'Ein Stück', 200),
(74, 'Ein Stück', 200),
(75, 'Eine Portion', 200),
(76, 'Ein Stück', 150),
(77, 'Ein Stück', 100),
(78, 'Eine Portion', 150),
(79, 'Ein Stück', 100),
(80, 'Eine Portion', 200),
(81, '1 Scheibe', 50),
(82, 'Kleines Brötchen', 63),
(83, 'Grosses Brötchen', 90),
(84, 'Eine Portion', 150),
(85, 'Ein Stück', 150),
(86, 'Eine Portion', 200),
(87, 'Ein Stück', 150),
(88, 'Ein Stück', 100),
(89, 'Ein Stück', 200),
(90, 'Ein Stück', 150),
(91, 'Ein Stück', 75),
(92, 'Ein Stück', 40),
(93, '1 Esslöffel', 20),
(94, 'Ein Stück', 50),
(95, 'Ein Stück', 50),
(96, 'Ein Stück', 30),
(97, 'Ein Stück', 50),
(98, 'Ein Stück', 150),
(99, 'Ein Stück', 10),
(100, 'Ein Stück', 100),
(101, 'Eine Portion', 200),
(102, 'Ein Stück', 150),
(103, 'Ein Stück', 50),
(104, 'Ein Stück', 50),
(105, 'Ein Stück', 150),
(106, 'Ein Stück', 200),
(107, 'Ein Stück', 50),
(108, 'Ein Stück', 150),
(109, '20 Stück', 30),
(110, 'Ein Stück', 150),
(111, 'Zwei Eier', 100),
(112, '1 Stück', 50),
(113, 'Ein Stück', 50),
(114, 'Ein Stück', 150),
(115, 'Ein Stück', 150),
(116, 'Eine Portion', 200),
(117, 'Eine Portion', 150),
(118, 'Eine Scheibe', 50),
(119, 'Ein Stück', 50),
(120, '1 Würfel', 10),
(121, 'Kleiner Hamburger', 102),
(122, 'Ein Burger', 227),
(123, 'Ein Burger', 291),
(124, 'Ein Cheesburger', 206),
(125, 'Ein Burger', 289),
(126, 'Ein Burger', 273),
(127, 'Burger', 370),
(128, 'Ein kleiner Cheesburger', 116),
(129, 'Ein Burger', 166),
(130, 'Ein Burger', 193),
(131, '4 Stück', 70),
(132, '6 Stück', 105),
(133, '9 Stück', 158),
(134, 'Eine Portion', 143),
(135, 'Portion Mini', 80),
(136, 'Portion Small', 114),
(137, 'Portion Medium', 150),
(138, 'Ein Burger', 132),
(139, 'Small', 158),
(140, 'Regular', 235),
(141, 'Small', 205),
(142, 'Regular', 257),
(143, '1 Becher', 224),
(144, 'Regular', 189),
(145, 'Maxi', 271),
(146, 'Regular', 184),
(147, 'Maxi', 200),
(148, 'Regular', 155),
(149, 'Maxi', 220),
(150, 'Small', 225),
(151, 'Regular', 400),
(152, 'Eine Portion', 80),
(153, 'Eine Handvoll', 30),
(154, 'Eine handvoll Scheiben', 35),
(155, 'Eine Portion', 300),
(156, 'Eine Portion', 30),
(157, 'Ein kleines Glas', 50),
(158, 'Ein mittelgrosses Glas', 100),
(159, 'Eine Portion', 90),
(160, 'ca. 8 Stück', 125),
(161, 'Eine Handvoll', 40),
(162, '2 Würfel', 20),
(163, '2 Stück', 20),
(164, '3 Stück', 30),
(165, 'Kleine Portion', 30),
(166, 'Grosse Portion', 50),
(167, '1 Esslöffel', 20),
(168, '4 Stück', 100),
(169, '6 Stück', 150),
(170, '8 Stück', 200),
(171, '1/4 Stück', 50),
(172, '1/2 Stück', 100),
(173, '4 Fischstäbchen', 100),
(174, '6 Fischstäbchen', 150),
(175, '8 Fischstäbchen', 200),
(176, 'Eine kleine Dose', 150),
(177, '1 Stück', 70),
(178, '2 Stück', 140),
(179, '4 Stück', 280),
(180, 'Eine Portion', 400),
(181, 'Eine Portion', 110),
(182, 'Ein kleiner Grittibänz', 100),
(183, 'Ein mittelgrosser Grittibänz', 150),
(184, 'Ein kleines Bonbon', 5),
(185, 'Ein grosses Bonbon', 10),
(186, 'Eine kleine Schüssel', 120),
(187, 'Eine Schüssel', 90),
(188, 'Als Beilage', 50),
(189, 'Als Hauptgericht', 100),
(190, 'Ein kleiner Rettich', 150),
(191, 'Eine Portion', 150),
(192, 'Eine Portion', 120),
(193, 'Eine Portion', 350),
(194, 'Eine Portion (2 Esslöffel)', 30),
(195, 'Ein Glas', 150),
(196, 'Eine von 6 Reihen', 17),
(197, '4 Stück', 60),
(198, '6 Spargeln', 160),
(199, 'Eine Portion', 125),
(200, 'Ein Stück', 75),
(201, 'Eine Stange', 75),
(202, 'Eine Portion', 175),
(203, 'Eine Tomate', 60),
(204, 'Eine getrocknete Tomate', 10),
(205, 'Kleine Tomate', 100),
(206, 'Grosse Tomate', 200),
(207, 'Eine Portion', 250),
(208, '4 Stück', 30),
(209, '6 Stück', 50),
(210, '1 Stück', 4),
(211, '2 Stück', 8),
(212, '4 Stück', 16),
(213, '1 Stück', 12),
(214, '2 Stück', 24),
(215, '1/4 Flammkuchen', 75),
(216, '1/2 Flammkuchen', 150),
(217, '1 Flammkuchen', 300),
(218, '1 Stück', 15),
(219, '2 Stück', 30),
(220, '4 Stück', 60),
(221, '1 Scheibe', 60),
(222, '2 Scheiben', 120),
(223, '4 Scheiben', 240),
(224, 'Eine kleine Scheibe', 25),
(225, 'Eine mittelgrosse Scheibe', 30),
(226, 'Eine grosse Scheibe', 35),
(227, 'Eine Handvoll', 50),
(228, 'Eine Portion', 60),
(229, 'Eine Portion', 85),
(230, 'Eine Handvoll', 70),
(231, 'Ein Stück', 80),
(232, '1/4 Kokosnuss', 170),
(233, '1 Stück', 12),
(234, '2 Stück', 24),
(235, '4 Stück', 48),
(236, '2 Stück', 100),
(237, '4 Stück', 200),
(238, '2 Esslöffel', 40),
(239, '1 Teelöffel', 7),
(240, '2 Teelöffel', 14),
(241, '1 Scheibe', 120),
(242, 'Eine Schüssel', 200),
(243, 'Eine Portion', 170),
(244, 'Eine Scheibe', 150),
(245, '1/2 Pariserbrot', 150),
(246, '1/4 Pariserbrot', 75),
(247, 'Short', 237),
(248, 'Tall', 354),
(249, 'Grande', 473),
(250, 'Venti', 591),
(251, 'Ganze Pizza 24cm', 320);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `food_servings`
--
ALTER TABLE `food_servings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `food_servings`
--
ALTER TABLE `food_servings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
