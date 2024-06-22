-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 21. Jun 2024 um 19:40
-- Server-Version: 10.6.14-MariaDB-cll-lve-log
-- PHP-Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `qozisida_carbs`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info_text`
--

CREATE TABLE `info_text` (
  `ID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Text` longtext NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `Inactive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `info_text`
--

INSERT INTO `info_text` (`ID`, `Title`, `Text`, `OrderNumber`, `Inactive`) VALUES
(1, 'Info', 'Carbs.ch ist eine nichtkommerzielle Webapplikation. Diese bietet nicht nur Angaben zu Kohlenhydraten und weiteren Nährwerten pro 100 g bzw. 100 ml, sondern ermöglicht eine direkte Berechnung anhand gängiger Portionsgrössen. Zudem können Typ-1-Diabetiker den Faktor angeben, um das Bolus-Insulin zu berechnen.', 10, 0),
(2, 'Feel Free', 'Das Projekt wird nicht weiterentwicklet. Der Code und die Datenbank stehen auf \r\n<a href=\"https://github.com/BasilTschopp/carbs.ch\" class=\"RegularFont BlueFont\">Github</a> frei zur Verfügung, falls dies jemand für eigene Zwecke nutzen möchte.', 20, 0),
(3, 'Ausschluss', 'Alle Angaben wurden nach bestem Wissen erstellt, es kann jedoch kein Gewähr für Vollständigkeit und Richtigkeit übernommen werden. Zudem sind die Nährwertangaben und die Portionsgrössen von der Zubereitung abhängig.', 30, 0),
(4, 'Kontakt', 'Anfragen können gerne an <a href=\"mailto: info@carbs.ch\" class=\"RegularFont BlueFont\">info@carbs.ch</a> gesendet werden.', 40, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items_food`
--

CREATE TABLE `items_food` (
  `ID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `Carbs` decimal(3,1) NOT NULL,
  `Sugar` decimal(3,1) NOT NULL,
  `Fibers` decimal(3,1) NOT NULL,
  `Fat` decimal(3,1) NOT NULL,
  `UnitID` int(1) NOT NULL,
  `ServingID` varchar(255) NOT NULL,
  `Inactive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `items_food`
--

INSERT INTO `items_food` (`ID`, `ItemName`, `Carbs`, `Sugar`, `Fibers`, `Fat`, `UnitID`, `ServingID`, `Inactive`) VALUES
(1, 'Älplermagronen', 17.8, 1.3, 1.7, 9.0, 1, '1,2,3', 0),
(2, 'Ananas, aus Konserve', 13.6, 12.8, 1.4, 0.1, 1, '4,5,6', 0),
(3, 'Ananas, roh', 11.7, 10.5, 1.2, 0.1, 1, '4,5,6', 0),
(4, 'Ananassaft', 12.1, 12.1, 0.2, 0.1, 2, '7,8,9', 0),
(5, 'Apfel, getrocknet', 55.4, 50.0, 11.2, 1.6, 1, '153', 0),
(6, 'Apfel, roh', 11.6, 11.5, 1.4, 0.3, 1, '10,11,12', 0),
(7, 'Apfelkuchen / Apfelwähe', 17.8, 9.4, 1.3, 6.8, 1, '13,14,15', 1),
(8, 'Apfelmus, aus Konserve gezuckert', 20.5, 20.4, 1.9, 0.3, 1, '16,17,18', 0),
(9, 'Apfelmus, aus Konserve ungezuckert', 11.7, 11.6, 2.1, 0.3, 1, '16,17,18', 0),
(10, 'Apfelsaft / Süssmost', 11.9, 11.3, 0.2, 0.1, 2, '19,20,21', 0),
(11, 'Aprikose', 9.0, 6.7, 1.7, 0.1, 1, '22,23,24', 0),
(12, 'Aprikosenkuchen / Aprikosenwähe', 16.1, 6.2, 1.5, 6.7, 1, '25,26,27', 0),
(13, 'Avocado', 1.2, 1.1, 5.5, 15.1, 1, '28,29,30', 0),
(14, 'Banane gedörrt / Banananchips', 80.7, 65.3, 7.6, 1.8, 1, '154', 0),
(15, 'Banane getrocknet', 60.2, 43.7, 5.5, 1.0, 1, '154', 0),
(16, 'Banane roh', 19.7, 15.6, 2.7, 0.1, 1, '31,32,33', 0),
(17, 'Basler Leckerli', 75.0, 52.0, 2.8, 7.9, 1, '34,35', 0),
(18, 'Bauernbrot / Burebrot', 44.3, 2.4, 4.4, 2.0, 1, '36,37,38', 0),
(19, 'Baumnuss / Walnuss', 6.9, 3.0, 6.7, 67.3, 1, '39', 0),
(20, 'Beeren, gekocht', 5.3, 5.0, 3.2, 0.6, 1, '', 1),
(21, 'Beeren, roh', 6.3, 5.9, 3.7, 0.5, 1, '', 1),
(22, 'Berliner', 45.8, 17.1, 2.2, 12.8, 1, '40', 0),
(23, 'Biber', 65.6, 36.9, 3.0, 5.6, 1, '41', 0),
(24, 'Bier Panache', 7.4, 7.1, 0.0, 0.0, 2, '42,43', 0),
(25, 'Bier alkoholfrei', 4.9, 2.6, 0.0, 0.0, 2, '42,43', 0),
(26, 'Bier Lager', 3.1, 2.2, 0.0, 0.0, 2, '42,43', 0),
(27, 'Birchermüesli, ungezuckert', 11.1, 8.2, 1.5, 3.1, 1, '44,45,46', 0),
(28, 'Birne', 10.9, 9.0, 2.9, 0.3, 1, '47,48,49', 0),
(29, 'Birnensaft', 12.1, 10.0, 0.0, 0.3, 2, '19,20,21', 0),
(30, 'Birnenweggen', 57.2, 33.5, 6.9, 10.4, 1, '50,51,52', 0),
(31, 'Blutwurst', 2.5, 2.4, 0.1, 10.9, 1, '53,54,55', 1),
(32, 'Bohnen, gekocht', 14.5, 0.4, 8.5, 0.6, 1, '', 0),
(33, 'Bohnen, getrocknet', 40.7, 1.2, 22.6, 1.5, 1, '', 0),
(34, 'Bohne, gedämpft', 4.4, 3.4, 3.2, 0.2, 1, '', 0),
(35, 'Brombeere', 6.5, 6.1, 5.2, 0.7, 1, '39', 0),
(36, 'Bündner Gerstensuppe', 6.7, 1.3, 0.0, 0.9, 2, '155', 0),
(37, 'Bürli, halbweiss', 41.5, 0.4, 2.9, 1.0, 1, '56', 0),
(38, 'Buttergipfeli, hell', 43.5, 3.3, 2.6, 24.2, 1, '57', 0),
(39, 'Buttergipfeli, Vollkorn', 38.7, 2.2, 4.2, 19.7, 1, '57', 0),
(40, 'Buttermilch', 4.0, 4.0, 0.0, 0.5, 2, '66,67', 0),
(41, 'Butterweggli', 47.3, 3.4, 2.2, 8.7, 1, '58', 0),
(42, 'Butterzopf', 45.7, 2.9, 2.1, 11.4, 1, '59', 0),
(43, 'Butterzopf Vollkorn', 40.4, 0.9, 7.3, 6.4, 1, '59', 0),
(44, 'Café crème ungezuckert', 0.5, 0.3, 0.1, 1.1, 1, '60', 0),
(45, 'Cannelloni', 13.8, 2.1, 1.6, 9.0, 1, '', 1),
(46, 'Cappuccino (ohne Schokoladenpulver und ungezuckert)', 2.6, 2.5, 0.0, 2.2, 1, '60', 1),
(47, 'Capuns, zubereitet', 9.7, 0.9, 0.8, 10.2, 1, '', 1),
(48, 'Cashewnuss', 23.2, 3.1, 3.6, 48.1, 1, '', 1),
(49, 'Chräbeli / Anisgebäck', 75.3, 40.5, 2.0, 2.9, 1, '61,163,164', 0),
(50, 'Cordon Bleu', 10.3, 0.6, 0.6, 11.7, 1, '62', 0),
(51, 'Cornflakes', 79.7, 7.2, 4.0, 0.6, 1, '63', 0),
(52, 'Cracker Salzgebäck', 66.3, 0.0, 2.1, 15.9, 1, '156', 0),
(53, 'Crèmeschnitte', 28.8, 21.3, 0.3, 18.8, 1, '64', 0),
(54, 'Crêpes mit Nutella', 35.8, 26.4, 1.7, 22.2, 1, '65', 0),
(55, 'Crêpes mit Zimt und Zucker', 29.0, 14.9, 0.7, 11.5, 1, '65', 0),
(56, 'Crêpes nature', 19.0, 2.9, 0.7, 13.2, 1, '65', 0),
(57, 'Dattel, getrocknet', 64.7, 64.7, 7.5, 0.6, 1, '61', 0),
(58, 'Dörrbohne eingeweicht und gedämpft', 10.5, 5.6, 6.3, 0.5, 1, '', 1),
(59, 'Dulce de Leche', 52.6, 52.6, 0.0, 7.3, 1, '2', 1),
(60, 'Edelkastanie, roh', 41.2, 14.0, 8.4, 1.9, 1, '', 1),
(61, 'Eierlikör', 30.8, 30.8, 0.0, 7.7, 2, '157,158', 0),
(62, 'Eistee, gezuckert', 7.5, 7.5, 0.0, 0.0, 1, '66, 67', 0),
(63, 'Engadiner Nusstorte', 49.9, 30.9, 2.0, 27.7, 1, '68', 0),
(64, 'Erbsen aus Konserve', 12.8, 0.0, 5.0, 0.8, 1, '159', 0),
(65, 'Erbse, grün, roh', 12.0, 5.5, 6.0, 0.7, 1, '159', 0),
(66, 'Erdbeere', 6.0, 5.6, 3.8, 0.5, 1, '160', 0),
(67, 'Erdnuss', 14.8, 5.9, 8.6, 49.1, 1, '161', 0),
(68, 'Erdnuss-Flips', 56.5, 0.0, 4.9, 24.2, 1, '165,166', 0),
(69, 'Erdnuss, geröstet, gesalzen', 15.0, 4.2, 8.0, 50.0, 1, '161', 0),
(70, 'Erdnussbutter', 12.5, 6.4, 7.6, 51.8, 1, '167,238', 0),
(71, 'Falafel', 26.2, 1.9, 6.4, 7.9, 1, '168,169,170', 0),
(72, 'Fasnachtschüechli', 51.7, 1.9, 2.3, 32.9, 1, '69', 0),
(73, 'Feige getrocknet', 55.9, 55.9, 10.0, 1.2, 1, '70', 0),
(74, 'Feige', 13.5, 12.2, 4.1, 0.5, 1, '71', 0),
(75, 'Felche, roh', 0.0, 0.0, 0.0, 2.7, 1, '', 1),
(76, 'Fenchel, gedämpft (ohne Zugabe von Salz)', 2.2, 0.1, 3.1, 0.3, 1, '', 1),
(77, 'Fenchel', 2.3, 0.1, 3.3, 0.3, 1, '171,172', 0),
(78, 'Fischstäbchen, gebraten', 16.6, 0.1, 0.9, 18.6, 1, '173,174,175', 0),
(79, 'Fischstäbchen, gebacken', 17.4, 0.1, 1.0, 12.2, 1, '173,174,175', 0),
(80, 'Flammenkuchen, gebacken', 22.7, 1.8, 1.4, 13.9, 1, '215,216,217', 0),
(81, 'Flammenkuchenteig', 12.3, 2.3, 1.5, 6.0, 1, '', 1),
(82, 'Fondue', 1.0, 0.1, 0.0, 22.4, 1, '', 1),
(83, 'Fruchtcocktail, aus Konserve in Sirup', 17.3, 16.2, 1.8, 0.2, 1, '176', 0),
(84, 'Fruchtcocktail, aus Konserve mit Süssungsmittel', 9.5, 8.4, 2.0, 0.2, 1, '176', 0),
(85, 'Fruchtsaft', 12.3, 11.6, 0.2, 0.1, 1, '7,8', 0),
(86, 'Fruchtwähe', 18.3, 8.0, 2.6, 8.4, 1, '72', 0),
(87, 'Frühlingsrolle, frittiert', 23.1, 3.0, 2.5, 11.2, 1, '177,178,179', 0),
(88, 'Gemüsegratin, gebacken', 2.3, 1.5, 1.8, 3.9, 1, '', 1),
(89, 'Gemüselasagne', 11.2, 2.4, 1.1, 7.6, 1, '180', 0),
(90, 'Gerstenflocken', 66.1, 2.2, 10.3, 1.5, 1, '181', 0),
(91, 'Gerstotto, gekocht', 24.6, 1.3, 1.7, 2.2, 1, '', 1),
(92, 'Glarner Schabziger', 0.0, 0.0, 0.0, 0.5, 1, '', 1),
(93, 'Granatapfel', 14.3, 13.3, 2.3, 1.2, 1, '73', 0),
(94, 'Grapefruit', 8.0, 6.6, 0.9, 0.5, 1, '74', 0),
(95, 'Griessbrei', 11.8, 4.8, 0.3, 3.0, 1, '75', 0),
(96, 'Griessschnitte', 15.0, 4.0, 0.5, 6.4, 1, '76', 0),
(97, 'Grittibänz', 46.9, 2.8, 2.2, 11.1, 1, '182,183', 0),
(98, 'Gugelhopf Grossmutter Art', 33.3, 26.9, 3.1, 32.0, 1, '77', 0),
(99, 'Gurke', 2.0, 1.9, 0.8, 0.1, 1, '7,8,9', 0),
(100, 'Hackbraten', 8.1, 0.7, 0.6, 7.7, 1, '78', 0),
(101, 'Hackplätzli', 6.4, 1.2, 0.7, 9.1, 1, '79', 0),
(102, 'Haferbrei', 15.8, 5.7, 1.8, 4.6, 1, '80', 0),
(103, 'Haferflocken', 59.5, 1.0, 10.5, 7.5, 1, '81', 0),
(104, 'Hafergetränk', 7.8, 3.6, 0.2, 1.5, 2, '7,8,9', 0),
(105, 'Halbweissbrot', 46.4, 0.4, 3.7, 1.1, 1, '59', 0),
(106, 'Hartkaramellen, Hartbonbons', 95.0, 95.0, 0.0, 0.3, 1, '184,185', 0),
(107, 'Hartweizengriess trocken', 71.4, 1.0, 3.4, 1.4, 1, '', 1),
(108, 'Haselnuss', 10.1, 3.0, 9.7, 59.5, 1, '', 1),
(109, 'Heidelbeere, gefriergetrocknet', 56.4, 46.4, 24.4, 4.4, 1, '186', 1),
(110, 'Heidelbeere', 10.6, 10.0, 1.5, 0.3, 1, '186', 0),
(111, 'Himbeere', 5.8, 5.4, 4.3, 0.8, 1, '186', 0),
(112, 'Hirse  Korn geschält', 68.8, 1.5, 3.8, 3.9, 1, '', 1),
(113, 'Hirseflocken Vollkorn', 68.8, 1.6, 3.9, 3.9, 1, '187', 0),
(114, 'Hirsotto gekocht', 24.7, 1.1, 1.5, 3.0, 1, '188,189', 0),
(115, 'Hollandaisesauce', 9.3, 6.2, 0.1, 18.0, 1, '', 1),
(116, 'Holunderbeere schwarz', 7.4, 7.4, 4.0, 1.7, 1, '227', 0),
(117, 'Honig', 76.0, 76.0, 0.0, 0.0, 1, '239,240', 0),
(118, 'Hot Dog Brötchen', 29.6, 2.5, 1.9, 6.3, 1, '82,83', 0),
(119, 'Hummus', 9.4, 0.9, 5.1, 14.0, 1, '242', 0),
(120, 'Hüttenkäse, nature', 2.4, 2.2, 0.0, 4.5, 1, '', 1),
(121, 'Instant-Kartoffelstock zubereitet', 11.5, 1.8, 0.8, 2.8, 1, '228', 0),
(122, 'Jägersauce', 8.0, 2.5, 0.5, 1.8, 1, '', 1),
(123, 'Joghurt, gezuckert', 14.7, 13.8, 0.4, 3.4, 1, '84', 0),
(124, 'Joghurt, nature', 4.5, 4.5, 0.0, 3.6, 1, '84', 0),
(125, 'Joghurtalternative aus Soja mit Früchten ', 12.2, 10.9, 1.4, 1.8, 1, '84', 0),
(126, 'Joghurtalternative aus Soja nature', 1.5, 0.6, 1.5, 2.2, 1, '84', 0),
(127, 'Johannisbeere rot', 7.1, 6.6, 4.6, 0.7, 1, '227', 0),
(128, 'Johannisbeere schwarz', 9.7, 9.7, 5.8, 0.9, 1, '227', 0),
(129, 'Johannisbeerkuchen', 22.6, 10.6, 3.2, 11.7, 1, '85', 0),
(130, 'Kaffeerahm', 3.8, 3.8, 0.0, 15.0, 1, '', 1),
(131, 'Karotte / Rüebli gedämpft', 8.0, 6.3, 2.8, 0.4, 1, '192', 0),
(132, 'Karotte / Rüebli roh', 7.6, 6.0, 2.7, 0.4, 1, '192', 0),
(133, 'Karottensaft', 6.8, 4.8, 0.9, 0.1, 2, '7,8,9', 0),
(134, 'Kartoffelsalat', 12.8, 0.6, 1.7, 3.8, 1, '243', 0),
(135, 'Kartoffelsalat', 12.4, 0.7, 1.6, 2.2, 1, '', 1),
(136, 'Kartoffelstärke', 83.1, 0.0, 0.1, 0.1, 1, '', 1),
(137, 'Kartoffelstock', 13.2, 1.4, 1.6, 2.6, 1, '86', 0),
(138, 'Käsekuchen im  Blätterteig / Käsewähe', 11.7, 1.2, 0.5, 21.9, 1, '87', 0),
(139, 'Käsekuchen im Kuchenteig / Käsewähe', 14.5, 1.2, 0.6, 20.8, 1, '87', 0),
(140, 'Käseschnitte', 26.0, 1.0, 2.3, 12.1, 1, '88', 0),
(141, 'Kebab im Fladenbrot', 14.5, 2.2, 1.2, 3.6, 1, '89', 0),
(142, 'Ketchup', 26.0, 24.8, 0.9, 0.4, 1, '', 0),
(143, 'Kichererbsen, gekocht', 16.8, 0.9, 6.2, 2.0, 1, '229', 0),
(144, 'Kichererbsen, getrocknet', 44.3, 2.4, 15.5, 4.9, 1, '', 0),
(145, 'Kirschen gedünstet', 12.0, 9.2, 1.5, 0.5, 1, '', 0),
(146, 'Kirschen', 13.0, 10.0, 1.6, 0.4, 1, '230', 0),
(147, 'Kirschenkuchen im Blätterteig', 18.8, 8.4, 1.4, 6.9, 1, '90', 0),
(148, 'Kirschenkuchen im Kuchenteig', 19.5, 8.4, 1.5, 6.7, 1, '90', 0),
(149, 'Kiwi', 11.0, 8.9, 2.4, 0.6, 1, '91', 0),
(150, 'Knäckebrot Vollkorn', 61.1, 3.3, 12.4, 1.7, 1, '92', 0),
(151, 'Knäckebrot Vollkorn mit Leinsamen', 55.2, 3.1, 13.8, 5.7, 1, '92', 0),
(152, 'Knäckebrot Vollkorn mit Sesam', 55.3, 3.1, 12.4, 6.9, 1, '92', 0),
(153, 'Knoblauch', 24.5, 2.4, 3.0, 0.5, 1, '', 0),
(154, 'Knollensellerie gedämpft', 4.0, 1.6, 3.8, 0.3, 1, '', 0),
(155, 'Knollensellerie roh', 4.0, 1.6, 3.8, 0.3, 1, '', 0),
(156, 'Knöpflimehl', 71.3, 0.9, 3.3, 1.3, 1, '', 1),
(157, 'Kohlgemüse gekocht', 3.1, 2.6, 2.4, 0.4, 1, '', 1),
(158, 'Kohlgemüse roh', 3.2, 2.8, 2.5, 0.4, 1, '', 1),
(159, 'Kohlrabi, gedämpft', 3.9, 3.8, 1.5, 0.2, 1, '', 1),
(160, 'Kohlrabi, roh', 3.7, 3.6, 1.4, 0.2, 1, '', 1),
(161, 'Kokosmakronen', 35.1, 35.1, 15.7, 38.9, 1, '', 1),
(162, 'Kokosnuss', 4.8, 4.8, 9.0, 36.5, 1, '232', 0),
(163, 'Kokosnuss, getrocknet', 5.3, 5.3, 24.7, 61.3, 1, '', 0),
(164, 'Kokosnussmilch', 3.1, 1.7, 0.1, 21.3, 2, '7,8,9', 0),
(165, 'Konfitüre', 58.7, 58.7, 2.2, 0.5, 1, '93', 0),
(166, 'Konfitüre, energievermindert und mit Süssstoffen', 31.9, 31.9, 0.8, 0.5, 1, '93', 0),
(167, 'Kürbis', 4.7, 4.0, 2.2, 0.1, 1, '244', 0),
(168, 'Kürbisscheiben, paniert, zubereitet', 16.7, 4.1, 2.7, 5.8, 1, '', 1),
(169, 'Latte Macchiato, ungezuckert', 3.2, 3.2, 0.0, 2.8, 2, '7,8,9', 0),
(170, 'Lattich', 1.3, 1.3, 1.5, 0.3, 1, '', 1),
(171, 'Lauch, gedünstet', 3.9, 3.7, 3.0, 0.3, 1, '', 0),
(172, 'Lauch, roh', 3.7, 3.5, 2.8, 0.3, 1, '', 0),
(173, 'Laugenbrötli', 48.9, 2.2, 2.3, 4.9, 1, '94', 0),
(174, 'Laugengebäck', 72.1, 0.4, 0.7, 4.1, 1, '95', 0),
(175, 'Laugengipfeli', 39.4, 1.3, 1.9, 25.0, 1, '96', 1),
(176, 'Lebkuchen', 61.6, 41.2, 4.2, 13.8, 1, '97', 0),
(177, 'Limonade, gezuckert', 9.5, 9.5, 0.0, 0.0, 2, '7,8,9', 0),
(178, 'Linsen ganz und gekocht', 15.6, 0.4, 6.2, 0.5, 1, '', 0),
(179, 'Linsen ganz und getrocknet', 44.8, 1.1, 17.0, 1.5, 1, '', 0),
(180, 'Linsen geschält und gekocht', 19.0, 0.9, 4.3, 0.6, 1, '', 0),
(181, 'Linse geschält und getrocknet', 48.0, 2.2, 10.4, 1.5, 1, '', 0),
(182, 'Linzertorte', 43.7, 25.9, 3.7, 23.6, 1, '98', 0),
(183, 'Löffelbiscuit', 71.8, 34.9, 1.4, 8.3, 1, '99', 0),
(184, 'Madeleine mit Butter', 51.3, 27.8, 1.1, 24.8, 1, '', 0),
(185, 'Madeleine mit Pflanzenöl', 55.1, 27.8, 1.2, 20.0, 1, '', 0),
(186, 'Magermilch UHT', 4.7, 4.7, 0.0, 0.1, 1, '', 0),
(187, 'Magermilchpulver', 50.5, 50.5, 0.0, 1.0, 1, '', 1),
(188, 'Mailänderli', 53.2, 22.5, 1.4, 20.8, 1, '233,234,235', 0),
(189, 'Mais-Chips', 56.0, 2.4, 4.4, 27.2, 1, '', 0),
(190, 'Mais, gedämpft', 16.9, 3.7, 3.0, 1.3, 1, '192', 0),
(191, 'Mais, roh', 15.7, 3.4, 2.8, 1.2, 1, '192', 0),
(192, 'Maisgriess gekocht', 16.7, 0.3, 1.1, 0.2, 1, '', 1),
(193, 'Maisgriess trocken', 73.8, 1.5, 5.0, 1.1, 1, '', 1),
(194, 'Maiskölbchen', 21.0, 2.0, 4.2, 1.4, 1, '', 1),
(195, 'Maisstärke', 88.0, 0.0, 0.6, 0.0, 1, '', 1),
(196, 'Mandarine', 9.2, 8.6, 1.7, 0.2, 1, '41', 0),
(197, 'Mandel', 7.8, 6.6, 10.6, 52.1, 1, '', 0),
(198, 'Mango, getrocknet', 61.1, 59.9, 8.4, 2.2, 1, '', 0),
(199, 'Mango, roh', 14.3, 12.9, 1.6, 0.6, 1, '41', 0),
(200, 'Marmorkuchen', 42.6, 19.7, 1.3, 17.1, 1, '100', 0),
(201, 'Marzipan', 68.6, 68.6, 4.9, 17.6, 1, '', 0),
(202, 'Meringue', 94.0, 94.0, 0.0, 0.0, 1, '', 0),
(203, 'Milch ', 4.8, 4.8, 0.0, 2.9, 1, '7,8,9', 0),
(204, 'Milchkaffee ungezuckert', 1.4, 1.3, 0.1, 1.1, 1, '', 1),
(205, 'Milchreis', 19.0, 5.6, 0.2, 3.5, 1, '101', 0),
(206, 'Milchschokolade', 56.9, 55.2, 1.9, 31.1, 1, '7,8,9', 1),
(207, 'Milchschokolade mit Nüssen', 46.1, 44.4, 3.2, 38.2, 1, '', 1),
(208, 'Nektarine', 11.3, 8.8, 1.3, 0.3, 1, '102', 0),
(209, 'Nussgipfel aus Blätterteig', 36.2, 15.8, 2.7, 26.9, 1, '103', 0),
(210, 'Nussgipfel aus Hefeteig', 41.9, 18.4, 2.7, 12.6, 1, '103', 0),
(211, 'Nussschnecke aus Hefeteig', 54.9, 12.9, 3.8, 18.7, 1, '104', 0),
(212, 'Orange', 8.0, 7.6, 2.7, 0.2, 1, '105', 0),
(213, 'Orangensaft', 10.0, 10.0, 0.3, 0.1, 2, '7,8,9', 0),
(214, 'Papaya', 9.5, 9.5, 1.8, 0.1, 1, '106', 0),
(215, 'Paprika Gewürz', 34.9, 33.2, 20.9, 13.0, 1, '', 1),
(216, 'Paranuss', 4.2, 2.3, 7.5, 66.5, 1, '', 1),
(217, 'Pariserbrot', 51.2, 0.5, 2.9, 0.9, 1, '245,246', 0),
(218, 'Passionsfrucht', 10.9, 8.5, 6.8, 3.0, 1, '107', 0),
(219, 'Peperoni grün und gedünstet', 3.2, 3.1, 2.5, 0.4, 1, '', 0),
(220, 'Peperoni grün und roh', 2.6, 2.5, 2.0, 0.3, 1, '', 0),
(221, 'Peperoni rot und gedünstet', 6.4, 6.2, 2.5, 0.4, 1, '', 0),
(222, 'Peperoni rot und roh', 5.2, 5.1, 2.0, 0.4, 1, '', 0),
(223, 'Pfefferminze', 5.3, 5.2, 3.0, 0.7, 1, '', 0),
(224, 'Pfirsich', 8.9, 8.0, 1.9, 0.1, 1, '108', 0),
(225, 'Pfirsich, aus Konserve in Sirup', 18.6, 17.9, 1.6, 0.1, 1, '108', 0),
(226, 'Pfirsich, aus Konserve mit Süssungsmittel', 8.1, 7.3, 1.7, 0.1, 1, '108', 0),
(227, 'Pflaume gedünstet', 10.1, 8.6, 1.6, 0.2, 1, '', 0),
(228, 'Pflaume getrocknet', 55.4, 38.1, 5.1, 0.4, 1, '', 0),
(229, 'Pflaume roh', 10.2, 8.8, 1.6, 0.2, 1, '', 0),
(230, 'Pflaumenkuchen im Blätterteig', 16.9, 7.6, 1.4, 6.8, 1, '', 0),
(231, 'Pflaumenkuchen im Kuchenteig', 17.6, 7.6, 1.5, 6.6, 1, '', 0),
(232, 'Pilz gedünstet', 0.7, 0.2, 6.0, 0.4, 1, '', 0),
(233, 'Pilz roh', 0.6, 0.2, 4.9, 0.4, 1, '', 0),
(234, 'Pilzrisotto zubereitet', 18.5, 0.5, 1.5, 3.9, 1, '', 0),
(235, 'Pilzsuppe', 5.5, 2.0, 0.0, 1.2, 1, '', 0),
(236, 'Pistazie', 17.6, 7.7, 10.0, 45.4, 1, '109', 0),
(237, 'Plätzli gebraten', 0.1, 0.0, 0.0, 3.1, 1, '', 0),
(238, 'Plätzli paniert und gebraten', 10.1, 0.5, 0.6, 10.8, 1, '', 0),
(239, 'Plätzli roh', 0.1, 0.0, 0.0, 2.7, 1, '', 0),
(240, 'Pommes Chips', 49.3, 2.5, 3.8, 34.8, 1, '', 0),
(241, 'Pommes Chips, fettreduziert', 59.2, 3.0, 4.5, 22.1, 1, '', 0),
(242, 'Pommes Frites', 33.0, 1.6, 2.5, 9.1, 1, '', 1),
(243, 'Popcorn', 62.9, 1.2, 15.0, 4.2, 1, '', 0),
(244, 'Portwein, 18.5 vol%', 12.0, 12.0, 0.0, 0.0, 1, '', 0),
(245, 'Preiselbeere', 6.2, 6.1, 2.9, 0.5, 1, '', 0),
(246, 'Prussien', 53.8, 27.4, 1.2, 22.4, 1, '', 0),
(247, 'Pudding Caramel', 23.0, 20.1, 0.1, 2.1, 1, '', 0),
(248, 'Pudding Schokolade', 21.0, 12.1, 1.0, 2.6, 1, '', 0),
(249, 'Pudding Vanille', 18.0, 10.4, 0.1, 2.1, 1, '', 0),
(250, 'Radieschen', 2.1, 2.1, 1.6, 0.1, 1, '', 0),
(251, 'Rahm', 3.4, 3.4, 0.0, 25.4, 1, '', 0),
(252, 'Rahmglace, Frucht', 24.7, 23.7, 0.0, 8.0, 1, '', 0),
(253, 'Rahmkaramellen', 79.3, 79.3, 0.0, 3.6, 1, '', 0),
(254, 'Rande gedämpft', 10.0, 10.0, 3.0, 0.1, 1, '', 0),
(255, 'Rande roh', 8.4, 8.4, 2.5, 0.1, 1, '', 0),
(256, 'Reibkäse', 0.0, 0.0, 0.0, 32.1, 1, '', 1),
(257, 'Reisgetränk', 10.3, 2.8, 0.1, 1.3, 1, '', 0),
(258, 'Rettich', 2.6, 2.6, 1.2, 0.3, 1, '190', 0),
(259, 'Rhabarber', 1.5, 1.5, 2.5, 0.2, 1, '191', 0),
(260, 'Rhabarberkompott gezuckert', 18.8, 18.8, 2.1, 0.2, 1, '', 1),
(261, 'Rhabarberkuchen', 11.1, 2.8, 2.0, 6.8, 1, '', 1),
(262, 'Risotto', 24.9, 0.5, 0.5, 1.6, 1, '192', 0),
(263, 'Riz Casimir', 16.0, 3.2, 1.1, 3.4, 1, '193', 0),
(264, 'Roggenbrot mit Sauerteig', 41.5, 3.8, 7.7, 0.9, 1, '', 0),
(265, 'Rollgerste', 71.0, 2.2, 4.6, 1.4, 1, '', 1),
(266, 'Rollmops', 19.6, 18.0, 0.0, 15.9, 1, '', 1),
(267, 'Rollschinken', 1.2, 1.2, 0.0, 10.6, 1, '', 1),
(268, 'Rollschinken, gekocht (ohne Zusatz von Fett und Salz)', 1.4, 1.4, 0.0, 9.9, 1, '', 1),
(269, 'Rosenkohl gedämpft', 3.0, 2.5, 3.6, 0.4, 1, '', 1),
(270, 'Rosenkohl roh', 3.3, 2.8, 4.0, 0.4, 1, '', 1),
(271, 'Rosine getrocknet', 73.2, 70.3, 4.2, 0.9, 1, '194', 0),
(272, 'Rosmarin', 7.7, 7.6, 2.9, 2.5, 1, '', 1),
(273, 'Rotkohl, gedünstet', 3.7, 3.4, 2.3, 0.2, 1, '', 0),
(274, 'Rotkohl, roh', 4.3, 3.9, 2.6, 0.2, 1, '', 0),
(275, 'Ruchbrot', 44.3, 0.5, 4.1, 1.2, 1, '', 0),
(276, 'Rucola', 2.1, 2.1, 1.6, 0.7, 1, '', 0),
(277, 'Rüeblitorte / Rüeblikuchen', 25.8, 19.6, 3.9, 16.4, 1, '110', 0),
(278, 'Rührei, zubereitet', 1.3, 1.3, 0.0, 10.8, 1, '111', 0),
(279, 'Russischer Salat', 9.8, 1.9, 2.2, 15.9, 1, '78', 0),
(280, 'Schafmilch', 4.7, 4.7, 0.0, 7.1, 1, '', 1),
(281, 'Schaumwein / Sekt / Prosecco / Champagner', 1.5, 1.5, 0.0, 0.0, 1, '195', 0),
(282, 'Schinkengipfeli', 26.0, 0.7, 1.4, 20.9, 1, '112,236,237', 0),
(283, 'Schnittlauch', 1.9, 1.9, 2.3, 0.6, 1, '', 1),
(284, 'Schoggibrötli', 49.7, 16.3, 2.2, 14.3, 1, '113', 0),
(285, 'Schokolade weiss', 55.8, 55.3, 0.2, 35.2, 1, '196', 0),
(286, 'Schokoladencrème', 20.0, 18.7, 0.5, 3.0, 1, '196', 0),
(287, 'Schokoladengugelhopf', 46.3, 22.9, 1.9, 18.4, 1, '114', 0),
(288, 'Schokoladenpulver', 71.3, 70.6, 10.5, 7.8, 1, '', 0),
(289, 'Schwarzwälder Kirschtorte', 21.4, 12.0, 0.9, 16.1, 1, '115', 0),
(290, 'Semmeli', 48.5, 0.4, 3.0, 0.9, 1, '', 0),
(291, 'Silberzwiebel', 4.9, 3.5, 1.3, 0.2, 1, '197', 0),
(292, 'Sirup unverdünnt', 91.8, 91.4, 0.9, 0.2, 1, '', 0),
(293, 'Sirup verdünnt im Verhältnis 1:6', 13.5, 13.4, 0.1, 0.0, 1, '7,8,9', 0),
(294, 'Sojabohne', 8.7, 6.8, 22.0, 18.3, 1, '', 1),
(295, 'Sojagetränk', 1.5, 1.4, 0.6, 2.1, 1, '', 1),
(296, 'Sojasauce', 4.1, 0.4, 0.8, 0.6, 1, '', 1),
(297, 'Sojasprossen', 4.7, 4.6, 2.4, 1.0, 1, '', 1),
(298, 'Sonnenblumenkerne', 3.6, 3.4, 8.0, 54.5, 1, '', 1),
(299, 'Sorbet Frucht', 32.1, 32.1, 0.4, 0.0, 1, '', 1),
(300, 'Spargel, gedämpft', 3.1, 3.0, 1.6, 0.2, 1, '198', 0),
(301, 'Spargel, roh', 3.3, 3.2, 1.7, 0.2, 1, '198', 0),
(302, 'Spinat, gedämpft', 1.6, 0.1, 2.3, 0.8, 1, '199', 1),
(303, 'Spinat', 1.3, 0.1, 1.9, 0.6, 1, '199', 0),
(304, 'Spitzbueb', 60.3, 30.9, 1.9, 25.6, 1, '200', 0),
(305, 'Stachelbeere', 7.1, 7.1, 3.0, 0.2, 1, '', 1),
(306, 'Stangensellerie', 2.4, 1.3, 2.2, 0.4, 1, '201', 0),
(307, 'Surimi', 11.8, 2.1, 0.0, 4.9, 1, '', 1),
(308, 'Süsskartoffel', 17.1, 4.2, 3.0, 0.1, 1, '202', 0),
(309, 'Teigwaren, gekocht', 25.0, 1.3, 1.3, 1.1, 1, '116', 0),
(310, 'Teigwaren(trocken)', 69.9, 3.7, 3.4, 2.8, 1, '', 1),
(311, 'Teigwaren Vollkorn, gekocht', 26.8, 0.3, 5.4, 1.2, 1, '116', 0),
(312, 'Teigwaren Vollkorn (trocken)', 60.6, 0.7, 11.5, 2.5, 1, '', 1),
(313, 'Teigwarensalat', 12.7, 1.0, 1.3, 6.1, 1, '117', 0),
(314, 'Teilentrahmte Milch pasteurisiert', 4.7, 4.7, 0.0, 2.8, 1, '', 0),
(315, 'Teilentrahmte Milch UHT', 4.6, 4.6, 0.0, 2.8, 1, '', 0),
(316, 'Tessinerbrot', 57.1, 0.6, 2.9, 5.2, 1, '118', 0),
(317, 'Toastbrot', 45.7, 2.7, 2.2, 10.4, 1, '224,225,226', 0),
(318, 'Toastbrot, Vollkorn', 43.7, 4.2, 7.4, 4.9, 1, '224,225,226', 0),
(319, 'Toastbrot dunkel oder Mehrkorn', 45.6, 4.0, 5.2, 4.7, 1, '224,225,226', 0),
(320, 'Tofu fest', 2.9, 0.6, 0.0, 8.5, 1, '', 0),
(321, 'Tofu weich', 1.5, 1.1, 0.6, 2.9, 1, '', 0),
(322, 'Tomate gedünstet', 4.0, 3.9, 1.5, 0.3, 1, '', 0),
(323, 'Tomate, aus Konserve', 3.0, 2.9, 1.0, 0.2, 1, '203', 0),
(324, 'Tomate, getrocknet', 29.2, 13.7, 21.7, 0.5, 1, '204', 0),
(325, 'Tomate, roh', 3.3, 3.2, 1.2, 0.3, 1, '205,206', 0),
(326, 'Tomatenpüree', 12.9, 12.4, 2.8, 0.2, 1, '', 1),
(327, 'Tomatensaft', 3.0, 2.1, 0.1, 0.1, 1, '7', 0),
(328, 'Tomatensauce', 9.7, 4.1, 1.9, 2.1, 1, '', 1),
(329, 'Tomatensuppe', 6.6, 3.5, 0.7, 1.1, 1, '207', 0),
(330, 'Weintraube', 15.2, 14.6, 1.5, 0.3, 1, '208,209', 0),
(331, 'Traubensaft', 17.3, 17.0, 0.1, 0.1, 1, '7,8', 0),
(332, 'Traubenzucker', 99.8, 99.8, 0.0, 0.0, 1, '210,211,212', 0),
(333, 'Vollkornreiswaffel', 81.5, 1.5, 4.2, 2.8, 1, '213,214', 0),
(334, 'Vollmilch, pasteurisiert', 4.7, 4.7, 0.0, 4.0, 1, '7,8,9', 0),
(335, 'Vollmilch, UHT', 4.6, 4.6, 0.0, 4.1, 1, '7,8,9', 0),
(336, 'Vollmilchpulver', 35.1, 35.1, 0.0, 26.2, 1, '', 1),
(337, 'Vollrahm, pasteurisiert', 3.1, 3.1, 0.0, 34.8, 1, '', 1),
(338, 'Vollrahm, UHT', 3.1, 3.1, 0.0, 34.9, 1, '', 1),
(339, 'Vorzugsbutter', 0.7, 0.6, 0.0, 82.3, 1, '', 1),
(340, 'Walliser Roggenbrot', 42.6, 3.4, 8.8, 1.0, 1, '59', 0),
(341, 'Wassereis', 22.0, 22.0, 0.0, 0.0, 1, '', 1),
(342, 'Wassermelone', 8.3, 7.9, 0.5, 0.0, 1, '', 0),
(343, 'Weichkaramellen Bonbons', 71.1, 71.1, 0.0, 17.2, 1, '', 0),
(344, 'Weissbrot', 48.9, 0.2, 2.5, 0.8, 1, '', 0),
(345, 'Weisskohl / Weisskabis', 4.6, 4.2, 3.5, 0.6, 1, '', 0),
(346, 'Weizenflocken', 59.6, 0.7, 13.3, 1.8, 1, '', 0),
(347, 'Weizenotto, gekocht', 26.1, 1.1, 5.9, 3.0, 1, '', 0),
(348, 'Weizenstärke', 85.8, 0.0, 1.2, 0.1, 1, '', 0),
(349, 'Weizenvollkornbrot', 38.3, 0.7, 6.9, 1.3, 1, '', 0),
(350, 'Wermut, 15 vol%', 13.5, 13.5, 0.0, 0.0, 1, '', 0),
(351, 'Ziegenmilch', 4.2, 4.2, 0.0, 3.2, 1, '', 0),
(352, 'Ziger weiss', 3.3, 3.3, 0.0, 7.2, 1, '', 0),
(353, 'Zimt', 56.0, 55.4, 24.4, 3.2, 1, '', 1),
(354, 'Zimtstern', 50.9, 50.3, 5.6, 25.9, 1, '218,219,220', 0),
(355, 'Zitronat', 70.0, 70.0, 2.0, 0.4, 1, '', 1),
(356, 'Zitrone', 2.9, 2.5, 2.0, 0.5, 1, '', 1),
(357, 'Zitrusfrüchte', 8.0, 7.4, 2.1, 0.3, 1, '', 1),
(358, 'Zucchetti, gedämpft ', 2.2, 2.1, 1.1, 0.2, 1, '72', 0),
(359, 'Zucchetti, gedünstet', 2.4, 2.3, 1.2, 0.2, 1, '72', 0),
(360, 'Zucchetti, roh', 2.0, 1.9, 1.0, 0.2, 1, '72', 0),
(361, 'Zucchettischeiben paniert', 13.5, 2.1, 1.5, 5.5, 1, '221,222,223', 0),
(362, 'Zucker, braun', 97.6, 97.6, 0.0, 0.0, 1, '120,162', 0),
(363, 'Zucker, weiss  ', 99.9, 99.9, 0.0, 0.0, 1, '120,162', 0),
(364, 'Zuckermais aus Konserve', 18.2, 6.9, 2.3, 1.2, 1, '199', 0),
(365, 'Honigmelone', 14.8, 10.6, 1.3, 0.1, 1, '241', 0),
(366, 'Zuger Kirschtorte', 34.6, 27.0, 1.5, 18.7, 1, '', 0),
(367, 'Zwetschge', 8.8, 8.8, 2.3, 0.1, 1, '', 0),
(368, 'Zwetschgenkuchen / Zwetschgenwähe', 16.0, 7.6, 1.9, 6.7, 1, '', 0),
(369, 'Zwieback', 74.6, 14.2, 2.9, 7.8, 1, '', 0),
(370, 'Zwieback Vollkorn', 61.2, 13.8, 8.3, 9.1, 1, '', 0),
(371, 'Zwiebel gedünstet', 7.0, 5.4, 2.2, 0.7, 1, '', 0),
(372, 'Zwiebel geröstet', 14.9, 11.4, 4.5, 1.5, 1, '', 0),
(373, 'Zwiebel roh', 6.3, 4.8, 1.9, 0.6, 1, '', 0),
(374, 'Zwiebelkuchen mit Blätterteig', 12.6, 3.6, 1.5, 10.9, 1, '', 1),
(375, 'Zwiebelkuchen mit Kuchenteig', 14.6, 3.6, 1.6, 10.1, 1, '', 1),
(376, 'Rivella Rot', 9.0, 9.0, 0.0, 0.0, 2, '66,67', 0),
(377, 'Rivella Blau', 1.5, 1.5, 0.0, 0.0, 2, '66,67', 0),
(378, 'Coca Cola', 10.6, 10.6, 0.0, 0.0, 2, '7,8,9', 0),
(379, 'Coca‑Cola Cherry', 10.6, 10.6, 0.0, 0.0, 2, '7,8,9', 0),
(380, 'Coca‑Cola Vanilla', 11.1, 11.1, 0.0, 0.0, 2, '7,8,9', 0),
(381, 'Pepsi', 12.0, 11.0, 0.0, 0.0, 2, '66,67', 0),
(382, 'McDonals Hamburger', 26.0, 6.0, 1.0, 8.0, 1, '121', 0),
(383, 'McDonalds Big Mac', 18.0, 4.0, 1.0, 11.0, 1, '122', 0),
(384, 'McDonalds Double Big Mac', 14.0, 3.0, 1.0, 13.0, 1, '123', 0),
(385, 'McDonalds Cheesburger Royal', 17.0, 5.0, 1.0, 13.0, 1, '124', 0),
(386, 'McDonalds Double Cheeseburger Royal', 12.0, 3.0, 1.0, 15.0, 1, '125', 0),
(387, 'McDonalds Big Tasty', 13.0, 3.0, 0.8, 14.0, 1, '126', 0),
(388, 'McDonalds Big Tasty Double', 10.0, 3.0, 0.6, 16.0, 1, '127', 0),
(389, 'McDonalds Cheesburger', 24.0, 6.0, 1.2, 10.0, 1, '128', 0),
(390, 'McDonalds Double Cheesburger', 17.0, 5.0, 0.9, 13.0, 1, '129', 0),
(391, 'McDonalds McChicken', 22.0, 4.0, 1.0, 8.0, 1, '130', 0),
(392, 'McDonalds Chicken McNuggets', 20.0, 1.0, 1.0, 11.0, 1, '131,132,133', 0),
(393, 'McDonalds Chicken Wings', 3.0, 0.0, 1.0, 15.0, 1, '134', 0),
(394, 'McDonalds Pommes Frites', 36.0, 0.0, 4.0, 14.0, 1, '135,136,137', 0),
(395, 'McDonalds Filet-O-Fish', 25.0, 4.0, 1.1, 10.0, 1, '138', 0),
(396, 'McDonalds Cappuccino Regular', 5.0, 5.0, 0.0, 3.0, 1, '139,140', 0),
(397, 'McDonalds Latte Macchiato', 4.0, 4.0, 0.0, 3.0, 1, '141,142', 0),
(398, 'McDonalds Heisse Schokolade', 10.0, 10.0, 0.7, 4.0, 1, '143', 0),
(399, 'McDonalds McFlurry M&M’s', 32.0, 28.0, 1.0, 6.0, 1, '144,145', 0),
(400, 'McDonalds McFlurry Daim', 29.0, 26.0, 0.3, 8.0, 1, '146,147', 0),
(401, 'McDonalds McFlurry Nature', 23.0, 20.0, 0.1, 3.6, 1, '148,149', 0),
(402, 'McDonalds Frappé Vanille', 21.0, 20.0, 0.1, 2.0, 1, '150,151', 0),
(403, 'McDonalds Frappé Erdbeer', 22.0, 20.0, 0.1, 2.0, 1, '150,151', 0),
(404, 'McDonalds Frappé Banane', 22.0, 20.0, 0.1, 2.0, 1, '150,151', 0),
(405, 'McDonalds Apfeltasche', 35.0, 11.0, 2.0, 13.0, 1, '231', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items_servings`
--

CREATE TABLE `items_servings` (
  `ID` int(11) NOT NULL,
  `ServingName` varchar(255) NOT NULL,
  `ServingSize` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `items_servings`
--

INSERT INTO `items_servings` (`ID`, `ServingName`, `ServingSize`) VALUES
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
(246, '1/4 Pariserbrot', 75);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items_statuses`
--

CREATE TABLE `items_statuses` (
  `ID` int(11) NOT NULL,
  `StatusName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `items_statuses`
--

INSERT INTO `items_statuses` (`ID`, `StatusName`) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Under review');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items_units`
--

CREATE TABLE `items_units` (
  `ID` int(11) NOT NULL,
  `UnitName` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `items_units`
--

INSERT INTO `items_units` (`ID`, `UnitName`) VALUES
(1, 'g'),
(2, 'ml');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `info_text`
--
ALTER TABLE `info_text`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `items_food`
--
ALTER TABLE `items_food`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `items_servings`
--
ALTER TABLE `items_servings`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `items_statuses`
--
ALTER TABLE `items_statuses`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `items_units`
--
ALTER TABLE `items_units`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `info_text`
--
ALTER TABLE `info_text`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `items_food`
--
ALTER TABLE `items_food`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT für Tabelle `items_servings`
--
ALTER TABLE `items_servings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT für Tabelle `items_statuses`
--
ALTER TABLE `items_statuses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `items_units`
--
ALTER TABLE `items_units`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
